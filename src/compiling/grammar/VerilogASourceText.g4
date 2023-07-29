grammar VerilogASourceText;
import Numbers;


source_text : ( timeunits_declaration )? ( description )* ;

description : module_declaration
             | include_compiler_directive ;

timeunits_declaration : 'timeunit' time_literal ( '/' time_literal )? ';'
  | 'timeprecision' time_literal ';'
  | 'timeunit' time_literal ';' 'timeprecision' time_literal ';'
  | 'timeprecision time_literal' ';' 'timeunit' time_literal ';' ;
time_literal : unsigned_number time_unit | fixed_point_number time_unit ;
time_unit : LOWER_S | LOWER_MS | LOWER_US | LOWER_NS | LOWER_PS | LOWER_FS ;

module_keyword : (MODULE | MACROMODULE)  ;
include_compiler_directive : '`include' FILENAME ;




// Lexer tokens
MODULE : 'module';
ENDMODULE : 'endmodule';
SEMI : ';';
LPAREN : '(';
RPAREN : ')';
IDENTIFIER : [a-zA-Z_][a-zA-Z0-9_]*;
COLON : ':';
ATTRIBUTE : 'attribute';
STAR : '.*';

// Parser rules
module_declaration : module_nonansi_header (timeunits_declaration)? (module_item)* ENDMODULE (COLON IDENTIFIER)?;
module_nonansi_header : (ATTRIBUTE)* MODULE (lifetime)? IDENTIFIER (parameter_port_list)? list_of_ports SEMI;
parameter_port_list : LPAREN port_declaration (',' port_declaration)* RPAREN;
port_declaration : IDENTIFIER;
list_of_ports : LPAREN port (',' port)* RPAREN;
port : IDENTIFIER;

lifetime : 'static' | 'automatic' ;

module_item : port_declaration;





