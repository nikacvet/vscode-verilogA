grammar Numbers;
import Strings;

number : real_number ;
real_number : fixed_point_number
  | unsigned_number ( '.' unsigned_number )? exp ( sign )? unsigned_number ;
fixed_point_number : unsigned_number '.' unsigned_number ;
exp : EXP ;
unsigned_number : decimal_digit ( UNDERSCORE | decimal_digit )* ;
sign : '+' | '-' ;
size : non_zero_unsigned_number ;
non_zero_unsigned_number : non_zero_decimal_digit ( UNDERSCORE | decimal_digit )* ;
decimal_digit : ZERO | non_zero_decimal_digit ;
non_zero_decimal_digit : ONE | TWO | OCTAL_DIGIT | DECIMAL_DIGIT ;

unbased_unsized_literal : APOSTROPHE_ZERO | APOSTROPHE_ONE ;
decimal_base : DECIMAL_BASE ;
