/// @description Pressed
if(tapped(x,width,y,height)) {
	global.grid_players[# 0,0] = obj_robin_hood;
	global.grid_players[# 0,1] = obj_john;
	global.grid_players[# 0,2] = obj_marian;
	global.grid_players[# 1,0] = "p";
	global.grid_players[# 1,1] = "ai";
	global.grid_players[# 1,2] = "ai";
	global.current_menu = "";
	randomize();
	var seed = random_get_seed(),
	goto_room, world_number = "test",//irandom(0),
	list_chunks_large = ds_list_create(),
	list_chunks_medium = ds_list_create(),
	list_chunks_small = ds_list_create();
	for(var index = 0; index < 10; index++) {
		list_chunks_large[| index] = irandom(2);
	}
	for(index = 0; index < 10; index++) {
		list_chunks_medium[| index] = irandom(2);
	}
	for(index = 0; index < 10; index++) {
		list_chunks_small[| index] = irandom(4);
	}
	goto_room = gen_world(world_number,list_chunks_large,list_chunks_medium,list_chunks_small);
	if(instance_exists(obj_server_control)) {
		if(obj_server_control.connected_player != -1) {
			global.control_p2 = false;
			var buff = buffer_create(100,buffer_fixed,1);
			buffer_write(buff,buffer_u16,goto_room);
			buffer_write(buff,buffer_u32,seed);
			buffer_write(buff,buffer_u32,world_number);
			for(index = 0; index < 10; index++) {
				buffer_write(buff,buffer_u8,list_chunks_large[| index++]);
			}
			for(index = 0; index < 10; index++) {
				buffer_write(buff,buffer_u8,list_chunks_medium[| index++]);
			}
			for(index = 0; index < 10; index++) {
				buffer_write(buff,buffer_u8,list_chunks_small[| index++]);
			}
			network_send_packet(global.socket_other,buff,buffer_tell(buff));
			buffer_delete(buff);
		}
		else {
			global.control_p2 = true;
		}
	}
	else {
		global.control_p1 = true;
		global.control_p2 = true;
		global.socket_other = noone;
	}
	ini_open("item_info_u.ini");
		var item_id = "uitem1",
		n = "1",
		n2;
		while(ini_section_exists(item_id)) {
			ini_section_delete(item_id);
			n2 = real(n);
			n2++;
			n2 = string(n2);
			item_id = string_replace(item_id,n,n2);
			n = n2;
		}
	ini_close();
	/*ini_open("item_info.ini");
		var item_id = "item1",
		n = "1",
		n2;
		while(ini_section_exists(item_id)) {
			ini_write(item_id);
			n2 = real(n);
			n2++;
			n2 = string(n2);
			item_id = string_replace(item_id,n,n2);
			n = n2;
		}
	ini_close();*/
	room_goto(goto_room);
}