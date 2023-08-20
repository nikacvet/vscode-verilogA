import { Range, HoverProvider, TextDocument, Position, CancellationToken, ProviderResult, Hover, workspace, commands, Location, MarkdownString } from 'vscode'; // prettier-ignore
import * as fs from 'fs';
import * as path from 'path';

export class VerilogAHoverProvider implements HoverProvider {
    provideHover(document: TextDocument, position: Position, token: CancellationToken): ProviderResult<Hover> {
        return new Promise((resolve, _reject) => {
            // get the word under the cursor
            const lookupRange = document.getWordRangeAtPosition(position);

            if (!lookupRange) {
                return resolve(undefined);
            }

            // resolve(commands.executeCommand('vscode.executeDefinitionProvider', document.uri, position, token)
            //     .then((loc: Location[]) => {
            //         if (loc.length === 0) {
            //             return undefined;
            //         }
            //         const definitionLine = loc[0].range.start.line;
            //         const symbolName = this.extractSymbolName(document, definitionLine);
            //         return workspace
            //             .openTextDocument(loc[0].uri)
            //             .then((doc) => {
            //                 const lineText = doc.lineAt(loc[0].range.start.line).text.trim()
            //                 return {symbolName,lineText}
            //             });
            //     })
            //     .then ((result: { symbolName: string, lineText: string }): Hover =>  {
            //         // Call getSymbolDescription here
            //         if (!result) return undefined;
            //         const description = this.getSymbolDescription(result.symbolName);

            //         // Continue with other logic
            //         let hoverText: string;
            //         if (description) {
            //             hoverText = `${result.symbolName}\n\n\nDescription: ${description.description}\n\nOptions:\n${description.options}`;
            //         } else {
            //             hoverText = result.lineText;
            //         }

            //         // Create and resolve the hover
            //         return new Hover([
            //             {
            //                 language: 'veriloga',
            //                 value: hoverText
            //             }
            //         ]);
            //      })
            //  );
             
                
            // const symbolName = document.getText(lookupRange);
            // const description = this.getSymbolDescription(symbolName);

            // let hoverText: string;

            // if (description) {
            //     hoverText = `Function: ${symbolName}\n\nDescription: ${description.description}\n\nOptions:\n${description.options}`;
            // } else {
            //     hoverText = symbolName;
            // }
            // const hover = new Hover([{
            //     language:'veriloga',
            //     value: hoverText
            // }]);
            // resolve(hover);

            // commands.executeCommand('vscode.executeDefinitionProvider', document.uri, position, token)
            // .then((loc: Location[]): Thenable<string> => {
            //     if (loc.length === 0) {
            //         return undefined;
            //     }
            //     const definition = loc[0].uri
            //     const definitionLine = loc[0].range.start.line
            //     //const definitionLine = loc[0].range.start.line;
            //     const symbolName = this.extractSymbolName(document, definitionLine);
            //     let text: string;
            //     if (this.isFunction(symbolName)) {
            //         const description = this.getSymbolDescription(symbolName);
            //         text = `${document.lineAt(definitionLine).text.trim()}\n\nDescription: ${description || 'No description available'}`;
            //     } else {
            //         text = document.lineAt(definitionLine).text.trim();
            //     }
                
            //     const hoverText = new Hover ([
            //         {
            //             language: 'veriloga',
            //             value: text
            //         }
            //     ]);



            //     // const description = this.getSymbolDescription(symbolName);
            //     // const hoverText = new Hover([
            //     //     {
            //     //         language: 'veriloga',
            //     //         value: `${document.lineAt(definitionLine).text.trim()}\n\n` +
            //     //                `Description: ${description || 'No description available'}`
            //     //     }
            //     // ]);
                
            //     resolve(hoverText);
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
                        (str: string): Hover => {
                            if (!str) {
                                const symbolName = document.getText(lookupRange);
                                const description = this.getSymbolDescription(symbolName);
                                if (description) {
                                    const markdown = new MarkdownString();
                                    const definitions = description.definitions;
                                    for (const def in definitions) {
                                        markdown.appendCodeblock(`(function) ${def}`,"veriloga")
                                    }
                                    
                                    markdown.appendMarkdown('<hr>')
                                    markdown.appendMarkdown(`\n\n${description.description}\n\n**Options**:\n\n`)
                                    const parameters = description.parameters;

                                    for (const paramName in parameters) {
                                        markdown.appendMarkdown(`\n\n*@param* `)
                                        markdown.appendMarkdown(`<code>${paramName}</code>`);
                                        markdown.appendMarkdown(`\- ${parameters[paramName]}`)
                                    }
                                    
                                    markdown.isTrusted = true;
                                    markdown.supportHtml = true;
                                    return new Hover(
                                        // value:`Function: ${symbolName}\n\nDescription: ${description.description}\n\nOptions:\n${description.options}`
                                        markdown
                                    );
                                }
                                
                            }
                            else {
                                return new Hover([
                                    {
                                        language: 'veriloga',
                                        value: str
                                    }
                                ])
                            }
                        })
            );
             });
            
            // resolve(
            //     commands
            //         .executeCommand('vscode.executeDefinitionProvider', document.uri, position, token)
            //         .then((loc: Location[]): Thenable<string> => {
            //             if (loc.length === 0) {
            //                 return undefined;
            //             }
            //             return workspace
            //                 .openTextDocument(loc[0].uri)
            //                 .then((doc) => doc.lineAt(loc[0].range.start.line).text.trim());
            //         })
            //         .then(
            //             (str: string): Hover =>
            //                 new Hover([
            //                     {
            //                         language: 'veriloga',
            //                         value: str
            //                     }
            //                 ])
            //         )
            // );
            //  });
        // });
    }
    private extractSymbolName(document: TextDocument, line: number): string {
        // Implement your logic to extract the symbol name from the line
        // Example: Extract the first word as the symbol name
        const lineText = document.lineAt(line).text;
        const symbolName = lineText.trim().split(/\s+/)[0];
        return symbolName;
    }

    private getSymbolDescription(symbolName: string): any {
        try {
            const descriptionPaths = path.join(__dirname,'../../src/providers/functionDefinitions.json');
            const descriptionsContent = fs.readFileSync(descriptionPaths, 'utf-8');
            const descriptions = JSON.parse(descriptionsContent);
            return descriptions[symbolName] || undefined;
        } catch (error) {
            console.error('Error loading function description.');
            return undefined;
        }
    }
    private isFunction(symbolName: string): boolean {
        // Implement your logic to determine whether the symbol is a function or not
        // You might need to use a more robust approach based on your language's syntax rules
        return symbolName.endsWith('()'); // Simple check for demonstration purposes
    }
}
