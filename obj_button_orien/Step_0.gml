if(device_mouse_check_button_released(0,mb_left))
{
	var tap_x = device_mouse_x(0);
	if(tap_x > x && tap_x < x2)
	{
		var tap_y = device_mouse_y(0);
		if(tap_y > y && tap_y < y2)
		{
			switch(global.orien)
			{
				case 0:
				global.orien = 1;
				break;
				case 1:
				global.orien = 0;
				break;
			}
			script_execute(resize_view);
		}
	}
}