import { HoverProvider, TextDocument, Position, CancellationToken, ProviderResult, Hover, workspace, commands, Location } from 'vscode'; // prettier-ignore

export class VerilogAHoverProvider implements HoverProvider {
    provideHover(document: TextDocument, position: Position, token: CancellationToken): ProviderResult<Hover> {
        return new Promise((resolve, _reject) => {
            // get the word under the cursor
            const lookupRange = document.getWordRangeAtPosition(position);

            if (!lookupRange) {
                return resolve(undefined);
            }
            
            resolve(
                commands
                    .executeCommand('vscode.executeDefinitionProvider', document.uri, position, token)
                    .then((loc: Location[]): Thenable<string> => {
                        if (loc.length === 0) {
                            return undefined;
                        }
                        return workspace
                            .openTextDocument(loc[0].uri)
                            .then((doc) => doc.lineAt(loc[0].range.start.line).text.trim());
                    })
                    .then(
                        (str: string): Hover =>
                            new Hover([
                                {
                                    language: 'veriloga',
                                    value: str
                                }
                            ])
                    )
            );
        });
    }
}
