grammar UDPDeclaration;
import UDPPorts;

udp_declaration : '{' attribute_instance? '}' 'primitive' udp_identifier '(' udp_port_list ')' ';'
                 udp_port_declaration* udp_body 'endprimitive'
                 | '{' attribute_instance? '}' 'primitive' udp_identifier '(' udp_declaration_port_list ')' ';'
                 udp_body 'endprimitive';