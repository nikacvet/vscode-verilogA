grammar TaskEnableStatements;
import ContributionStatements;

analog_system_task_enable: analog_system_task_identifier ('[' ('[' analog_expression (',' '[' analog_expression (',' '[' analog_expression (',' '[' analog_expression ']' )*)? ']' (',' '[' analog_expression (',' '[' analog_expression ']' )*)? ']' )?)? ']')?;

system_task_enable: system_task_identifier ('[' ('[' expression (',' '[' expression (',' '[' expression (',' '[' expression ']' )*)? ']' (',' '[' expression (',' '[' expression ']' )*)? ']' )?)? ']')?;

task_enable: hierarchical_task_identifier ('(' expression (',' expression)* ')')?;

