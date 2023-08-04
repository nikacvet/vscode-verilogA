grammar TaskDeclarations;
import BlockItemDeclarations;


task_declaration : 'task' 'automatic'? task_identifier ';' task_item_declaration statement_or_null 'endtask'
                  | 'task' 'automatic'? task_identifier '(' '[' task_port_list ']' ')' ';' '{' block_item_declaration '}' statement_or_null 'endtask';

task_item_declaration : block_item_declaration
                        | '{' attribute_instance '}' tf_input_declaration ';'
                        | '{' attribute_instance '}' tf_output_declaration ';'
                        | '{' attribute_instance '}' tf_inout_declaration ';';

task_port_list : task_port_item (',' task_port_item)*;

task_port_item : '{' attribute_instance '}' tf_input_declaration
                 | '{' attribute_instance '}' tf_output_declaration
                 | '{' attribute_instance '}' tf_inout_declaration;

tf_input_declaration : 'input' discipline_identifier? 'reg'? 'signed'? range? list_of_port_identifiers
                        | 'input' task_port_type list_of_port_identifiers;

tf_output_declaration : 'output' discipline_identifier? 'reg'? 'signed'? range? list_of_port_identifiers
                         | 'output' task_port_type list_of_port_identifiers;

tf_inout_declaration : 'inout' discipline_identifier? 'reg'? 'signed'? range? list_of_port_identifiers
                        | 'inout' task_port_type list_of_port_identifiers;

task_port_type : 'integer' | 'real' | 'realtime' | 'time';


