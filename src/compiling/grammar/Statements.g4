grammar Statements;
import TimingControlStatements;

analog_statement : '{' attribute_instance? analog_loop_generate_statement
                 | '{' attribute_instance? analog_loop_statement
                 | '{' attribute_instance? analog_case_statement
                 | '{' attribute_instance? analog_conditional_statement
                 | '{' attribute_instance? analog_procedural_assignment
                 | '{' attribute_instance? analog_seq_block
                 | '{' attribute_instance? analog_system_task_enable
                 | '{' attribute_instance? contribution_statement
                 | '{' attribute_instance? indirect_contribution_statement
                 | '{' attribute_instance? analog_event_control_statement;

analog_statement_or_null : analog_statement
                         | '{' attribute_instance? '}';

analog_event_statement : '{' attribute_instance? analog_loop_statement
                        | '{' attribute_instance? analog_case_statement
                        | '{' attribute_instance? analog_conditional_statement
                        | '{' attribute_instance? analog_procedural_assignment
                        | '{' attribute_instance? analog_event_seq_block
                        | '{' attribute_instance? analog_system_task_enable
                        | '{' attribute_instance? disable_statement
                        | '{' attribute_instance? event_trigger
                        | '{' attribute_instance? '}';

analog_function_statement : '{' attribute_instance? analog_function_case_statement
                           | '{' attribute_instance? analog_function_conditional_statement
                           | '{' attribute_instance? analog_function_loop_statement
                           | '{' attribute_instance? analog_function_seq_block
                           | '{' attribute_instance? analog_procedural_assignment
                           | '{' attribute_instance? analog_system_task_enable;

analog_function_statement_or_null : analog_function_statement
                                   | '{' attribute_instance? '}';

statement : '{' attribute_instance? blocking_assignment ';'
          | '{' attribute_instance? case_statement ';'
          | '{' attribute_instance? conditional_statement ';'
          | '{' attribute_instance? disable_statement ';'
          | '{' attribute_instance? event_trigger ';'
          | '{' attribute_instance? loop_statement ';'
          | '{' attribute_instance? nonblocking_assignment ';'
          | '{' attribute_instance? par_block ';'
          | '{' attribute_instance? procedural_continuous_assignments ';'
          | '{' attribute_instance? procedural_timing_control_statement ';'
          | '{' attribute_instance? seq_block ';'
          | '{' attribute_instance? system_task_enable ';'
          | '{' attribute_instance? task_enable ';'
          | '{' attribute_instance? wait_statement ';';

statement_or_null : statement
                  | '{' attribute_instance? '}';

function_statement : statement;
