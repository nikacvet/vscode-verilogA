grammar DeclarationLists;
import DeclarationAssignments;

list_of_branch_identifiers: branch_identifier (range)? (',' branch_identifier (range)?)*;
list_of_defparam_assignments: defparam_assignment (',' defparam_assignment)*;
list_of_event_identifiers: event_identifier (dimension)? (',' event_identifier (dimension)?)*;
list_of_net_decl_assignments: net_decl_assignment (',' net_decl_assignment)*;
list_of_net_identifiers: ams_net_identifier (',' ams_net_identifier)*;
list_of_param_assignments: param_assignment (',' param_assignment)*;
list_of_port_identifiers: port_identifier (',' port_identifier)*;
list_of_real_identifiers: real_type (',' real_type)*;
list_of_specparam_assignments: specparam_assignment (',' specparam_assignment)*;
list_of_variable_identifiers: variable_type (',' variable_type)*;
list_of_variable_port_identifiers: port_identifier ('=' constant_expression)? (',' port_identifier ('=' constant_expression)?)*;