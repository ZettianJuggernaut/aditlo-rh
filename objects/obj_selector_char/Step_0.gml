if(device_mouse_check_button_released(0,mb_left))
{
	var tap_x = device_mouse_x(0);
	if(tap_x > x && tap_x < x + width)
	{
		var tap_y = device_mouse_y(0);
		if(tap_y > y && tap_y < y + height)
		{
			if(image_blend != c_black)
			{
				var selected_character = sprite_index;
				with(obj_selector_char_cur)
				{
					sprite_index = selected_character;
					switch(selected_character)
					{
						case(spr_robin_hood):
							selected = obj_robin_hood;
						break;
						case(spr_john):
							selected = obj_john;
						break;
						case(spr_tuck):
							selected = obj_tuck;
						break;
					}
				}
			}
		}
	}
}