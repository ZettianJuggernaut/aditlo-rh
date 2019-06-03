port = 7657;
server = network_create_server(network_socket_tcp,port,2);
global.socket_self = network_create_socket(network_socket_tcp);
global.socket_other = noone;
network_connect(global.socket_self,"127.0.0.1",port);

connected_player = -1;

//Wait 10 Seconds
global.server_name = "Test " + string(server);
buff_broadcast = buffer_create(100,buffer_fixed,1);
alarm_set(0,600);