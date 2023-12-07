"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const c3 = require("antlr4-c3");
const antlr4ts_1 = require("antlr4ts");
const VerilogAParser_1 = require("../compiling/grammar/build/VerilogAParser");
const VerilogALexer_1 = require("../compiling/grammar/build/VerilogALexer");
let inputStream = new ANTLRInputStream("var c = a + b()");
let lexer = new VerilogALexer_1.VerilogALexer(inputStream);
let tokenStream = new antlr4ts_1.CommonTokenStream(lexer);
let parser = new VerilogAParser_1.VerilogAParser(tokenStream);
let errorListener = new ErrorListener();
parser.addErrorListener(errorListener);
let tree = parser.expression();
let core = new c3.CodeCompletionCore(parser);
let candidates = core.collectCandidates(0);
//# sourceMappingURL=c3engine.js.map