import * as c3 from 'antlr4-c3';
import { CompletionItem, CompletionItemKind, InsertTextFormat } from 'vscode-languageserver';
import { CharStreams, CommonTokenStream, Parser, ParserRuleContext, Token, TokenStream } from 'antlr4ts';
import { VerilogAParser } from '../compiling/grammar/build/VerilogAParser';
import { VerilogALexer } from '../compiling/grammar/build/VerilogALexer';
import { SyntaxErrorListener } from '../compiling/SyntaxErrorListener';

let inputStream = CharStreams.fromString("module test(in, out);");
let lexer = new VerilogALexer(inputStream);
let tokenStream = new CommonTokenStream(lexer);

let parser = new VerilogAParser(tokenStream);
let errorListener = new SyntaxErrorListener();
parser.addErrorListener(errorListener);
let tree = parser.expression();

let core = new c3.CodeCompletionCore(parser);
let candidates = core.collectCandidates(0);