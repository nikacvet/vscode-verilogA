grammar ConditionalStatements;
import CaseStatements;

analog_conditional_statement : 'if' '(' analog_expression ')' analog_statement_or_null
                              ( 'else' 'if' '(' analog_expression ')' analog_statement_or_null )*
                              ( 'else' analog_statement_or_null )?;

analog_function_conditional_statement : 'if' '(' analog_expression ')' analog_function_statement_or_null
                                       ( 'else' 'if' '(' analog_expression ')' analog_function_statement_or_null )*
                                       ( 'else' analog_function_statement_or_null )?;

conditional_statement : 'if' '(' expression ')' statement_or_null
                        ( 'else' statement_or_null )?
                        ;

if_else_if_statement : 'if' '(' expression ')' statement_or_null
                       ( 'else' 'if' '(' expression ')' statement_or_null )*
                       ( 'else' statement_or_null )?;