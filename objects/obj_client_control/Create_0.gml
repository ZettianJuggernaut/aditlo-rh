port = 7657;
socket = network_create_socket_ext(network_socket_udp,port);
connected = false
name_server = "none";
global.control_p1 = false;
global.control_p2 = true;

list_connect_ips = ds_list_create();
list_servers = ds_list_create();