grammar GenerateInstantiation;
import UDPDeclaration;

generate_region : 'generate' '{' module_or_generate_item '}' 'endgenerate';
genvar_declaration : 'genvar' list_of_genvar_identifiers ';';
list_of_genvar_identifiers : genvar_identifier (',' genvar_identifier)*;
analog_loop_generate_statement : 'for' '(' genvar_initialization ';' genvar_expression ';' genvar_iteration ')' analog_statement;
loop_generate_construct : 'for' '(' genvar_initialization ';' genvar_expression ';' genvar_iteration ')' generate_block;
genvar_initialization : genvar_identifier '=' constant_expression;
genvar_expression : genvar_primary
                   | unary_operator? '{' attribute_instance? genvar_primary '}' // Assuming '{' and '}' are not part of unary_operator.
                   | genvar_expression binary_operator attribute_instance? genvar_expression
                   | genvar_expression '?' attribute_instance? genvar_expression ':' genvar_expression;
genvar_iteration : genvar_identifier '=' genvar_expression;
genvar_primary : constant_primary
                 | genvar_identifier;
conditional_generate_construct : if_generate_construct
                                 | case_generate_construct;
if_generate_construct : 'if' '(' constant_expression ')' generate_block_or_null ('else' generate_block_or_null)?;
case_generate_construct : 'case' '(' constant_expression ')' case_generate_item+ 'endcase';
case_generate_item : constant_expression (',' constant_expression)* ':' generate_block_or_null
                     | 'default' (':' generate_block_or_null)?;
generate_block : module_or_generate_item
                  | 'begin' ':' generate_block_identifier? module_or_generate_item+ 'end';
generate_block_or_null : generate_block
                          | ';';

