
import { Recognizer, RecognitionException, ANTLRErrorListener } from 'antlr4ts';


interface SyntaxErrorItem {
    offendingSymbol: any;
    line: number;
    charPositionInLine: number;
    msg: string;
}

/**
 * Stores errors in ANTLR parsing in a list for later access
 */
export class SyntaxErrorListener<T> implements ANTLRErrorListener<T> {
    public error_list: SyntaxErrorItem[] = [];

    public syntaxError<T>(
        _recognizer: Recognizer<T, any>,
        offendingSymbol: T,
        line: number,
        charPositionInLine: number,
        msg: string,
        _e: RecognitionException | undefined
    ): void {
        line -= 1;
        this.error_list.push({ offendingSymbol, line, charPositionInLine, msg });
    }
}