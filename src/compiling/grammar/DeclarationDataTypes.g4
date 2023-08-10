grammar DeclarationDataTypes;
import DeclarationLists;



net_type : 'supply0' | 'supply1' | 'tri' | 'triand' | 'trior' | 'tri0' | 'tri1' | 'uwire'
  | 'wire' | 'wand' | 'wor' ;

output_variable_type : 'integer' | 'time';
real_type: real_identifier (dimension)? ( '[' '=' constant_arrayinit ']' | '=' constant_expression )?;
variable_type: variable_identifier (dimension)? ( '[' '=' constant_arrayinit ']' | '=' constant_expression )?;


drive_strength : '(' strength0 ',' strength1 ')'
  | '(' strength1 ',' strength0 ')'
  | '(' strength0 ',' 'highz1' ')'
  | '(' strength1 ',' 'highz0' ')'
  | '(' 'highz0' ',' strength1 ')'
  | '(' 'highz1' ',' strength0 ')' ;
strength0 : 'supply0' | 'strong0' | 'pull0' | 'weak0' ;
strength1 : 'supply1' | 'strong1' | 'pull1' | 'weak1' ;
charge_strength : '(' 'small' ')' | '(' 'medium' ')' | '(' 'large' ')' ;


delay3 : '#' delay_value | '#' '(' mintypmax_expression ( ',' mintypmax_expression
    ( ',' mintypmax_expression )? )? ')' ;
delay2 : '#' delay_value | '#' '(' mintypmax_expression ( ',' mintypmax_expression )? ')' ;
delay_value : unsigned_number | real_number | identifier ;