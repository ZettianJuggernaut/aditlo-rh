type = async_load[? "type"];
switch(type)
{
	case(network_type_connect):
		if(global.current_menu == "online_lobby")
		{
			if(async_load[? "ip"] != "127.0.0.1")
			{
				connected_player = async_load[? "socket"];
				global.socket_other = async_load[? "socket"];
				global.control_p2 = false;
				alarm[0] = -1;
			}
		}
	break;
	case(network_type_data):
		switch(global.current_menu)
		{
			case("char_select"):
				var buff = async_load[? "buffer"];
				global.p2_playing = buffer_read(buff,buffer_u8);
				global.current_menu = "offline_lobby";
				room_restart();
			break;
			case(""):
				var buff = async_load[? "buffer"];
				script_execute(data_rev,buff);
			break;
		}
	break;
	case(network_type_disconnect):
		global.socket_other = noone;
		global.control_p2 = true;
	break;
}