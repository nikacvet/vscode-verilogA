import { Diagnostic } from 'vscode-languageserver/node';
import { TextDocument } from 'vscode-languageserver-textdocument';
import * as child from 'child_process';
import { DocumentCompiler } from './DocumentCompiler';
import { DiagnosticData, isDiagnosticDataUndefined } from './DiagnosticData';

/**
 * OpenVAF Compiler class contains functionality for compiling Verilog A files.
 * Generates and takes in predefined runtime arguments,
 * and eventually parses the errors/warnings in `stdout` into `Diagnostic` array mapped to each unique document's uri.
 */
export class OpenVAF extends DocumentCompiler {
/**
        Parses `stdout` into `Diagnostics` that are added to `collection` by adding each `Diagnostic` to an array
        The array is mapped in `collection` to the referred document's uri.

        @param _error the process's error
        @param stdout the process's stdout
        @param _stderr the process's stderr
        @param compiledDocument the document been compiled
        @param documentFilePath the `document`'s file path
        @param collection the collection to add the Diagnostics to
        @returns a message if an error occurred.
    */
        public parseDiagnostics(
            _error: child.ExecException,
            stdout: string,
            _stderr: string,
            compiledDocument: TextDocument,
            documentFilePath: string,
            collection: Map<string, Diagnostic[]>
        ): void {
            if (stdout === undefined || stdout == null || !compiledDocument) {
                return;
            }
    
            const regexError = new RegExp(`(.*)-\\[(.*)\\] (.*)"?${documentFilePath}"?, ([0-9]+)(.*)`);
    
            stdout = stdout.replace(/\r\n/g, '\n').trim();
    
            const errors = stdout.split(/\n\n/g);
    
            const visitedDocuments = new Map<string, boolean>();
    
            for (let i = 0; i < errors.length; i++) {
                const error = this.formatError(errors[i]);
                const diagnosticData: DiagnosticData = new DiagnosticData();
                let matches;
    
                if ((matches = regexError.exec(error))) {
                    diagnosticData.filePath = documentFilePath;
                    diagnosticData.line = parseInt(matches[4], 10) - 1;
                    diagnosticData.diagnosticSeverity = this.getDiagnosticSeverity(matches[1]);
    
                    // Format Diagnostic's problem
                    const problem = [];
    
                    // remove preceding/trailing special characters
                    problem.push(`[${matches[2].replace(/^\W+|\W+$/g, '')}]: `);
                    problem.push(`${matches[3].replace(/^\W+|\W+$/g, '')}. `);
                    problem.push(`${matches[5].replace(/^\W+|\W+$/g, '')}.`);
    
                    diagnosticData.problem = problem.join('').trim();
                }
    
                // Push Diagnostic
                if (!isDiagnosticDataUndefined(diagnosticData)) {
                    if (visitedDocuments.has(diagnosticData.filePath)) {
                        this.publishDiagnosticForDocument(compiledDocument, false, diagnosticData, collection);
                    } else {
                        this.publishDiagnosticForDocument(compiledDocument, true, diagnosticData, collection);
                        visitedDocuments.set(diagnosticData.filePath, true);
                    }
                }
            }
        }
    
        /**
            Formats an error by removing new line characters, and cleaning up multiple space characters.
    
            @param error the error output to format
            @returns the formatted error
        */
        formatError(error: string): string {
            error = error.trim();
    
            let regex = new RegExp('( +)?,( +)?\n', 'g'); // eslint-disable-line no-control-regex
            error = error.replace(regex, ', ');
    
            regex = new RegExp('( +)?\n( +)?', 'g'); // eslint-disable-line no-control-regex
            error = error.replace(regex, '. ');
    
            error = error.replace(/ +/g, ' ');
    
            return error.trim();
        }



}