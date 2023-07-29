grammar Operators;
import Numbers;

unary_operator : '+' | '-' | '!' | '~' | '&' | '~&' | '|' | '?:' | '^' | '~^' | '^~' ;
binary_operator : '+' | '-' | '*' | '/' | '%' | '==' | '!=' | '&&' | '||'
  | '<' | '<=' | '>' | '>=' | '&' | '|' | '^' | '^~' | '~^' | '>>' | '<<' ;
unary_module_path_operator : '!' | '~' | '&' | '~&' | '|' | '~|' | '^' | '~^' | '^~' ;
binary_module_path_operator : '==' | '!=' | '&&' | '||' | '&' | '|' | '^' | '^~' | '~^' ;
ternary_operator : '?:';