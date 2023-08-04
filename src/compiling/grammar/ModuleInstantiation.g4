grammar ModuleInstantiation;
import GenerateInstantiation;




module_instantiation : module_or_paramset_identifier (parameter_value_assignment)?
                        module_instance (',' module_instance)* ';';
parameter_value_assignment : '#' '(' list_of_parameter_assignments ')';
list_of_parameter_assignments : ordered_parameter_assignment (',' ordered_parameter_assignment)*
                                | named_parameter_assignment (',' named_parameter_assignment)*;
ordered_parameter_assignment : expression;
named_parameter_assignment : '.' parameter_identifier ('(' mintypmax_expression? ')'
                               | '.' system_parameter_identifier ('(' constant_expression? ')'));
module_instance : name_of_module_instance ('(' list_of_port_connections? ')');
name_of_module_instance : module_instance_identifier (range)?;
list_of_port_connections : ordered_port_connection (',' ordered_port_connection)*
                           | named_port_connection (',' named_port_connection)*;
ordered_port_connection : attribute_instance? expression;
named_port_connection : attribute_instance? '.' port_identifier ('(' expression? ')');


