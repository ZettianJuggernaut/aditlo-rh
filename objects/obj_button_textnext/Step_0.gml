/// @description Insert description here
if(device_mouse_check_button_released(0,mb_left)) {
	if(position_meeting(device_mouse_x(0),device_mouse_y(0),object_index)) {
		with(creator) {
			event_user(1);
		}
	}
}