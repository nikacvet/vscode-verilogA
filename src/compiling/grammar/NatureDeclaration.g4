grammar NatureDeclaration;
import DisciplineDeclaration;


nature_declaration: 'nature' nature_identifier (':' parent_nature)? ';'
                   '{' nature_item '}'
                   'endnature';
parent_nature: nature_identifier
            | discipline_identifier '.' potential_or_flow;
nature_item: nature_attribute;
nature_attribute: nature_attribute_identifier '=' nature_attribute_expression ';';

