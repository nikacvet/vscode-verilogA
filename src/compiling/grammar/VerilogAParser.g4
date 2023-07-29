parser grammar VerilogAParser;
options {tokenVocab = VerilogALexer; }

unary_operator
	: '+'
	| '-'
	| '!'
	| '~'
	| '&'
	| '~&'
	| '|'
	| '~|'
	| '^'
	| '~^'
	| '^~'
	;
unary_module_path_operator
	: '!'
	| '~'
	| '&'
	| '~&'
	| '|'
	| '~|'
	| '^'
	| '~^'
	| '^~'
	;
    number
	: decimal_number
	| real_number
	;
real_number
	: fixed_point_number
	| exponential_number
	;
decimal_number
	: unsigned_number
	| size? decimal_base decimal_value
	;
size
	: UNSIGNED_NUMBER
	;
fixed_point_number
	: FIXED_POINT_NUMBER
	;
exponential_number
	: EXPONENTIAL_NUMBER
	;
unsigned_number
	: UNSIGNED_NUMBER
	;
decimal_value
	: UNSIGNED_NUMBER
	;
decimal_base
	: DECIMAL_BASE
	;

// A.8.8 Strings
string_
	: STRING
	;
source_text: ( description )* EOF;
description: module_declaration
            | function_declaration
            | task_declaration
            | // Add other Verilog-A constructs here
            ;

module_keyword : (MODULE | MACROMODULE)  ;
module_nonansi_header :  ( attribute_instance )*  module_keyword
     ( lifetime )?  module_identifier  ( package_import_declaration )*
     ( parameter_port_list )?  list_of_ports  ';'  ;
module_declaration : module_nonansi_header ( timeunits_declaration )?
    ( module_item )* 'endmodule' ( ':' module_identifier )?function_declaration: 'function' IDENTIFIER ( parameter_port_list )? ( list_of_ports )? ';' ( function_statement )* 'endfunction' ( ':' IDENTIFIER )?;
task_declaration: 'task' IDENTIFIER ( parameter_port_list )? ( list_of_ports )? ';' ( task_statement )* 'endtask' ( ':' IDENTIFIER )?;


