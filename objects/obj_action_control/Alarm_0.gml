/// @description Round Timer/Execute Actions
if(action_row < 0) {
	ds_grid_sort(global.grid_turn_actions,0,0); //Sort in Priority Order
	if(instance_exists(obj_action_icon)) instance_destroy(obj_action_icon);
}
if(++action_row < ds_grid_height(global.grid_turn_actions)) execute_action(action_row);
else {
	action_row = -1;
	start_round();
}