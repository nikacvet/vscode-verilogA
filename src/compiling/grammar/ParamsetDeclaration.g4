grammar ParamsetDeclaration;
import DeclarationTypes;

paramset_declaration: '{' attribute_instance '}' 'paramset' paramset_identifier module_or_paramset_identifier ';'
                      paramset_item_declaration+ paramset_statement+ 'endparamset';

paramset_item_declaration: '{' attribute_instance '}' parameter_declaration ';'
                         | '{' attribute_instance '}' local_parameter_declaration ';'
                         | aliasparam_declaration
                         | '{' attribute_instance '}' integer_declaration
                         | '{' attribute_instance '}' real_declaration;

paramset_statement: '.' module_parameter_identifier '=' paramset_constant_expression ';'
                  | '.' module_output_variable_identifier '=' paramset_constant_expression ';'
                  | '.' system_parameter_identifier '=' paramset_constant_expression ';'
                  | analog_function_statement;

paramset_constant_expression: constant_primary
                          | hierarchical_parameter_identifier
                          | unary_operator '{' attribute_instance '}' constant_primary
                          | paramset_constant_expression binary_operator attribute_instance* paramset_constant_expression
                          | paramset_constant_expression '?' '{' attribute_instance '}' paramset_constant_expression ':' paramset_constant_expression;

