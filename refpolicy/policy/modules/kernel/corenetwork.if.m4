########################################
#
# Network Interface generated macros 
#
########################################

define(`create_netif_interfaces',``
########################################
## <interface name="corenet_tcp_sendrecv_$1">
##	<description>
##		Send and receive TCP network traffic on the $1 interface.
##	</description>
##	<parameter name="domain">
##		The type of the process performing this action.
##	</parameter>
##	<infoflow type="both" weight="10"/>
## </interface>
#
interface(`corenet_tcp_sendrecv_$1',`
	gen_require(`
		type $1_netif_t;
		class netif { tcp_send tcp_recv };
	')

	allow dollarsone $1_netif_t:netif { tcp_send tcp_recv };
')

########################################
## <interface name="corenet_udp_send_$1">
##	<description>
##		Send UDP network traffic on the $1 interface.
##	</description>
##	<parameter name="domain">
##		The type of the process performing this action.
##	</parameter>
##	<infoflow type="write" weight="10"/>
## </interface>
#
interface(`corenet_udp_send_$1',`
	gen_require(`
		type $1_netif_t;
		class netif udp_send;
	')

	allow dollarsone $1_netif_t:netif udp_send;
')

########################################
## <interface name="corenet_udp_receive_$1">
##	<description>
##		Receive UDP network traffic on the $1 interface.
##	</description>
##	<parameter name="domain">
##		The type of the process performing this action.
##	</parameter>
##	<infoflow type="read" weight="10"/>
## </interface>
#
interface(`corenet_udp_receive_$1',`
	gen_require(`
		type $1_netif_t;
		class netif udp_recv;
	')

	allow dollarsone $1_netif_t:netif udp_recv;
')

########################################
## <interface name="corenetwork_sendrecv_udp_on_$1_interface">
##	<description>
##		Send and receive UDP network traffic on the $1 interface.
##	</description>
##	<parameter name="domain">
##		The type of the process performing this action.
##	</parameter>
##	<infoflow type="both" weight="10"/>
## </interface>
#
interface(`corenet_udp_sendrecv_$1',`
	corenet_udp_send_$1(dollarsone)
	corenet_udp_receive_$1(dollarsone)
')

########################################
## <interface name="corenet_raw_send_$1">
##	<description>
##		Send raw IP packets on the $1 interface.
##	</description>
##	<parameter name="domain">
##		The type of the process performing this action.
##	</parameter>
##	<infoflow type="write" weight="10"/>
## </interface>
#
interface(`corenet_raw_send_$1',`
	gen_require(`
		type $1_netif_t;
		class netif rawip_send;
		class capability net_raw;
	')

	allow dollarsone $1_netif_t:netif rawip_send;
	allow dollarsone self:capability net_raw;
')

########################################
## <interface name="corenet_raw_receive_$1">
##	<description>
##		Receive raw IP packets on the $1 interface.
##	</description>
##	<parameter name="domain">
##		The type of the process performing this action.
##	</parameter>
##	<infoflow type="read" weight="10"/>
## </interface>
#
interface(`corenet_raw_receive_$1',`
	gen_require(`
		type $1_netif_t;
		class netif rawip_recv;
	')

	allow dollarsone $1_netif_t:netif rawip_recv;
')

########################################
## <interface name="corenet_raw_sendrecv_$1">
##	<description>
##		Send and receive raw IP packets on the $1 interface.
##	</description>
##	<parameter name="domain">
##		The type of the process performing this action.
##	</parameter>
##	<infoflow type="both" weight="10"/>
## </interface>
#
interface(`corenet_raw_sendrecv_$1',`
	corenet_raw_send_$1(dollarsone)
	corenet_raw_receive_$1(dollarsone)
')
'') dnl end create_netif_interfaces

########################################
#
# Network node generated macros 
#
########################################

define(`create_node_interfaces',``
########################################
## <interface name="corenet_tcp_sendrecv_$1_node">
##	<description>
##		Send and receive TCP traffic on the $1 node.
##	</description>
##	<parameter name="domain">
##		The type of the process performing this action.
##	</parameter>
##	<infoflow type="both" weight="10"/>
## </interface>
#
interface(`corenet_tcp_sendrecv_$1_node',`
	gen_require(`
		type $1_node_t;
		class node { tcp_send tcp_recv };
	')

	allow dollarsone $1_node_t:node { tcp_send tcp_recv };
')

########################################
## <interface name="corenet_udp_send_$1_node">
##	<description>
##		Send UDP traffic on the $1 node.
##	</description>
##	<parameter name="domain">
##		The type of the process performing this action.
##	</parameter>
##	<infoflow type="write" weight="10"/>
## </interface>
#
interface(`corenet_udp_send_$1_node',`
	gen_require(`
		type $1_node_t;
		class node udp_send;
	')

	allow dollarsone $1_node_t:node udp_send;
')

########################################
## <interface name="corenet_udp_receive_$1_node">
##	<description>
##		Receive UDP traffic on the $1 node.
##	</description>
##	<parameter name="domain">
##		The type of the process performing this action.
##	</parameter>
##	<infoflow type="read" weight="10"/>
## </interface>
#
interface(`corenet_udp_receive_$1_node',`
	gen_require(`
		type $1_node_t;
		class node udp_recv;
	')

	allow dollarsone $1_node_t:node udp_recv;
')

########################################
## <interface name="corenet_udp_sendrecv_$1_node">
##	<description>
##		Send and receive UDP traffic on the $1 node.
##	</description>
##	<parameter name="domain">
##		The type of the process performing this action.
##	</parameter>
##	<infoflow type="both" weight="10"/>
## </interface>
#
interface(`corenet_udp_sendrecv_$1_node',`
	corenet_udp_send_$1_node(dollarsone)
	corenet_udp_receive_$1_node(dollarsone)
')

########################################
## <interface name="corenet_raw_send_$1_node">
##	<description>
##		Send raw IP packets on the $1 node.
##	</description>
##	<parameter name="domain">
##		The type of the process performing this action.
##	</parameter>
##	<infoflow type="write" weight="10"/>
## </interface>
#
interface(`corenet_raw_send_$1_node',`
	gen_require(`
		type $1_node_t;
		class node rawip_send;
	')

	allow dollarsone $1_node_t:node rawip_send;
')

########################################
## <interface name="corenet_raw_receive_$1_node">
##	<description>
##		Receive raw IP packets on the $1 node.
##	</description>
##	<parameter name="domain">
##		The type of the process performing this action.
##	</parameter>
##	<infoflow type="write" weight="10"/>
## </interface>
#
interface(`corenet_raw_receive_$1_node',`
	gen_require(`
		type $1_node_t;
		class node rawip_recv;
	')

	allow dollarsone $1_node_t:node rawip_recv;
')

########################################
## <interface name="corenet_raw_sendrecv_$1_node">
##	<description>
##		Send and receive raw IP packets on the $1 node.
##	</description>
##	<parameter name="domain">
##		The type of the process performing this action.
##	</parameter>
##	<infoflow type="both" weight="10"/>
## </interface>
#
interface(`corenet_raw_sendrecv_$1_node',`
	corenet_raw_send_$1_node(dollarsone)
	corenet_raw_receive_$1_node(dollarsone)
')

########################################
## <interface name="corenet_tcp_bind_$1_node">
##	<description>
##		Bind TCP sockets to node $1.
##	</description>
##	<parameter name="domain">
##		The type of the process performing this action.
##	</parameter>
##	<infoflow type="none"/>
## </interface>
#
interface(`corenet_tcp_bind_$1_node',`
	gen_require(`
		type $1_node_t;
		class tcp_socket node_bind;
	')

	allow dollarsone $1_node_t:tcp_socket node_bind;
')

########################################
## <interface name="corenet_udp_bind_$1_node">
##	<description>
##		Bind UDP sockets to the $1 node.
##	</description>
##	<parameter name="domain">
##		The type of the process performing this action.
##	</parameter>
##	<infoflow type="none"/>
## </interface>
#
interface(`corenet_udp_bind_$1_node',`
	gen_require(`
		type $1_node_t;
		class udp_socket node_bind;
	')

	allow dollarsone $1_node_t:udp_socket node_bind;
')
'') dnl end create_node_interfaces

########################################
#
# Network port generated macros 
#
########################################

define(`create_port_interfaces',``
########################################
## <interface name="corenet_tcp_sendrecv_$1_port">
##	<description>
##		Send and receive TCP traffic on the $1 port.
##	</description>
##	<parameter name="domain">
##		The type of the process performing this action.
##	</parameter>
##	<infoflow type="both" weight="10"/>
## </interface>
#
interface(`corenet_tcp_sendrecv_$1_port',`
	gen_require(`
		type $1_port_t;
		class tcp_socket { send_msg recv_msg };
	')

	allow dollarsone $1_port_t:tcp_socket { send_msg recv_msg };
')

########################################
## <interface name="corenet_udp_send_$1_port">
##	<description>
##		Send UDP traffic on the $1 port.
##	</description>
##	<parameter name="domain">
##		The type of the process performing this action.
##	</parameter>
##	<infoflow type="write" weight="10"/>
## </interface>
#
interface(`corenet_udp_send_$1_port',`
	gen_require(`
		type $1_port_t;
		class udp_socket send_msg;
	')

	allow dollarsone $1_port_t:udp_socket send_msg;
')

########################################
## <interface name="corenet_udp_receive_$1_port">
##	<description>
##		Receive UDP traffic on the $1 port.
##	</description>
##	<parameter name="domain">
##		The type of the process performing this action.
##	</parameter>
##	<infoflow type="read" weight="10"/>
## </interface>
#
interface(`corenet_udp_receive_$1_port',`
	gen_require(`
		type $1_port_t;
		class udp_socket recv_msg;
	')

	allow dollarsone $1_port_t:udp_socket recv_msg;
')

########################################
## <interface name="corenetwork_sendrecv_udp_on_$1_port">
##	<description>
##		Send and receive UDP traffic on the $1 port.
##	</description>
##	<parameter name="domain">
##		The type of the process performing this action.
##	</parameter>
##	<infoflow type="both" weight="10"/>
## </interface>
#
interface(`corenet_udp_sendrecv_$1_port',`
	corenet_udp_send_$1_port(dollarsone)
	corenet_udp_receive_$1_port(dollarsone)
')

########################################
## <interface name="corenet_tcp_bind_$1_port">
##	<description>
##		Bind TCP sockets to the $1 port.
##	</description>
##	<parameter name="domain">
##		The type of the process performing this action.
##	</parameter>
##	<infoflow type="none"/>
## </interface>
#
interface(`corenet_tcp_bind_$1_port',`
	gen_require(`
		type $1_port_t;
		class tcp_socket name_bind;
		$3
	')
	allow dollarsone $1_port_t:tcp_socket name_bind;
	$2
')

########################################
## <interface name="corenet_udp_bind_$1_port">
##	<description>
##		Bind UDP sockets to the $1 port.
##	</description>
##	<parameter name="domain">
##		The type of the process performing this action.
##	</parameter>
##	<infoflow type="none"/>
## </interface>
#
interface(`corenet_udp_bind_$1_port',`
	gen_require(`
		type $1_port_t;
		class udp_socket name_bind;
		$3
	')

	allow dollarsone $1_port_t:udp_socket name_bind;
	$2
')
'') dnl end create_port_interfaces

#
# network_interface(linux_interfacename,mls_sensitivity)
#
define(`network_interface',`
create_netif_interfaces($1)
')

#
# network_node(node_name,mls_sensitivity,address,netmask)
#
define(`network_node',`
create_node_interfaces($1)
')

# These next three macros have formatting, and should not me indented
define(`determine_reserved_capability',`dnl
ifelse(eval($2 < 1024),1,``allow' dollarsone self:capability net_bind_service;',`dnl
ifelse($4,`',`',`determine_reserved_capability(shiftn(3,$*))')dnl end inner ifelse
')dnl end outer ifelse
') dnl end determine reserved capability

define(`determine_reserved_capability_depend',`dnl
ifelse(eval($2 < 1024),1,`class capability net_bind_service;',`dnl
ifelse($4,`',`',`determine_reserved_capability_depend(shiftn(3,$*))')dnl end inner ifelse
')dnl end outer ifelse
') dnl end determine reserved capability depend

define(`declare_ports',`dnl
ifelse(eval($3 < 1024),1,`typeattribute $1 reserved_port_type;',`dnl')
portcon $2 $3 context_template(system_u:object_r:$1,$4)
ifelse(`$5',`',`',`declare_ports($1,shiftn(4,$*))')dnl
')

#
# network_port(port_name,protocol portnum mls_sensitivity [,protocol portnum mls_sensitivity[,...]])
#
define(`network_port',`
create_port_interfaces($1,determine_reserved_capability(shift($*)),determine_reserved_capability_depend(shift($*)))
')
