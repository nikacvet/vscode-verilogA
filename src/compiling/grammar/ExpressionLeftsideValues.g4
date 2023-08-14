grammar ExpressionLeftsideValues;
import Operators;

//!! ADD

analog_variable_lvalue : variable_identifier
                        | variable_identifier '[' analog_expression ']' '{' '[' analog_expression ']' '}';
                        
array_analog_variable_assignment : array_analog_variable_lvalue '=' array_analog_variable_rvalue ';';

array_analog_variable_rvalue : array_variable_identifier
                              | array_variable_identifier '[' analog_expression ']' '{' '[' analog_expression ']' '}'
                              | assignment_pattern;

branch_lvalue : branch_probe_function_call;

net_lvalue : hierarchical_net_identifier ('[' constant_expression ']')? ('[' constant_range_expression ']')
            | '{' net_lvalue (',' net_lvalue)* '}';

variable_lvalue : hierarchical_variable_identifier ('[' expression ']')? ('[' range_expression ']')
                  | '{' variable_lvalue (',' variable_lvalue)* '}';
//TODO check if valid
array_variable_identifier: identifier;
array_analog_variable_lvalue: array_variable_identifier
                            | array_variable_identifier '[' analog_expression ']' '{' '[' analog_expression ']' '}';