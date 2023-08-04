grammar ContinuousAssignment;
import ProceduralBlocksAndAssignments;

continuous_assign : 'assign' drive_strength? delay3? list_of_net_assignments ';';
list_of_net_assignments : net_assignment (',' net_assignment)*;
net_assignment : net_lvalue '=' expression;
