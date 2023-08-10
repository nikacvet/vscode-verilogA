grammar DeclarationAssignments;
import DeclarationRanges;


defparam_assignment: hierarchical_parameter_identifier '=' constant_mintypmax_expression;
net_decl_assignment: ams_net_identifier '=' expression;

param_assignment: parameter_identifier '=' constant_mintypmax_expression value_range?
                | parameter_identifier range '=' constant_arrayinit value_range?;

specparam_assignment: specparam_identifier '=' constant_mintypmax_expression
                   | pulse_control_specparam;

pulse_control_specparam: 'PATHPULSE$' '=' '(' reject_limit_value (',' error_limit_value)? ')'
                      | 'PATHPULSE$specify_input_terminal_descriptor$specify_output_terminal_descriptor'
                      '=' '(' reject_limit_value (',' error_limit_value)? ')';

error_limit_value: limit_value;
reject_limit_value: limit_value;
limit_value: constant_mintypmax_expression;