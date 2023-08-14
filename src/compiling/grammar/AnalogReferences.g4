grammar AnalogReferences;
import Attributes;


nature_attribute_reference: net_identifier '.' potential_or_flow '.' nature_attribute_identifier;
analog_port_reference: port_identifier
                      | port_identifier '[' constant_expression ']'
                      | hierarchical_port_identifier
                      | hierarchical_port_identifier '[' constant_expression ']';
analog_net_reference: port_identifier
                    | port_identifier '[' constant_expression ']'
                    | net_identifier
                    | net_identifier '[' constant_expression ']'
                    | hierarchical_port_identifier
                    | hierarchical_port_identifier '[' constant_expression ']'
                    | hierarchical_net_identifier
                    | hierarchical_net_identifier '[' constant_expression ']';
branch_reference: hierarchical_branch_identifier
                | hierarchical_branch_identifier '[' constant_expression ']'
                | hierarchical_unnamed_branch_reference;
hierarchical_unnamed_branch_reference: hierarchical_inst_identifier '.branch' '(' branch_terminal ( ',' branch_terminal )? ')'
                                      | hierarchical_inst_identifier '.branch' '(' '<' port_identifier '>' ')'
                                      | hierarchical_inst_identifier '.branch' '(' '<' hierarchical_port_identifier '>' ')';
parameter_reference: parameter_identifier
                   | parameter_identifier '[' analog_expression ']';
variable_reference: variable_identifier
                 | variable_identifier '[' analog_expression ']' ( '{' '[' analog_expression ']' '}')?
                 | real_identifier
                 | real_identifier '[' analog_expression ']' ( '{' '[' analog_expression ']' '}')?;
net_reference: hierarchical_net_identifier
             | hierarchical_net_identifier '[' analog_range_expression ']'
             | hierarchical_port_identifier
             | hierarchical_port_identifier '[' analog_range_expression ']';


