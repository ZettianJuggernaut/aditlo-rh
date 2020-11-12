/// @description
/*if(id == global.list_turn_order[| 0]) {
	instance_destroy(obj_action_icon);
	show_debug_message(object_get_name(object_index));
	show_debug_message("Id " + string(id));
	show_debug_message("Position " + string(x) + "x" + string(y));
	//show_debug_message("Path to = " + string(radar_x) + "x" + string(radar_y));
	alarm[0] = 1;
}