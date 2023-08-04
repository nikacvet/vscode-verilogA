grammar FunctionDeclarations;
import TaskDeclarations;
//!! CHECK FOR ERRORS
analog_function_declaration: 'analog' 'function' analog_function_type? analog_function_identifier ';'
                             analog_function_item_declaration+
                             analog_function_statement
                             'endfunction';

analog_function_type : 'integer' | 'real';

analog_function_item_declaration : analog_block_item_declaration
                                  | input_declaration ';'
                                  | output_declaration ';'
                                  | inout_declaration ';';

function_declaration: 'function' 'automatic'? function_range_or_type? function_identifier ';' 
                    function_item_declaration+ 
                    function_statement 
                    'endfunction'
                    |'function' 'automatic'? function_range_or_type? function_identifier '(' function_port_list ')' 
                    '{' block_item_declaration '}'
                    function_statement 
                    'endfunction';

function_range_or_type: 
    '[' 'signed'? range']'
    | 'integer'
    | 'real'
    | 'realtime'
    | 'time';


function_item_declaration : block_item_declaration
                            | '{' attribute_instance '}' tf_input_declaration ';';

function_port_list : '{' attribute_instance '}' tf_input_declaration (',' '{' attribute_instance '}' tf_input_declaration)*;


