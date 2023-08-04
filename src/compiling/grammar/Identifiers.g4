grammar Identifiers;
import LexRules;

// identifier: simple_identifier | ESCAPED_IDENTIFIER;
// simple_identifier: SIMPLE_IDENTIFIER | c_identifier;
c_identifier : C_IDENTIFIER | LOWER_S | LOWER_MS | LOWER_US | LOWER_NS | LOWER_PS | LOWER_FS | B | F | R | P | N | UNDERSCORE ;
// const_identifier : identifier ;
// function_identifier : identifier ;
// module_identifier : identifier ;
// parameter_identifier : identifier ;
// port_identifier : identifier ;
// package_identifier : identifier ;
// package_scope : package_identifier '::' | '$unit' '::' ;




ams_net_identifier : net_identifier (dimension | hierarchical_net_identifier);
analog_block_identifier : block_identifier;
analog_function_identifier : identifier;
analog_system_task_identifier : system_task_identifier;
analog_system_function_identifier : system_function_identifier;
analysis_identifier : identifier;
block_identifier : identifier;
branch_identifier : identifier;
cell_identifier : identifier;
config_identifier : identifier;
connectmodule_identifier : module_identifier;
connectrules_identifier : identifier;
discipline_identifier : identifier;
escaped_identifier : ESCAPED_IDENTIFIER;
event_identifier : identifier;
function_identifier : identifier;
gate_instance_identifier : identifier;
generate_block_identifier : identifier;
genvar_identifier : identifier;
hierarchical_block_identifier : hierarchical_identifier;
hierarchical_branch_identifier : hierarchical_identifier;
hierarchical_event_identifier : hierarchical_identifier;
hierarchical_function_identifier : hierarchical_identifier;
hierarchical_identifier : ('$root' '.' )? (identifier ('[' constant_expression ']')? '.');
hierarchical_inst_identifier : hierarchical_identifier;
hierarchical_net_identifier : hierarchical_identifier;
hierarchical_parameter_identifier : hierarchical_identifier;
hierarchical_port_identifier : hierarchical_identifier;
hierarchical_variable_identifier : hierarchical_identifier;
hierarchical_task_identifier : hierarchical_identifier;
identifier : simple_identifier | escaped_identifier;
inout_port_identifier : identifier;
input_port_identifier : identifier;
instance_identifier : identifier;
library_identifier : identifier;
module_identifier : identifier;
module_instance_identifier : identifier;
module_or_paramset_identifier : module_identifier | paramset_identifier;
module_output_variable_identifier : identifier;
module_parameter_identifier : identifier;
nature_identifier : identifier;
nature_access_identifier : identifier | 'abstol' | 'access' | 'ddt_nature' | 'idt_nature' | 'units';
net_identifier : identifier;
output_port_identifier : identifier;
parameter_identifier : identifier;
paramset_identifier : identifier;
port_identifier : identifier;
real_identifier : identifier;
simple_identifier : SIMPLE_IDENTIFIER | c_identifier ;
specparam_identifier : identifier;
system_function_identifier : SYSTEM_TF_IDENTIFIER;
system_parameter_identifier : SYSTEM_TF_IDENTIFIER;
system_task_identifier : SYSTEM_TF_IDENTIFIER;
task_identifier : identifier;
terminal_identifier : identifier;
text_macro_identifier : identifier | '__VAMS_ENABLE__' | '__VAMS_COMPACT_MODELING__';
topmodule_identifier : identifier;
udp_identifier : identifier;
udp_instance_identifier : identifier;
variable_identifier : identifier;


