import { Connection, Diagnostic, TextDocuments } from 'vscode-languageserver/node';
import { TextDocument } from 'vscode-languageserver-textdocument';
import { DocumentCompiler } from './DocumentCompiler';
import { OpenVAFCompiler } from './OpenVAFCompiler';

/* defines supported simulators/compilers */
export enum CompilerType {
    OpenVAF = 1
}

/* 
    SystemVerilog Compiler handles functionality for compiling documents using the supported simulators.
    Used by the LSP's `connection` to handle getting `Diagnostics` for `documents`
*/
export class VerilogACompiler {
    compiler: DocumentCompiler;
    connection: Connection;
    documents: TextDocuments<TextDocument>;
    workspaceRootPath: string;
    configurations: Map<string, any>;
    compilerConfigurationsKeys: string[];

    constructor(
        connection: Connection,
        documents: TextDocuments<TextDocument>,
        workspaceRootPath: string,
        configurations: Map<string, any>,
        compilerConfigurationsKeys: string[]
    ) {
        this.connection = connection;
        this.documents = documents;
        this.workspaceRootPath = workspaceRootPath;
        this.configurations = configurations;
        this.compilerConfigurationsKeys = compilerConfigurationsKeys;
    }

    /**
        Compiles the given `document` using the compiler/simulator specified by `type`.

        @returns a `Promise` of a map of entries mapping each uri to a `Diagnostic` array
    */
    public async validateTextDocument(document: TextDocument, type: CompilerType): Promise<Map<string, Diagnostic[]>> {
        
        // this.connection.console.log('Verilog A: Compiler is not implemented.');
        // this.connection.console.log('No diagnostics are available.');
        // return new Map(); // Return an empty map since no diagnostics are available.
        if (type === CompilerType.OpenVAF) {
            this.compiler = new OpenVAFCompiler(
                this.connection,
                this.documents,
                this.workspaceRootPath,
                this.configurations,
                this.compilerConfigurationsKeys
            );
        } else {
            this.connection.console.log(`VerilogA: '${type}' is an invalid compiler type.`);
            return;
        }

        return this.compiler.getTextDocumentDiagnostics(document);
    }
}
