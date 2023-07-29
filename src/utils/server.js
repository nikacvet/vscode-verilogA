"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.getLineRange = exports.isVerilogADocument = void 0;
const node_1 = require("vscode-languageserver/node");
/**
    Check if a given `document` is a Verilog file.

    @param document the document to check
    @return true if the document is a Verilog file
*/
function isVerilogADocument(document) {
    return document?.languageId === 'veriloga';
}
exports.isVerilogADocument = isVerilogADocument;
/**
        Gets the `range` of a line given the line number

        @param line the line number
        @return the line's range
    */
function getLineRange(line, offendingSymbol, startPosition) {
    let endPosition;
    if (startPosition == null) {
        startPosition = 0;
    }
    if (offendingSymbol == null || offendingSymbol === undefined) {
        // When offendingSymbol is null, assume the error is marked to the end of the line
        endPosition = Number.MAX_VALUE;
    }
    else {
        endPosition = startPosition + offendingSymbol.length;
    }
    return node_1.Range.create(node_1.Position.create(line, startPosition), node_1.Position.create(line, endPosition));
}
exports.getLineRange = getLineRange;
//# sourceMappingURL=server.js.map