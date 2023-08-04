grammar CaseStatements;
import LoopingStatements;

analog_case_statement : 'case' '(' analog_expression ')' analog_case_item (analog_case_item)* 'endcase'
                       | 'casex' '(' analog_expression ')' analog_case_item (analog_case_item)* 'endcase'
                       | 'casez' '(' analog_expression ')' analog_case_item (analog_case_item)* 'endcase'
                       ;

analog_case_item : analog_expression (',' analog_expression)* ':' analog_statement_or_null
                 | 'default' (':')? analog_statement_or_null;

analog_function_case_statement : 'case' '(' analog_expression ')' analog_function_case_item (analog_function_case_item)* 'endcase'
                                 ;

analog_function_case_item : analog_expression (analog_expression)* ':' analog_function_statement_or_null
                           | 'default' (':')? analog_function_statement_or_null;

case_statement : 'case' '(' expression ')' case_item (case_item)* 'endcase'
                | 'casez' '(' expression ')' case_item (case_item)* 'endcase'
                | 'casex' '(' expression ')' case_item (case_item)* 'endcase'
                ;

case_item : expression (',' expression)* ':' statement_or_null
           | 'default' (':')? statement_or_null;