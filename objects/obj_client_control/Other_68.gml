<<<<<<< HEAD
type = async_load[? "type"];
switch(type)
{
	case(network_type_data):
		switch(global.current_menu)
		{
			case("offline_lobby"):
				if(connected)
				{
					var buff = async_load[? "buffer"],
					goto_room = buffer_read(buff,buffer_u16),
					seed = buffer_read(buff,buffer_u32),
					arg0 = buffer_read(buff,buffer_u32),
					arg1 = ds_list_create(),
					arg2 = ds_list_create(),
					arg3 = ds_list_create(),
					index = 0;
					repeat(10)
					{
						arg1[| index++] = buffer_read(buff,buffer_u8);
					}
					index = 0;
					repeat(10)
					{
						arg2[| index++] = buffer_read(buff,buffer_u8);
					}
					index = 0;
					repeat(10)
					{
						arg3[| index++] = buffer_read(buff,buffer_u8);
					}
					random_set_seed(seed);
					gen_world(arg0,arg1,arg2,arg3);
					room_goto(goto_room);
				}
			break;
			case("online_lobby"):
				if(connected == false)
				{
					var new_ip = async_load[? "ip"];
					if(ds_list_find_index(list_connect_ips,new_ip) == -1)
					{
						ds_list_add(list_connect_ips,new_ip);
						var buff = async_load[? "buffer"];
						var new_server = buffer_read(buff,buffer_string);
						ds_list_add(list_servers,new_server);
						instance_create_depth(0,0,0,obj_lobby_select);
					}
				}
				else
				{
					var buff = async_load[? "buffer"];
					global.current_menu = "char_select";
					room_restart();
				}
			break;
			case("char_select"):
				var buff = async_load[? "buffer"];
				global.p1_playing = buffer_read(buff,buffer_u8);
				room_restart();
			break;
			case(""):
				var buff = async_load[? "buffer"];
				script_execute(data_rev,buff);
			break;
		}
	break;
=======
type = async_load[? "type"];
switch(type)
{
	case(network_type_data):
		switch(global.current_menu)
		{
			case("offline_lobby"):
				if(connected)
				{
					var buff = async_load[? "buffer"],
					goto_room = buffer_read(buff,buffer_u16),
					seed = buffer_read(buff,buffer_u32),
					arg0 = buffer_read(buff,buffer_u32),
					arg1 = ds_list_create(),
					arg2 = ds_list_create(),
					arg3 = ds_list_create(),
					index = 0;
					repeat(10)
					{
						arg1[| index++] = buffer_read(buff,buffer_u8);
					}
					index = 0;
					repeat(10)
					{
						arg2[| index++] = buffer_read(buff,buffer_u8);
					}
					index = 0;
					repeat(10)
					{
						arg3[| index++] = buffer_read(buff,buffer_u8);
					}
					random_set_seed(seed);
					gen_world(arg0,arg1,arg2,arg3);
					room_goto(goto_room);
				}
			break;
			case("online_lobby"):
				if(connected == false)
				{
					var new_ip = async_load[? "ip"];
					if(ds_list_find_index(list_connect_ips,new_ip) == -1)
					{
						ds_list_add(list_connect_ips,new_ip);
						var buff = async_load[? "buffer"];
						var new_server = buffer_read(buff,buffer_string);
						ds_list_add(list_servers,new_server);
						instance_create_depth(0,0,0,obj_lobby_select);
					}
				}
				else
				{
					var buff = async_load[? "buffer"];
					global.current_menu = "char_select";
					room_restart();
				}
			break;
			case("char_select"):
				var buff = async_load[? "buffer"];
				global.p1_playing = buffer_read(buff,buffer_u8);
				room_restart();
			break;
			case(""):
				var buff = async_load[? "buffer"];
				script_execute(data_rev,buff);
			break;
		}
	break;
>>>>>>> master
}