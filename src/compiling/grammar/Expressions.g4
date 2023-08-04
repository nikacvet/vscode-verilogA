grammar Expressions;
import Primaries;

abstol_expression : constant_expression | nature_identifier;

analog_conditional_expression : analog_expression '?' attribute_instance? analog_expression ':' analog_expression;

analog_range_expression : analog_expression | msb_constant_expression ':' lsb_constant_expression;

analog_expression_or_null : '[' analog_expression ']';

analog_expression : analog_primary
                   | unary_operator attribute_instance? analog_primary
                   | analog_expression binary_operator attribute_instance? analog_expression
                   | analog_conditional_expression
                   | string_literal;

base_expression : expression;

conditional_expression : expression1 '?' attribute_instance? expression2 ':' expression3;

constant_base_expression : constant_expression;

constant_expression_or_null : '[' constant_expression ']';

constant_expression : constant_primary
                      | unary_operator attribute_instance? constant_primary
                      | constant_expression binary_operator attribute_instance? constant_expression
                      | constant_expression '?' attribute_instance? constant_expression ':' constant_expression;

analysis_or_constant_expression : constant_primary
                                 | analysis_function_call
                                 | unary_operator attribute_instance? analysis_or_constant_primary
                                 | analysis_or_constant_expression binary_operator attribute_instance? analysis_constant_expression
                                 | analysis_or_constant_expression '?' attribute_instance? analysis_or_constant_expression ':' analysis_or_constant_expression;

constant_mintypmax_expression : constant_expression
                                | constant_expression ':' constant_expression ':' constant_expression;

constant_range_expression : constant_expression
                             | msb_constant_expression ':' lsb_constant_expression
                             | constant_base_expression '+:' width_constant_expression
                             | constant_base_expression '-:' width_constant_expression;

dimension_constant_expression : constant_expression;

expression : primary
             | unary_operator attribute_instance? primary
             | expression binary_operator attribute_instance? expression
             | conditional_expression;

expression1 : expression;
expression2 : expression;
expression3 : expression;

indirect_expression : branch_probe_function_call
                       | port_probe_function_call
                       | 'ddt' '(' branch_probe_function_call (',' abstol_expression)? ')'
                       | 'ddt' '(' port_probe_function_call (',' abstol_expression)? ')'
                       | 'idt' '(' branch_probe_function_call (',' analog_expression (',' analog_expression (',' abstol_expression)?)?)? ')'
                       | 'idt' '(' port_probe_function_call (',' analog_expression (',' analog_expression (',' abstol_expression)?)?)? ')'
                       | 'idtmod' '(' branch_probe_function_call (',' analog_expression (',' analog_expression (',' analog_expression (',' abstol_expression)?)?)?)? ')'
                       | 'idtmod' '(' port_probe_function_call (',' analog_expression (',' analog_expression (',' analog_expression (',' abstol_expression)?)?)?)? ')';

lsb_constant_expression : constant_expression;

mintypmax_expression : expression
                        | expression ':' expression ':' expression;

module_path_conditional_expression : module_path_expression '?' attribute_instance? module_path_expression ':' module_path_expression;

module_path_expression : module_path_primary
                         | unary_module_path_operator attribute_instance? module_path_primary
                         | module_path_expression binary_module_path_operator attribute_instance? module_path_expression
                         | module_path_conditional_expression;

module_path_mintypmax_expression : module_path_expression
                                    | module_path_expression ':' module_path_expression ':' module_path_expression;

msb_constant_expression : constant_expression;

nature_attribute_expression : constant_expression
                              | nature_identifier
                              | nature_access_identifier;

range_expression : expression
                    | msb_constant_expression ':' lsb_constant_expression
                    | base_expression '+:' width_constant_expression
                    | base_expression '-:' width_constant_expression;

width_constant_expression : constant_expression;

