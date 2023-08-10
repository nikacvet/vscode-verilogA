grammar LoopingStatements;
import TaskEnableStatements;


analog_loop_statement : 'repeat' '(' analog_expression ')' analog_statement
                      | 'while' '(' analog_expression ')' analog_statement
                      | 'for' '(' analog_variable_assignment ';' analog_expression ';' analog_variable_assignment ')' analog_statement
                      ;

analog_function_loop_statement : 'repeat' '(' analog_expression ')' analog_function_statement
                                | 'while' '(' analog_expression ')' analog_function_statement
                                | 'for' '(' analog_variable_assignment ';' analog_expression ';' analog_variable_assignment ')' analog_function_statement
                                ;

loop_statement : 'forever' statement
               | 'repeat' '(' expression ')' statement
               | 'while' '(' expression ')' statement
               | 'for' '(' variable_assignment ';' expression ';' variable_assignment ')' statement
               ;