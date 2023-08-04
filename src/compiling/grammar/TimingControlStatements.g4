grammar TimingControlStatements;
import ConditionalStatements;


analog_event_control_statement : analog_event_control analog_event_statement;

analog_event_control : '@' hierarchical_event_identifier
                     | '@' '(' analog_event_expression ')';

analog_event_expression : expression
                         | 'posedge' expression
                         | 'negedge' expression
                         | hierarchical_event_identifier
                         | 'initial_step' ('(' analysis_identifier (',' analysis_identifier)* ')')?
                         | 'final_step' ('(' analysis_identifier (',' analysis_identifier)* ')')?
                         | analog_event_functions
                         | analog_event_expression 'or' analog_event_expression
                         | analog_event_expression ',' analog_event_expression;

analog_event_functions : 'cross' '(' analog_expression (',' analog_expression_or_null (',' constant_expression_or_null (',' constant_expression_or_null (',' analog_expression)?)?)?)? ')'
                         | 'above' '(' analog_expression (',' constant_expression_or_null (',' constant_expression_or_null (',' analog_expression)?)?)? ')'
                         | 'timer' '(' analog_expression (',' analog_expression_or_null (',' constant_expression_or_null (',' analog_expression)?)?)? ')'
                         | 'absdelta' '(' analog_expression ',' analog_expression (',' constant_expression_or_null (',' constant_expression_or_null (',' analog_expression)?)?)? ')';
delay_control : '#' delay_value
                | '#' '(' mintypmax_expression ')';
delay_or_event_control : delay_control
                          | event_control
                          | 'repeat' '(' expression ')' event_control;
disable_statement : 'disable' hierarchical_task_identifier ';'
                     | 'disable' hierarchical_block_identifier ';';
event_control : '@' hierarchical_event_identifier
                 | '@' '(' event_expression ')'
                 | '@*'
                 | '@(*)';
event_trigger : '->' hierarchical_event_identifier ('[' expression ']')? ';';
event_expression : expression
                    | 'posedge' expression
                    | 'negedge' expression
                    | hierarchical_event_identifier
                    | event_expression 'or' event_expression
                    | event_expression ',' event_expression
                    | analog_event_functions
                    | 'driver_update' expression
                    | analog_variable_lvalue;
procedural_timing_control : delay_control
                             | event_control;
procedural_timing_control_statement : procedural_timing_control statement_or_null;
wait_statement : 'wait' '(' expression ')' statement_or_null;

