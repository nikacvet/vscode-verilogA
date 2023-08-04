grammar BlockItemDeclarations;
import PrimitiveInstantiationAndInstances;



analog_block_item_declaration : attribute_instance? parameter_declaration ';'
                                | attribute_instance? integer_declaration
                                | attribute_instance? real_declaration;

block_item_declaration : attribute_instance? 'reg' discipline_identifier? 'signed'? range? list_of_block_variable_identifiers ';'
                          | attribute_instance? 'integer' list_of_block_variable_identifiers ';'
                          | attribute_instance? 'time' list_of_block_variable_identifiers ';'
                          | attribute_instance? 'real' list_of_block_real_identifiers ';'
                          | attribute_instance? 'realtime' list_of_block_real_identifiers ';'
                          | attribute_instance? event_declaration
                          | attribute_instance? local_parameter_declaration ';'
                          | attribute_instance? parameter_declaration';';

list_of_block_variable_identifiers : block_variable_type (',' block_variable_type)*;

list_of_block_real_identifiers : block_real_type (',' block_real_type)*;

block_variable_type : variable_identifier dimension?;

block_real_type : real_identifier dimension?;

attribute_instance : '{' attribute_instance '}' ; // Replace with appropriate definition
