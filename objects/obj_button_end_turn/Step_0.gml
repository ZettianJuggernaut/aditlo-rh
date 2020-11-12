/// @description Tap
if(device_mouse_check_button_released(0,mb_left)) {
	var tap = device_mouse_y_to_gui(0);
	if(tap > y && tap < y + sprite_height) {
		tap = device_mouse_x_to_gui(0);
		if(tap > x && tap < x + sprite_width) {
			var cam_lock = obj_display_manager.follow;
			with(cam_lock) {
				instance_destroy(obj_action_icon);
				queue_action(20,id,0,x,y);
			}
			text = "Skip Turn";
		}
	}
}