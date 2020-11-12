/// @description Tap
if(device_mouse_check_button_released(0,mb_left)) {
	if(instance_position(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),object_index)) {
		instance_destroy(obj_inv_slot);
		with(obj_inventory_manger) {
			if(inv_visible == false) {
				instance_destroy(obj_action_icon);
				inv_visible = true;
				event_user(0);
			}
			else {
				inv_visible = false;
				obj_character_parent.alarm[1] = 1;
				event_user(0);
			}
		}
	}
}