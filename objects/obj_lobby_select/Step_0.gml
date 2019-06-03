if(script_execute(tapped,x - width/2,width,y,height))
{
	var IP = ip_address;
	var name = name_server;
	with(obj_client_control)
	{
		network_destroy(socket);
		global.socket_other = network_create_socket(network_socket_tcp);
		network_connect(global.socket_other,IP,port);
		ds_list_destroy(list_servers);
		ds_list_destroy(list_connect_ips);
		connected = true;
		name_server = name;
	}
	instance_destroy(obj_lobby_select);
}