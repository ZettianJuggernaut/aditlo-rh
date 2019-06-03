if(device_mouse_check_button_released(0,mb_left))
{
	var tap = device_mouse_x(0);
	if(tap > x && tap < x2)
	{
		tap = device_mouse_y(0);
		if(tap > y && tap < y2)
		{
			global.current_menu = "online_lobby";
			global.control_p1 = false;
			global.control_p2 = true;
			instance_create_depth(x,y+100,0,obj_client_control);
			room_restart();
		}
	}
}