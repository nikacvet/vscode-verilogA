grammar AnalogReferences;
import Attributes;


analog_concatenation: '{' analog_expression (',' analog_expression)* '}';

analog_multiple_concatenation: '{' constant_expression analog_concatenation '}';

analog_filter_function_arg: parameter_identifier
                         | parameter_identifier '[' msb_constant_expression ':' lsb_constant_expression ']'
                         | constant_optional_arrayinit;

concatenation: '{' expression (',' expression)* '}';

constant_concatenation: '{' constant_expression (',' constant_expression)* '}';

constant_multiple_concatenation: '{' constant_expression constant_concatenation '}';

module_path_concatenation: '{' module_path_expression (',' module_path_expression)* '}';

module_path_multiple_concatenation: '{' constant_expression module_path_concatenation '}';

multiple_concatenation: '{' constant_expression concatenation '}';

assignment_pattern: '{' expression (',' expression)* '}'
                  | '{' constant_expression expression (',' expression)* '}';

constant_assignment_pattern: '{' constant_expression (',' constant_expression)* '}'
                          | '{' constant_expression constant_expression (',' constant_expression)* '}';
