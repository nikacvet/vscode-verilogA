grammar ModuleItems;
import ConfigurationSourceText;

module_item: port_declaration ';'
           | non_port_module_item;
module_or_generate_item: attribute_instance module_or_generate_item_declaration
                       | attribute_instance local_parameter_declaration
                       | attribute_instance parameter_override
                       | attribute_instance continuous_assign
                       | attribute_instance gate_instantiation
                       | attribute_instance udp_instantiation
                       | attribute_instance module_instantiation
                       | attribute_instance initial_construct
                       | attribute_instance always_construct
                       | attribute_instance loop_generate_construct
                       | attribute_instance conditional_generate_construct
                       | attribute_instance analog_construct;
module_or_generate_item_declaration: net_declaration
                                  | reg_declaration
                                  | integer_declaration
                                  | real_declaration
                                  | time_declaration
                                  | realtime_declaration
                                  | event_declaration
                                  | genvar_declaration
                                  | task_declaration
                                  | function_declaration
                                  | branch_declaration
                                  | analog_function_declaration;
non_port_module_item: module_or_generate_item
                   | generate_region
                   | specify_block
                   | attribute_instance parameter_declaration ';'
                   | attribute_instance specparam_declaration
                   | aliasparam_declaration;
parameter_override: 'defparam' list_of_defparam_assignments ';';

