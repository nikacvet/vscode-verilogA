import { CharStreams, CommonTokenStream, Parser, ParserRuleContext, Token, TokenStream } from 'antlr4ts';
import { VerilogAParser } from '../src/compiling/grammar/build/VerilogAParser';
import { VerilogALexer } from '../src/compiling/grammar/build/VerilogALexer';
import { SyntaxErrorListener } from '../src/compiling/SyntaxErrorListener';
import { CodeCompletionCore } from 'antlr4-c3';

describe("Code Completion Tests", () => {
    it("Idk", () => {
        const inputStream = CharStreams.fromString("module ");
        console.log("expression:")
        console.log(inputStream)
        const lexer = new VerilogALexer(inputStream);
        const tokenStream = new CommonTokenStream(lexer);

        const parser = new VerilogAParser(tokenStream);
        const errorListener = new SyntaxErrorListener(); // Use the correct type for Token
        parser.addErrorListener(errorListener);
        

        const tree = parser.module_declaration(); // Make sure to call the correct entry point of your grammar
        
        const core = new CodeCompletionCore(parser);
        core.showResult = true;
        core.showDebugOutput = true;
        // core.showRuleStack = true;
        core.preferredRules = new Set([VerilogAParser.RULE_module_declaration]);
        let candidates = core.collectCandidates(0); 
        console.log(candidates.tokens)

        // If you're interested in the parse tree
        //console.log(tree.toStringTree(parser));

        
    })
})
