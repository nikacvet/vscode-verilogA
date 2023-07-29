lexer grammar LexRules;

MACROMODULE : 'macromodule' ;
MODULE : 'module' ;
EXP : [eE] ;


DECIMAL_BASE : APOSTROPHE_FRAG S_FRAG? D_FRAG ;
OCTAL_BASE : APOSTROPHE_FRAG S_FRAG? O_FRAG ;
APOSTROPHE_ZERO : APOSTROPHE_FRAG ZERO_FRAG ;
APOSTROPHE_ONE : APOSTROPHE_FRAG ONE_FRAG ;
ZERO : [0] ;
ONE : [1] ;
TWO : [2] ;
OCTAL_DIGIT : [3-7] ;
DECIMAL_DIGIT : [89] ;

APOSTROPHE : ['] ;

B : [bB] ;
F : [fF] ;
R : [rR] ;
P : [pP] ;
N : [nN] ;
LOWER_S : [s] ;
LOWER_MS : [m][s] ;
LOWER_US : [u][s] ;
LOWER_NS : [n][s] ;
LOWER_PS : [p][s] ;
LOWER_FS : [f][s] ;
UNDERSCORE : [_] ;
QUESTION : [?] ;

C_IDENTIFIER : [a-zA-Z_] ( [a-zA-Z0-9_] )* ;
SIMPLE_IDENTIFIER : [a-zA-Z_] ( [a-zA-Z0-9_$] )* ;
SYSTEM_TF_IDENTIFIER : '$' [a-zA-Z0-9_$] ( [a-zA-Z0-9_$] )* ;

ESCAPED_IDENTIFIER : '\\' ( ANY_PRINTABLE_ASCII_CHARACTER_EXCEPT_WHITE_SPACE )* ;

SPACE : ' ' -> skip ;
TAB : '\t' -> skip ;
NEWLINE : '\r'? '\n' -> skip ;

/* ANY_PRINTABLE_ASCII_CHARACTER_EXCEPT_WHITE_SPACE : [\u0021-\u007E] ; */


/* ANY_ASCII_CHARACTER : [\u0000-\u007F] ; */
ANY_ASCII_CHARACTER : [\u0000-\u007F] ;

ONE_LINE_COMMENT : '//' (~[\n])* '\n' -> skip ;
BLOCK_COMMENT : '/*' .*? '*/' -> skip ;

FILENAME : '<' [a-zA-Z0-9_./\\\-]+ '.' ('va') '>'
  | '"' [a-zA-Z0-9_./\\\-]+ '.' ('va') '"' 
  | '"' [a-zA-Z0-9_/\\\-]+ '"' ;

STRING_LITERAL : '"' (~["] | '\\"')* '"' ;
fragment ANY_PRINTABLE_ASCII_CHARACTER_EXCEPT_WHITE_SPACE : [\u0021-\u007E] ;
fragment APOSTROPHE_FRAG : ['] ;
fragment S_FRAG : [sS] ;
fragment D_FRAG : [dD] ;
fragment O_FRAG : [oO] ;
fragment ZERO_FRAG : [0] ;
fragment ONE_FRAG : [1] ;
