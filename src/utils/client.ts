import { TextDocument } from 'vscode';

/**
    Check if a given `document` is a verilog A file.

    @param document the document to check
    @return true if the document is a verilog A file
*/
export function isVerilogADocument(document: TextDocument | undefined): boolean {
    return document?.languageId === 'veriloga';
}

