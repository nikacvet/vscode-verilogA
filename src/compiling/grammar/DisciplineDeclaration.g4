grammar DisciplineDeclaration;
import ParamsetDeclaration;

discipline_declaration: 'discipline' discipline_identifier ';'? '{' discipline_item '}' 'enddiscipline';
discipline_item: nature_binding
               | discipline_domain_binding
               | nature_attribute_override;
nature_binding: potential_or_flow nature_identifier ';';
potential_or_flow: 'potential' | 'flow';
discipline_domain_binding: 'domain' discrete_or_continuous ';';
discrete_or_continuous: 'discrete' | 'continuous';
nature_attribute_override: potential_or_flow '.' nature_attribute;
