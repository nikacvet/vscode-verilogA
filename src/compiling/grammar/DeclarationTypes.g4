grammar DeclarationTypes;
import DeclarationDataTypes;


// Module parameter declarations
local_parameter_declaration: 'localparam' ('signed')? ('[' range ']')? list_of_param_assignments
                          | 'localparam' parameter_type list_of_param_assignments;
parameter_declaration: 'parameter' ('signed')? ('[' range ']')? list_of_param_assignments
                     | 'parameter' parameter_type list_of_param_assignments;
specparam_declaration: 'specparam' ('[' range ']')? list_of_specparam_assignments ';';
parameter_type: 'integer' | 'real' | 'realtime' | 'time' | 'string';
aliasparam_declaration: 'aliasparam' parameter_identifier '=' parameter_identifier ';';

// Port declarations
inout_declaration: 'inout' '[' discipline_identifier ']' '[' (net_type | 'wreal') ']' 'signed'? 'range'? list_of_port_identifiers;
input_declaration: 'input' '[' discipline_identifier ']' '[' (net_type | 'wreal') ']' 'signed'? 'range'? list_of_port_identifiers;
output_declaration: 'output' '[' discipline_identifier ']' '[' (net_type | 'wreal') ']' 'signed'? 'range'? list_of_port_identifiers
                 | 'output' '[' discipline_identifier ']' 'reg' 'signed'? 'range'? list_of_variable_port_identifiers
                 | 'output' output_variable_type list_of_variable_port_identifiers;



// Type declarations
branch_declaration: 'branch' '(' branch_terminal (',' branch_terminal)? ')' list_of_branch_identifiers ';'
                  | port_branch_declaration;
port_branch_declaration: 'branch' '(' '<' port_identifier '>' ')' list_of_branch_identifiers ';'
                      | 'branch' '(' '<' hierarchical_port_identifier '>' ')' list_of_branch_identifiers ';';
branch_terminal: net_identifier
               | net_identifier '[' constant_expression ']'
               | net_identifier '[' constant_range_expression ']'
               | hierarchical_net_identifier
               | hierarchical_net_identifier '[' constant_expression ']'
               | hierarchical_net_identifier '[' constant_range_expression ']';
event_declaration: 'event' list_of_event_identifiers ';';
integer_declaration: 'integer' list_of_variable_identifiers ';';
net_declaration: net_type discipline_identifier? 'signed'? delay3? list_of_net_identifiers ';'
               | net_type discipline_identifier? drive_strength? 'signed'? delay3? list_of_net_decl_assignments ';'
               | net_type discipline_identifier? ('vectored' | 'scalared')? 'signed'? range delay3? list_of_net_identifiers ';'
               | net_type discipline_identifier? drive_strength? ('vectored' | 'scalared')? 'signed'? range delay3? list_of_net_decl_assignments
               | 'trireg' discipline_identifier? charge_strength? 'signed'? delay3? list_of_net_identifiers ';'
               | 'trireg' discipline_identifier? drive_strength? 'signed'? delay3? list_of_net_decl_assignments ';'
               | 'trireg' discipline_identifier? charge_strength? ('vectored' | 'scalared')? 'signed'? range delay3? list_of_net_identifiers ';'
               | 'trireg' discipline_identifier? drive_strength? ('vectored' | 'scalared')? 'signed'? range delay3? list_of_net_decl_assignments ';'
               | discipline_identifier? range? list_of_net_identifiers ';'
               | discipline_identifier? range? list_of_net_decl_assignments ';'
               | 'wreal' discipline_identifier? range? list_of_net_identifiers ';'
               | 'wreal' discipline_identifier? range? list_of_net_decl_assignments ';'
               | 'ground' discipline_identifier? range? list_of_net_identifiers ';';
real_declaration: 'real' list_of_real_identifiers ';';
realtime_declaration: 'realtime' list_of_real_identifiers ';';
reg_declaration: 'reg' discipline_identifier? 'signed'? range? list_of_variable_identifiers ';';
time_declaration: 'time' list_of_variable_identifiers ';';


