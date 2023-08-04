import { DocumentSymbolProvider, SymbolInformation, CancellationToken, TextDocument, Uri, SymbolKind, Location, Position, workspace } from 'vscode' // prettier-ignore
import { VerilogAIndexer } from '../indexer';
import { VerilogAParser } from '../parser';
import { getSymbolKind, VerilogASymbol } from '../symbol';

export class VerilogADocumentSymbolProvider implements DocumentSymbolProvider {
    private parser: VerilogAParser;
    private indexer: VerilogAIndexer;
    private precision: string;
    private depth = -1;

    constructor(parser, indexer) {
        this.parser = parser;
        this.indexer = indexer;
        const settings = workspace.getConfiguration();
        this.precision = settings.get('veriloga.documentSymbolsPrecision');
        if (this.precision === 'full') {
            this.precision = 'full_no_references';
        } else if (this.precision !== 'full') {
            this.depth = 1;
        }
    }

    /**
        Matches the regex pattern with the document's text. If a match is found, it creates a `VerilogASymbol` object.
        If `documentSymbols` is not `undefined`, than the object is added to it,
        otherwise add the objects to an empty list and return it.

        @param document The document in which the command was invoked.
        @param _token A cancellation token.
        @return A list of `VerilogASymbol` objects or a thenable that resolves to such. The lack of a result can be
        signaled by returning `undefined`, `null`, or an empty list.
    */
    public provideDocumentSymbols(
        document: TextDocument,
        _token?: CancellationToken
    ): Thenable<Array<VerilogASymbol>> {
        return new Promise((resolve) => {
            let symbols = [];
            const path = document.uri.fsPath;
            const allSymbols = this.indexer.symbols.get(path);
            if (allSymbols) {
                allSymbols.forEach((symbol) => {
                    if (symbol.kind !== getSymbolKind('potential_reference')) {
                        symbols.push(symbol);
                    }
                });
            } else {
                symbols = this.parser.get_all_recursive(document, this.precision, this.depth);
            }

            resolve(symbols);
        });
    }
}

