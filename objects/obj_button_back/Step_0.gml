if(tapped(x,sprite_width,y,sprite_height))
{
	switch(global.current_menu) {
		case("online_lobby"):
			global.current_menu = "online_setup";
			if(instance_exists(obj_server_control))
			{
				instance_destroy(obj_server_control);
			}
		break;
		default:
			global.current_menu = "start";
	}
	room_restart();
}