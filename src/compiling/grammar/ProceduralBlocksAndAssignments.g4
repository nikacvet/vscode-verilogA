grammar ProceduralBlocksAndAssignments;
import ParallelAndSequentialBlocks;

analog_construct : 'analog' analog_statement
                 | 'analog' 'initial' analog_function_statement;
analog_procedural_assignment : analog_variable_assignment ';';
analog_variable_assignment : scalar_analog_variable_assignment
                            | array_analog_variable_assignment;
scalar_analog_variable_assignment : scalar_analog_variable_lvalue '=' analog_expression;
initial_construct : 'initial' statement;
always_construct : 'always' statement;
blocking_assignment : variable_lvalue '=' '[' delay_or_event_control ']' expression;
nonblocking_assignment : variable_lvalue '<=' '[' delay_or_event_control ']' expression;
procedural_continuous_assignments : 'assign' variable_assignment
                                    | 'deassign' variable_lvalue
                                    | 'force' variable_assignment
                                    | 'force' net_assignment
                                    | 'release' variable_lvalue
                                    | 'release' net_lvalue;
variable_assignment : variable_lvalue '=' expression;

