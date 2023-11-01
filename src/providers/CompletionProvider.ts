import { Position, CancellationToken, TextDocument, commands, CompletionItem, CompletionItemProvider, CompletionItemKind, CompletionContext, CompletionList, ProviderResult } from "vscode";
import { VerilogAIndexer } from "../indexer";
import { VerilogASymbol } from "../symbol";


export class VerilogACompletionProvider implements CompletionItemProvider {
    private indexer: VerilogAIndexer;
    private globals: CompletionItem[];
    private known_types: CompletionItem[];
    

    constructor(indexer: VerilogAIndexer) {
        this.indexer = indexer;
        this.globals = [
            new CompletionItem("begin", CompletionItemKind.Module),
            new CompletionItem("end", CompletionItemKind.Module),
            new CompletionItem("parameter", CompletionItemKind.Constant),
            new CompletionItem("localparam", CompletionItemKind.Constant),
            new CompletionItem("logic", CompletionItemKind.Variable),
        ];
        this.known_types = [
            new CompletionItem("input", CompletionItemKind.Interface),
            new CompletionItem("output", CompletionItemKind.Interface),
        ];
    }

    provideCompletionItems(
        document: TextDocument,
        position: Position, 
        token: CancellationToken, 
        context: CompletionContext
        ): Promise<CompletionItem[]> {
            return new Promise((resolve) => {
                let completionItems: CompletionItem[] = new Array<CompletionItem>();
                completionItems = completionItems.concat(this.globals);
                var lookupRange = document.getWordRangeAtPosition(position);
                var lookupTerm = document.getText(lookupRange);
    
                // get all DocumentSymbolproviders and step to each of them
                return commands
                    .executeCommand('vscode.executeDocumentSymbolProvider', document.uri)
                    .then((symbols: VerilogASymbol[]) => {

                        symbols.forEach((value: VerilogASymbol) => {
                            console.log(value.containerName);
                            completionItems.push(this.constructModuleItem(value));
                        });
                    })
                    .then((_) => {
                        return resolve(completionItems);
                    });
        });
        
    }

    // Contruct completion item for all system verilog module items
    constructModuleItem(symbol: VerilogASymbol): CompletionItem {
        let completionItem = new CompletionItem(symbol.name, getCompletionItemKind(symbol.containerName));
        return completionItem;
    }
}

// See test/SymbolKind_icons.png for an overview of the icons
// Text = 0,
// Method = 1,
// Function = 2,
// Constructor = 3,
// Field = 4,
// Variable = 5,
// Class = 6,
// Interface = 7,
// Module = 8,
// Property = 9,
// Unit = 10,
// Value = 11,
// Enum = 12,
// Keyword = 13,
// Snippet = 14,
// Color = 15,
// Reference = 17,
// File = 16,
// Folder = 18,
// EnumMember = 19,
// Constant = 20,
// Struct = 21,
// Event = 22,
// Operator = 23,
// TypeParameter = 24,
// User = 25,
// Issue = 26,

export function getCompletionItemKind(name: String): CompletionItemKind {
    switch (name) {
        case 'parameter':
        case 'localparam':
            return CompletionItemKind.Constant;
        case 'package':
        case 'import':
            return CompletionItemKind.File;
        case 'wire':
        case 'reg':
        case 'logic':
            return CompletionItemKind.Variable;
        case 'string':
            return CompletionItemKind.Text;
        case 'class':
            return CompletionItemKind.Class;
        case 'task':
            return CompletionItemKind.Method;
        case 'function':
            return CompletionItemKind.Function;
        case 'interface':
            return CompletionItemKind.Interface;
        case 'event':
            return CompletionItemKind.Event;
        case 'struct':
            return CompletionItemKind.Struct;
        case 'program':
        case 'module':
        default:
            return CompletionItemKind.Reference;
    }
}





