function start_round() {
	ds_grid_resize(global.grid_turn_actions,5,0); //Clean Action quene
	for(var index = 0; index < ds_list_size(global.list_turn_order); index++) {
		with(global.list_turn_order[| index]) {
			alarm[1] = 1;
		}
	}
	with(obj_tree_top) image_alpha = 1;
	obj_action_control.alarm[0] = obj_action_control.timer_set;
}