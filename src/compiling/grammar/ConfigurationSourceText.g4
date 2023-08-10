grammar ConfigurationSourceText;
import NatureDeclaration;


config_declaration: 'config' config_identifier ';'
                   design_statement
                   '{' config_rule_statement '}'
                   'endconfig';

design_statement: 'design' '{' (library_identifier '.')? cell_identifier '}';

config_rule_statement: default_clause liblist_clause
                     | inst_clause liblist_clause
                     | inst_clause use_clause
                     | cell_clause liblist_clause
                     | cell_clause use_clause;

default_clause: 'default';
inst_clause: 'instance' inst_name;
inst_name: topmodule_identifier ('.' instance_identifier)?;
cell_clause: 'cell' (library_identifier '.')? cell_identifier;
liblist_clause: 'liblist' '{' library_identifier '}';
use_clause: 'use' (library_identifier '.')? cell_identifier (':' 'config')?;

