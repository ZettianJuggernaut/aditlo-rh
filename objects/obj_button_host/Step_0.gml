if(device_mouse_check_button_released(0,mb_left))
{
	var tap_x = device_mouse_x(0);
	var tap_y = device_mouse_y(0);
	if(tap_x > x && tap_x < x2)
	{
		if(tap_y > y && tap_y < y2)
		{
			global.current_menu = "online_lobby";
			global.control_p1 = true;
			instance_create_depth(0,0,0,obj_server_control);
			room_restart();
		}
	}
}