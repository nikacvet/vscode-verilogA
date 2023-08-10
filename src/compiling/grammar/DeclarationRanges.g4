grammar DeclarationRanges;
import FunctionDeclarations;


dimension: '[' dimension_constant_expression ':' dimension_constant_expression ']';
range: '[' msb_constant_expression ':' lsb_constant_expression ']';

value_range: value_range_type '(' value_range_expression ':' value_range_expression ')'
            | value_range_type '(' value_range_expression ':' value_range_expression ']'
            | value_range_type '[' value_range_expression ':' value_range_expression ')'
            | value_range_type '[' value_range_expression ':' value_range_expression ']'
            | value_range_type '{' string_literal (',' string_literal)* '}'
            | 'exclude' constant_expression;

value_range_type: 'from' | 'exclude';

value_range_expression: constant_expression | '-inf' | 'inf';
