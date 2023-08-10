grammar ModuleParametersAndPorts;
import ModuleItems;

module_parameter_port_list: '#' '(' parameter_declaration (',' parameter_declaration)* ')';
list_of_ports: '(' port (',' port)* ')';
list_of_port_declarations: '(' port_declaration (',' port_declaration)* ')' | '()';
port: '[' port_expression ']' | '.' port_identifier '(' '[' port_expression ']' ')';
port_expression: port_reference | '{' port_reference (',' port_reference)* '}';
port_reference: port_identifier '[' '[' constant_range_expression ']' ']';
port_declaration: '{' attribute_instance inout_declaration
                | '{' attribute_instance input_declaration
                | '{' attribute_instance output_declaration;



