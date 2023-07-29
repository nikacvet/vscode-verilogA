lexer grammar VerilogALexer;

channels { COMMENTS, DIRECTIVES }

// functions and math reserved keywords
ABSTIME: '$abstime';
BOUND_STEP:'$bound_step';
DEBUG:'$debug';
DISCONTINUITY:'$discontinuity';
DISPLAY:'$display';
FCLOSE:'$fclose';
FDEBUG:'$fdebug';
FDISPLAY:'$fdisplay';
FINISH:'$finish';
FMONITOR:'$fmonitor';
FOPEN:'$fopen';
FSTROBE:'$fstrobe';
FWRITE:'$fwrite';
MFACTOR:'$mfactor';
MONITOR:'$monitor';
PARAMGIVEN:'$param_given';
PORTCONNECTED:'$port_connected';
RANDOM:'$random';
SIMPARAM:'$simparam';
STOP:'$stop';
STROBE:'$strobe';
TABLEMODEL:'$table_model';
TEMPERATURE:'$temperature';
VT:'$vt';
ABS:'abs';
ABSDELAY:'absdelay';
ACSTIM:'ac_stim';
ACOS:'acos';
ACOSH:'acosh';
ANALYSIS:'analysis';
ASIN:'asin';
ASINH:'asinh';
ATAN:'atan';
ATAN2:'atan2';
ATANH:'atanh';
CEIL:'ceil';
COS:'cos';
COSH:'cosh';
CROSS:'cross';
DDT:'ddt';
DDX:'ddx';
EXP:'exp';
FLICKERNOISE:'flicker_noise';
FLOOR:'floor';
HYPOT:'hypot';
IDT:'idt';
LAPLACEND:'laplace_nd';
LAPLACENP:'laplace_np';
LAPLACEZD:'laplace_zd';
LAPLACEZP:'laplace_zp';
LASTCROSSING:'last_crossing';
LIMEXP:'limexp';
LN:'ln';
LOG:'log';
MAX:'max';
MIN:'min';
POW:'pow';
SIN:'sin';
SINH:'sinh';
SLEW:'slew';
SQRT:'sqrt';
TAN:'tan';
TANH:'tanh';
TIMER:'timer';
TRANSITION:'transition';
WHITENOISE:'white_noise';

// keywords
ABSTOL:'abstol' ;
DISCIPLINE:'discipline'; 
FROM:'from' ;
NATURE:'nature';
ACCESS:'access' ;
ENDDISCIPLINE:'enddiscipline'; 
GENERATE:'generate' ;
POTENTIAL:'potential';
ANALOG:'analog' ;
ENDNATURE:'endnature'; 
GROUND:'ground' ;
UNITS:'units';
BRANCH:'branch'; 
EXCLUDE:'exclude'; 
IDT_NATURE:'idt_nature';
DDT_NATURE:'ddt_nature' ;
FLOW:'flow' ;
INF:'inf';

// others
REAL : 'real' ;
OR: 'or';
NOR: 'nor';
NAND: 'nand';
ALWAYS: 'always';
AND:'and';
BEGIN:'begin';
ASSIGN:'assign';
BUF:'buf';
BUFIFONE : 'bufif1' ;
BUFIFZERO : 'bufif0' ;
CASE : 'case' ;
CASEX : 'casex' ;
CASEZ : 'casez' ;
CELL : 'cell' ;
CMOS : 'cmos' ;
DEASSIGN:'deassign';
DEFAULT:'default';
DEFPARAM:'defparam';
DELAY:'delay';
DISABLE:'disable';
EDGE:'edge';
ELSE:'else';
END:'end';
ENDCASE:'endcase';
ENDMODULE:'endmodule';
ENDFUNCTION:'endfunction';
ENDPRIMITIVE:'endprimitive';
ENDSPECIFY:'endspecify';
ENDTABLE:'endtable';
ENDTASK:'endtask';
EVENT:'event';
FOR:'for';
FORCE:'force';
FOREVER:'forever';
FORK:'fork';
FUNCTION:'function';
HIGHZONE : 'highz1' ;
HIGHZZERO : 'highz0' ;
IF : 'if' ;
IFNONE : 'ifnone' ;
INITIAL : 'initial' ;
INITIALSTEP:'initial_step';
INOUT : 'inout' ;
INPUT : 'input' ;
INTEGER:'integer';
JOIN:'join';
LARGE:'large';
MACROMODULE:'macromodule';
MEDIUM:'medium';
MODULE:'module';
NEGEDGE:'negedge';
NMOS:'nmos';
NOISETABLE:'noise_table';
NOT:'not';
NOTIFONE : 'notif1' ;
NOTIFZERO : 'notif0' ;
OUTPUT : 'output' ;
PARAMETER : 'parameter' ;
PMOS : 'pmos' ;
POSEDGE : 'posedge' ;
PRIMITIVE : 'primitive' ;
PULLDOWN : 'pulldown' ;
PULLONE : 'pull1' ;
PULLUP : 'pullup' ;
PULLZERO : 'pull0' ;
RCMOS : 'rcmos' ;
REALTIME : 'realtime' ;
REG : 'reg' ;
RELEASE : 'release' ;
REPEAT : 'repeat' ;
RNMOS : 'rnmos' ;
RPMOS : 'rpmos' ;
RTRAN : 'rtran' ;
RTRANIFONE : 'rtranif1' ;
RTRANIFZERO : 'rtranif0' ;
SCALARED : 'scalared' ;
SMALL:'small';
SPECPARAM:'specparam';
SPECIFY:'specify';
STRONGZERO:'strong0';
STRONGONE:'strong1';
SUPPLYZERO:'supply0';
SUPPLYONE:'supply1';
TABLE:'table';
TASK:'task';
TIME:'time';
TRAN:'tran';
TRANIFONE : 'tranif1' ;
TRANIFZERO : 'tranif0' ;
TRI : 'tri' ;
TRIAND : 'triand' ;
TRIONE : 'tri1' ;
TRIOR : 'trior' ;
TRIREG : 'trireg' ;
TRIZERO : 'tri0' ;
VECTORED:'vectored';
WAIT:'wait';
WAND:'wand';
WEAKZERO:'weak0';
WEAKONE:'weak1';
WHILE:'while';
WIRE:'wire';
WOR:'wor';
XNOR:'xnor';
XOR:'xor';
ZI_ND:'zi_nd';
ZI_NP:'zi_np';
ZI_ZD:'zi_zd';
ZI_ZP:'zi_zp';


// operators --> need to be checked again if all in veriloga or not
AM : '&' ;
AMAM : '&&' ;
AMAMAM : '&&&' ;
AS : '*' ;
ASAS : '**' ;
ASGT : '*>' ;
AT : '@' ;
CA : '^' ;
CATI : '^~' ;
CL : ':' ;
CO : ',' ;
DL : '$' ;
DQ : '"' ;
DT : '.' ;
EM : '!' ;
EMEQ : '!=' ;
EMEQEQ : '!==' ;
EQ : '=' ;
EQEQ : '==' ;
EQEQEQ : '===' ;
EQGT : '=>' ;
GA : '`' -> channel(DIRECTIVES), pushMode(DIRECTIVE_MODE) ;
GT : '>' ;
GTEQ : '>=' ;
GTGT : '>>' ;
GTGTGT : '>>>' ;
HA : '#' ;
LB : '[' ;
LC : '{' ;
LP : '(' ;
LT : '<' ;
LTEQ : '<=' ;
LTLT : '<<' ;
LTLTLT : '<<<' ;
MI : '-' ;
MICL : '-:' ;
MIGT : '->' ;
MO : '%' ;
PL : '+' ;
PLCL : '+:' ;
QM : '?' ;
RB : ']' ;
RC : '}' ;
RP : ')' ;
SC : ';' ;
SL : '/' ;
TI : '~' ;
TIAM : '~&' ;
TICA : '~^' ;
TIVL : '~|' ;
VL : '|' ;
VLVL : '||' ;

UNSIGNED_NUMBER : [0-9] [0-9_]* ;
WHITE_SPACE : [ \t\r\n]+ -> channel(HIDDEN) ;
BLOCK_COMMENT : '/*' ASCII_ANY*? '*/' -> channel(COMMENTS) ;
LINE_COMMENT : '//' ASCII_NO_NEWLINE* -> channel(COMMENTS) ;
DECIMAL_BASE : '\'' [sS]? [dD] -> pushMode(DECIMAL_NUMBER_MODE) ;
EXPONENTIAL_NUMBER : UNSIGNED_NUMBER ( '.' UNSIGNED_NUMBER )? [eE] [+\-]? UNSIGNED_NUMBER ;
FIXED_POINT_NUMBER : UNSIGNED_NUMBER '.' UNSIGNED_NUMBER ;
STRING : '"' ( ASCII_NO_NEWLINE_QUOTE_BACKSLASH | ESC_SPECIAL_CHAR )* '"' ;
SIMPLE_IDENTIFIER : [a-zA-Z_] [a-zA-Z0-9_$]* ;
ESCAPED_IDENTIFIER : '\\' ASCII_PRINTABLE_NO_SPACE* [ \t\r\n] ;

mode DECIMAL_NUMBER_MODE;
UNSIGNED_NUMBER_0 : UNSIGNED_NUMBER -> type(UNSIGNED_NUMBER), popMode ;
WHITE_SPACE_1 : WHITE_SPACE -> channel(HIDDEN), type(WHITE_SPACE) ;


mode DIRECTIVE_MODE;
BEGIN_KEYWORDS_DIRECTIVE : 'begin_keywords' -> channel(DIRECTIVES), mode(BEGIN_KEYWORDS_DIRECTIVE_MODE) ;
DEFAULT_NODETYPE_DIRECTIVE : 'default_nodetype' -> channel(DIRECTIVES), mode(DEFAULT_NODETYPE_DIRECTIVE_MODE) ;
DEFINE_DIRECTIVE : 'define' -> channel(DIRECTIVES), mode(DEFINE_DIRECTIVE_MODE) ;
// ELSE_DIRECTIVE : 'else' -> channel(DIRECTIVES), popMode, mode(ELSE_DIRECTIVE_MODE) ;
// END_KEYWORDS_DIRECTIVE : 'end_keywords' -> channel(DIRECTIVES), popMode ;
// ENDIF_DIRECTIVE : 'endif' -> channel(DIRECTIVES), popMode, popMode, popMode ;
// IFDEF_DIRECTIVE : 'ifdef' -> channel(DIRECTIVES), mode(IFDEF_DIRECTIVE_MODE) ;
// INCLUDE_DIRECTIVE : 'include' -> channel(DIRECTIVES), mode(INCLUDE_DIRECTIVE_MODE) ;
// UNDEF_DIRECTIVE : 'undef' -> channel(DIRECTIVES), mode(UNDEF_DIRECTIVE_MODE) ;
// RESETALL_DIRECTIVE : 'resetall' -> channel(DIRECTIVES), popMode ;
//ANALOG_DIRECTIVE:'analog' -> channel(DIRECTIVES),mode(ANALOG_DIRECTIVE);
MACRO_USAGE : IDENTIFIER ( WHITE_SPACE? MACRO_ARGS )? -> channel(DIRECTIVES), popMode ;





mode BEGIN_KEYWORDS_DIRECTIVE_MODE;
BLOCK_COMMENT_1: BLOCK_COMMENT -> channel(COMMENTS),type(BLOCK_COMMENT);
DQ_0 : DQ -> channel(DIRECTIVES), type(DQ) ;
NEWLINE_0 : NEWLINE -> channel(HIDDEN), type(WHITE_SPACE), popMode ;
SPACE_TAB_0 : SPACE_TAB -> channel(HIDDEN), type(WHITE_SPACE) ;


mode DEFINE_DIRECTIVE_MODE;
MACRO_NAME : IDENTIFIER MACRO_ARGS? -> channel(DIRECTIVES), mode(MACRO_TEXT_MODE) ;
NEWLINE_12 : NEWLINE -> channel(HIDDEN), type(WHITE_SPACE), popMode ;
SPACE_TAB_11 : SPACE_TAB -> channel(HIDDEN), type(WHITE_SPACE) ;


mode DEFAULT_NODETYPE_DIRECTIVE_MODE;
BLOCK_COMMENT_4 : BLOCK_COMMENT -> channel(COMMENTS), type(BLOCK_COMMENT) ;
DEFAULT_NODETYPE_VALUE : ( 'wire' ) -> channel(DIRECTIVES), popMode ;
NEWLINE_1 : NEWLINE -> channel(HIDDEN), type(WHITE_SPACE), popMode ;
SPACE_TAB_1 : SPACE_TAB -> channel(HIDDEN), type(WHITE_SPACE) ;



mode MACRO_TEXT_MODE;
BLOCK_COMMENT_5 : BLOCK_COMMENT -> channel(COMMENTS), type(BLOCK_COMMENT) ;
GA_3 : GA -> channel(DIRECTIVES), type(MACRO_TEXT) ;
MACRO_DELIMITER : '``' -> channel(DIRECTIVES) ;
MACRO_ESC_NEWLINE : ESC_NEWLINE -> channel(DIRECTIVES) ;
MACRO_ESC_QUOTE : '`\\`"' -> channel(DIRECTIVES) ;
MACRO_ESC_SEQ : ESC_ASCII_NO_NEWLINE -> channel(DIRECTIVES), type(MACRO_TEXT) ;
MACRO_QUOTE : '`"' -> channel(DIRECTIVES) ;
MACRO_TEXT : ASCII_NO_NEWLINE_QUOTE_SLASH_BACKSLASH_GRAVE_ACCENT+ -> channel(DIRECTIVES) ;
NEWLINE_4 : NEWLINE -> channel(HIDDEN), type(WHITE_SPACE), popMode ;
SL_2 : SL -> more ;
STRING_0 : STRING -> channel(DIRECTIVES), type(STRING) ;











// cannot be seen as tokens
fragment ASCII_ANY : [\u0000-\u007f] ;
fragment ASCII_NO_NEWLINE : [\u0000-\u0009\u000b-\u000c\u000e-\u007f] ;
fragment ASCII_NO_NEWLINE_QUOTE_BACKSLASH : [\u0000-\u0009\u000b-\u000c\u000e-\u0021\u0023-\u005b\u005d-\u007f] ;
fragment ASCII_NO_NEWLINE_QUOTE_SLASH_BACKSLASH_GRAVE_ACCENT : [\u0000-\u0009\u000b-\u000c\u000e-\u0021\u0023-\u002e\u0030-\u005b\u005d-\u005f\u0061-\u007f] ;
fragment ASCII_NO_PARENTHESES : [\u0000-\u0027\u002a-\u007f] ;
fragment ASCII_NO_SLASH_GRAVE_ACCENT : [\u0000-\u002e\u0030-\u005f\u0061-\u007f] ;
fragment ASCII_PRINTABLE : [\u0020-\u007e] ;
fragment ASCII_PRINTABLE_NO_QUOTE_BACKSLASH : [\u0020-\u0021\u0023-\u005b\u005d-\u007e] ;
fragment ASCII_PRINTABLE_NO_SPACE : [\u0021-\u007e] ;
fragment CHAR_OCTAL : [0-7] [0-7]? [0-7]? ;
fragment ESC_ASCII_NO_NEWLINE : '\\' ASCII_NO_NEWLINE ;
fragment ESC_ASCII_PRINTABLE : '\\' ASCII_PRINTABLE ;
fragment ESC_NEWLINE : '\\' NEWLINE ;
fragment ESC_SPECIAL_CHAR : '\\' ( [nt\\"] | CHAR_OCTAL ) ;
fragment IDENTIFIER : ESCAPED_IDENTIFIER | SIMPLE_IDENTIFIER ;
fragment MACRO_ARGS : '(' ( MACRO_ARGS | ASCII_NO_PARENTHESES )* ')' ;
fragment NEWLINE : '\r'? '\n' ;
fragment SPACE_TAB : [ \t]+ ;





