grammar Primaries;
import ExpressionLeftsideValues;


analog_primary : number
               | analog_concatenation
               | analog_multiple_concatenation
               | variable_reference
               | net_reference
               | genvar_identifier
               | parameter_reference
               | nature_attribute_reference
               | branch_probe_function_call
               | port_probe_function_call
               | analog_function_call
               | analog_system_function_call
               | analog_built_in_function_call
               | analog_filter_function_call
               | analog_small_signal_function_call
               | analysis_function_call
               | '(' analog_expression ')';

constant_primary : number
                 | parameter_identifier ('[' constant_range_expression ']')?
                 | specparam_identifier ('[' constant_range_expression ']')?
                 | constant_concatenation
                 | constant_multiple_concatenation
                 | constant_function_call
                 | constant_system_function_call
                 | constant_analog_built_in_function_call
                 | '(' constant_mintypmax_expression ')'
                 | STRING
                 | system_parameter_identifier
                 | nature_attribute_reference
                 | constant_analog_function_call;

module_path_primary : number
                     | identifier
                     | module_path_concatenation
                     | module_path_multiple_concatenation
                     | function_call
                     | system_function_call
                     | '(' module_path_mintypmax_expression ')';

primary : number
         | hierarchical_identifier ('{' ('[' expression ']')? ('[' range_expression ']')? '}')?
         | concatenation
         | multiple_concatenation
         | function_call
         | system_function_call
         | '(' mintypmax_expression ')'
         | string_literal
         | branch_probe_function_call
         | port_probe_function_call
         | nature_attribute_reference
         | analog_function_call
         | analog_built_in_function_call;
