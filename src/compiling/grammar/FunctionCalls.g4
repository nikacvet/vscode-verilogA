grammar FunctionCalls;
import Expressions;


analog_function_call: analog_function_identifier attribute_instance* '(' analog_expression (',' analog_expression)* ')';

analog_system_function_call: analog_system_function_identifier ('[' (analog_expression (',' analog_expression)?)? ']')?;

analog_built_in_function_call: analog_built_in_function_name '(' analog_expression (',' analog_expression)? ')';

analog_built_in_function_name: 'ln' | 'log' | 'exp' | 'sqrt' | 'min' | 'max' | 'abs' | 'pow'
                            | 'floor' | 'ceil' | 'sin' | 'cos' | 'tan' | 'asin' | 'acos' | 'atan'
                            | 'atan2' | 'hypot' | 'sinh' | 'cosh' | 'tanh' | 'asinh' | 'acosh' | 'atanh';

analysis_function_call: 'analysis' '(' '"' analysis_identifier '"' (',' '"' analysis_identifier '"')* ')';

analog_filter_function_call: 'ddt' '(' analog_expression (',' abstol_expression)? ')'
                           | 'ddx' '(' analog_expression ',' branch_probe_function_call ')'
                           | 'idt' '(' analog_expression (',' analog_expression (',' analog_expression (',' abstol_expression)?)?)? ')'
                           | 'idtmod' '(' analog_expression (',' analog_expression (',' analog_expression (',' analog_expression (',' abstol_expression)?)?)?)? ')'
                           | 'absdelay' '(' analog_expression ',' analog_expression (',' constant_expression)? ')'
                           | 'transition' '(' analog_expression (',' analog_expression (',' analog_expression (',' analog_expression (',' constant_expression)?)?)?)? ')'
                           | 'slew' '(' analog_expression (',' analog_expression (',' analog_expression)?)? ')'
                           | 'last_crossing' '(' analog_expression (',' analog_expression)? ')'
                           | 'limexp' '(' analog_expression ')'
                           | laplace_filter_name '(' analog_expression ',' (analog_filter_function_arg)? ',' (analog_filter_function_arg)? (',' constant_expression)? ')'
                           | zi_filter_name '(' analog_expression ',' (analog_filter_function_arg)? ',' (analog_filter_function_arg)? ',' constant_expression
                              (',' analog_expression (',' constant_expression)?)? ')';

analog_small_signal_function_call: 'ac_stim' '(' ('"' analysis_identifier '"' (',' analog_expression (',' analog_expression)?)?)? ')'
                                | 'white_noise' '(' analog_expression (',' string_literal)? ')'
                                | 'flicker_noise' '(' analog_expression ',' analog_expression (',' string_literal)? ')'
                                | 'noise_table' '(' noise_table_input_arg (',' string_literal)? ')'
                                | 'noise_table_log' '(' noise_table_input_arg (',' string_literal)? ')';

noise_table_input_arg: parameter_identifier
                    | parameter_identifier '[' msb_constant_expression ':' lsb_constant_expression ']'
                    | string_literal
                    | constant_arrayinit;

laplace_filter_name: 'laplace_zd' | 'laplace_zp' | 'laplace_np' | 'laplace_nd';

zi_filter_name: 'zi_zp' | 'zi_zd' | 'zi_np' | 'zi_nd';

nature_access_function: nature_attribute_identifier | 'potential' | 'flow';

branch_probe_function_call: nature_access_function '(' branch_reference ')' | nature_access_function '(' analog_net_reference (',' analog_net_reference)? ')';

port_probe_function_call: nature_attribute_identifier '(' '<' analog_port_reference '>' ')';

constant_analog_function_call: analog_function_identifier attribute_instance* '(' constant_expression (',' constant_expression)* ')';

constant_function_call: function_identifier attribute_instance* '(' constant_expression (',' constant_expression)* ')';

constant_system_function_call: system_function_identifier '(' constant_expression (',' constant_expression)* ')';

constant_analog_built_in_function_call: analog_built_in_function_name '(' constant_expression (',' constant_expression)? ')';

function_call: hierarchical_function_identifier attribute_instance* '(' expression (',' expression)* ')';

system_function_call: system_function_identifier ('[' (expression (',' expression)?)? ']')?;


