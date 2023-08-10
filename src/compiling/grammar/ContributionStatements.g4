grammar ContributionStatements;
import SpecifyBlockDeclaration;

contribution_statement: branch_lvalue '<+' analog_expression ';';
indirect_contribution_statement: branch_lvalue ':' indirect_expression '==' analog_expression ';';

