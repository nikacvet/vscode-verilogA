grammar UDPInstantiation;
import ContinuousAssignment;

udp_instantiation : udp_identifier (drive_strength)? (delay2)? udp_instance (',' udp_instance)* ';';
udp_instance : name_of_udp_instance? '(' output_terminal ',' input_terminal (',' input_terminal)* ')';
name_of_udp_instance : udp_instance_identifier (range)?;

