if(device_mouse_check_button_released(0,mb_left))
{
	var tap_x = device_mouse_x(0);
	var tap_y = device_mouse_y(0);
	if(tap_x > x && tap_x < x2)
	{
		if(tap_y > y && tap_y < y2)
		{
			switch(global.current_menu)
			{
				case("online_lobby"):
					global.current_menu = "char_select";
					if(instance_exists(obj_server_control))
						{
							var buff = buffer_create(100,buffer_fixed,1);
							buffer_write(buff,buffer_string,global.current_menu);
							network_send_packet(global.socket_other,buff,buffer_tell(buff));
							buffer_delete(buff);
						}
					room_restart();
				break;
				case("char_select"):
					/*if(global.p1_playing == noone) {
						global.p1_playing = obj_selector_char_cur.selected;
						if(instance_exists(obj_server_control))
						{
							var buff = buffer_create(100,buffer_fixed,1);
							buffer_write(buff,buffer_u8,global.p1_playing);
							network_send_packet(global.socket_other,buff,buffer_tell(buff));
							buffer_delete(buff);
						}
						room_restart();
					}
					else if(global.p2_playing == noone) {
						global.p2_playing = obj_selector_char_cur.selected;
						if(instance_exists(obj_client_control))
						{
							var buff = buffer_create(100,buffer_fixed,1);
							buffer_write(buff,buffer_u8,global.p2_playing);
							network_send_packet(global.socket_other,buff,buffer_tell(buff));
							buffer_delete(buff);
						}
						global.current_menu = "offline_lobby";
						room_restart();
					}*/
				break;
			}
		}
	}
}