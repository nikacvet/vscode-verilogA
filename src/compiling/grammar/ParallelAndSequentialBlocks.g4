grammar ParallelAndSequentialBlocks;
import Statements;

analog_seq_block : 'begin' ':' analog_block_identifier? analog_block_item_declaration* '{' analog_statement* '}' 'end';
analog_event_seq_block : 'begin' ':' analog_block_identifier? analog_block_item_declaration* '{' analog_event_statement* '}' 'end';
analog_function_seq_block : 'begin' ':' analog_block_identifier? analog_block_item_declaration* '{' analog_function_statement* '}' 'end';
par_block : 'fork' ':' block_identifier? block_item_declaration* '{' statement* '}' 'join';
seq_block : 'begin' ':' block_identifier? block_item_declaration* '{' statement* '}' 'end';

