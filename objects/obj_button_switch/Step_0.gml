/// @description Tap
if(device_mouse_check_button_released(0,mb_left)) {
	var tap = device_mouse_y_to_gui(0);
	if(tap > y && tap < y + sprite_height) {
		tap = device_mouse_x_to_gui(0);
		if(tap > x && tap < x + sprite_width) {
			switch_character("p1");
		}
		else if(tap > x2 && tap < x2 + sprite_width) {
			switch_character("p2");
		}
	}
}