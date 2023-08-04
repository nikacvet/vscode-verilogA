// entry point and setup of vscode extension
import { workspace, window, languages, commands, StatusBarAlignment, DocumentSelector, ExtensionContext, ProgressLocation, Location, Range, Uri } from 'vscode'; // prettier-ignore
import { LanguageClient, ServerOptions, TransportKind, LanguageClientOptions } from 'vscode-languageclient/node';
import * as path from 'path';
import { VerilogADefinitionProvider } from './providers/DefinitionProvider';
import { VerilogADocumentSymbolProvider } from './providers/DocumentSymbolProvider';
import { VerilogAFormatProvider } from './providers/FormatProvider';
import { VerilogAHoverProvider } from './providers/HoverProvider';
import { VerilogAWorkspaceSymbolProvider } from './providers/WorkspaceSymbolProvider';
import { VerilogAReferenceProvider } from './providers/ReferenceProvider';
// import { SystemVerilogModuleInstantiator } from './providers/ModuleInstantiator';
import { VerilogAParser } from './parser';
import { VerilogAIndexer } from './indexer';
import { VerilogASymbol } from './symbol';

import { VerilogACompletionProvider } from './providers/CompletionProvider';

// The LSP's client
let client: LanguageClient;

// Flag to determine when to close the `Progress` window after `compile` command is fired.
let closeWindowProgress = true;

const selector: DocumentSelector = [
    { scheme: 'file', language: 'veriloga' }
];

let indexer: VerilogAIndexer | undefined = undefined;
let saveIndexTimeout: NodeJS.Timeout | undefined;

function queuedSaveIndex(context: ExtensionContext) {
    if (saveIndexTimeout !== undefined) {
        clearTimeout(saveIndexTimeout);
    }

    saveIndexTimeout = setTimeout(function () {
        saveIndex(context);
    }, 10000);
}

function saveIndex(context: ExtensionContext): void {
    saveIndexTimeout = undefined;

    const syms = [...indexer.symbols];
    context.workspaceState.update('symbols', syms);
}

export function activate(context: ExtensionContext) {
    // Output Channel
    const outputChannel = window.createOutputChannel('Verilog A');

    // Status Bar
    const statusBar = window.createStatusBarItem(StatusBarAlignment.Left, 0);
    statusBar.text = 'Verilog A: Activating';
    statusBar.show();
    statusBar.command = 'veriloga.build_index';

    // Back-end Classes
    const parser = new VerilogAParser();
    indexer = new VerilogAIndexer(statusBar, parser, outputChannel);

    // Providers
    const docProvider = new VerilogADocumentSymbolProvider(parser, indexer);
    const symProvider = new VerilogAWorkspaceSymbolProvider(indexer);
    const defProvider = new VerilogADefinitionProvider();
    const hoverProvider = new VerilogAHoverProvider();
    const formatProvider = new VerilogAFormatProvider(outputChannel);
    // const moduleInstantiator = new SystemVerilogModuleInstantiator(formatProvider, symProvider);
    const referenceProvider = new VerilogAReferenceProvider(defProvider);
    const completionProvider = new VerilogACompletionProvider(indexer);

    context.subscriptions.push(statusBar);
    context.subscriptions.push(languages.registerDocumentSymbolProvider(selector, docProvider));
    context.subscriptions.push(languages.registerDefinitionProvider(selector, defProvider));
    context.subscriptions.push(languages.registerHoverProvider(selector, hoverProvider));
    context.subscriptions.push(languages.registerWorkspaceSymbolProvider(symProvider));
    context.subscriptions.push(languages.registerDocumentRangeFormattingEditProvider(selector, formatProvider));
    context.subscriptions.push(languages.registerDocumentFormattingEditProvider(selector, formatProvider));
    context.subscriptions.push(languages.registerReferenceProvider(selector, referenceProvider));
    context.subscriptions.push(languages.registerCompletionItemProvider(selector, completionProvider));

    const buildHandler = () => {
        indexer.build_index().then((_) => queuedSaveIndex(context));
    };
    // const instantiateHandler = () => {
    //     moduleInstantiator.instantiateModule();
    // };

    context.subscriptions.push(commands.registerCommand('veriloga.build_index', buildHandler));
    // context.subscriptions.push(commands.registerCommand('systemverilog.auto_instantiate', instantiateHandler));
    // context.subscriptions.push(commands.registerCommand('systemverilog.compile', compileOpenedDocument));

    // Background Processes
    context.subscriptions.push(
        workspace.onDidSaveTextDocument((doc) => {
            indexer.onChange(doc);
            queuedSaveIndex(context);
        })
    );
    context.subscriptions.push(
        window.onDidChangeActiveTextEditor((editor) => {
            if (editor !== undefined) {
                indexer.onChange(editor.document);
                queuedSaveIndex(context);
            }
        })
    );
    const watcher = workspace.createFileSystemWatcher('**/*.{va}', false, false, false);
    context.subscriptions.push(
        watcher.onDidCreate((uri) => {
            indexer.onCreate(uri);
            queuedSaveIndex(context);
        })
    );
    context.subscriptions.push(
        watcher.onDidDelete((uri) => {
            indexer.onDelete(uri);
            queuedSaveIndex(context);
        })
    );
    context.subscriptions.push(
        watcher.onDidChange((uri) => {
            indexer.onDelete(uri);
            queuedSaveIndex(context);
        })
    );
    context.subscriptions.push(watcher);

    const settings = workspace.getConfiguration();
    try {
        loadIndex();
    } catch (error) {
        if (settings.get('veriloga.disableIndexing')) {
            statusBar.text = 'Verilog A: Indexing disabled on boot';
        } else {
            commands.executeCommand('veriloga.build_index');
        }
    }

    function loadIndex(): void {
        const symbols: Array<any> = context.workspaceState.get('symbols');
        let numSymbols = 0;
        if (symbols) {
            symbols.forEach((entry) => {
                // Hack because typecasting didn't work
                const syms: VerilogASymbol[] = new Array<VerilogASymbol>();
                entry[1].forEach((s) => {
                    syms.push(
                        new VerilogASymbol(
                            s.name,
                            s.kind,
                            s.containerName,
                            new Location(
                                Uri.file(entry[0]),
                                new Range(
                                    s.location.range[0].line,
                                    s.location.range[0].character,
                                    s.location.range[1].line,
                                    s.location.range[1].character
                                )
                            )
                        )
                    );
                    numSymbols += 1;
                });
                indexer.symbols.set(entry[0], syms);
                indexer.symbolsCount = numSymbols;
            });
            statusBar.text = `Verilog A: ${numSymbols} indexed objects`;
        } else {
            throw new Error('Could not load index');
        }
    }

    /**
        Sends a notification to the LSP to compile the opened document.
        Keeps the `Progress` window opened until `extensionLanguageClient.closeWindowProgress` is set to true or
        the interval iterations count reaches the maximum value.
        `closeWindowProgress` is updated to true when a notification is sent to the client from LSP.
    */
    // function compileOpenedDocument(): void {
    //     const { document } = window.activeTextEditor;
    //     closeWindowProgress = false;
    //     if (!document) {
    //         window.showErrorMessage('There is no open document!');
    //         return;
    //     }
    //     Promise.resolve(
    //         window.withProgress(
    //             {
    //                 location: ProgressLocation.Notification,
    //                 title: 'Verilog A document compiling...',
    //                 cancellable: true
    //             },
    //             async (_progress, _token) => {
    //                 client.sendNotification('compileOpenedDocument', document.uri.toString());
    //                 let intervalCount = 0;
    //                 const interval = setInterval(() => {
    //                     if (closeWindowProgress || intervalCount > 5) {
    //                         clearInterval(interval);
    //                     }
    //                     intervalCount += 1;
    //                 }, 500);
    //             }
    //         )
    //     ).catch((error) => {
    //         outputChannel.appendLine(error);
    //         window.showErrorMessage(error);
    //     });
    // }

    /** Starts the `LanguageClient` */

    // Point to the path of the server's module
    const serverModule = context.asAbsolutePath(path.join('dist', 'server', 'server.js'));

    // If the extension is launched in debug mode then the debug server options are used
    // Otherwise the run options are used
    // --inspect=6009: runs the server in Node's Inspector mode so VS Code can attach to the server for debugging
    const serverOptions: ServerOptions = {
        run: {
            module: serverModule,
            transport: TransportKind.ipc
        },
        debug: {
            module: serverModule,
            transport: TransportKind.ipc,
            options: { execArgv: ['--nolazy', '--inspect=6009'] }
        }
    };

    // Options to control the language client
    const clientOptions: LanguageClientOptions = {
    };

    // Create the language client and start the client
    client = new LanguageClient('veriloga', 'Verilog A Language Server', serverOptions, clientOptions);

    // Start the client, this will also launch the server
    client.start();


    client.onReady().then(() => {
        try {
            client.sendNotification('workspaceRootPath', workspace.workspaceFolders[0].uri.fsPath);
        } catch {
            // No workspace is open
        }

        // Update `closeWindowProgress` to true when the client is notified by the server
        client.onNotification('closeWindowProgress', () => {
            closeWindowProgress = true;
        });

        // Notify the server that the workspace configuration has been changed
        workspace.onDidChangeConfiguration(() => {
            client.sendNotification('onDidChangeConfiguration');
        });
    });
}

export function deactivate(context: ExtensionContext): Thenable<void> | undefined {
    if (!client) {
        return undefined;
    }

    queuedSaveIndex(context);

    return client.stop();
}
