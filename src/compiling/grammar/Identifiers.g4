grammar Identifiers;
import LexRules;

identifier: simple_identifier | ESCAPED_IDENTIFIER;
simple_identifier: SIMPLE_IDENTIFIER | c_identifier;
c_identifier : C_IDENTIFIER | LOWER_S | LOWER_MS | LOWER_US | LOWER_NS | LOWER_PS | LOWER_FS | B | F | R | P | N | UNDERSCORE ;
const_identifier : identifier ;
function_identifier : identifier ;
module_identifier : identifier ;
parameter_identifier : identifier ;
port_identifier : identifier ;
package_identifier : identifier ;
package_scope : package_identifier '::' | '$unit' '::' ;

