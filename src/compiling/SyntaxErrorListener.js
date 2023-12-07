"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.SyntaxErrorListener = void 0;
/**
 * Stores errors in ANTLR parsing in a list for later access
 */
var SyntaxErrorListener = /** @class */ (function () {
    function SyntaxErrorListener() {
        this.error_list = [];
    }
    SyntaxErrorListener.prototype.syntaxError = function (_recognizer, offendingSymbol, line, charPositionInLine, msg, _e) {
        line -= 1;
        this.error_list.push({ offendingSymbol: offendingSymbol, line: line, charPositionInLine: charPositionInLine, msg: msg });
    };
    return SyntaxErrorListener;
}());
exports.SyntaxErrorListener = SyntaxErrorListener;
