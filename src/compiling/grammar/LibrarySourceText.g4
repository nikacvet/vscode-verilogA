grammar LibrarySourceText;
import VerilogASourceText;

file_path: string_literal;

library_text: library_description*;
library_description: library_declaration
                 | include_statement
                 | config_declaration;
library_declaration: 'library' library_identifier file_path_spec (',' file_path_spec)* ('-incdir' file_path_spec (',' file_path_spec)*)? ';';
file_path_spec: file_path;
include_statement: 'include' file_path_spec ';';


