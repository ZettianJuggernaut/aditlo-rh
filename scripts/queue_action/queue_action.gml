/// @param priority,id,action,x,y
function queue_action(argument0, argument1, argument2, argument3, argument4) {

	var grid = global.grid_turn_actions;
	var actions_queued = 0;
	for(var ddown = 0; ddown < ds_grid_height(grid)-1; ddown++) {
		if(grid[# 1,ddown] = argument1) actions_queued++;
	}

	if(actions_queued < argument1.action_max) {
		var row = ds_grid_height(grid)-1;
		if(grid[# 1,row] != 0) {
			row++
			ds_grid_resize(grid,ds_grid_width(grid),row+1);
		}

		grid[# 0,row] = argument0; //Priority
		grid[# 1,row] = argument1; //Instance ID
		grid[# 2,row] = argument2; //Action ID
		grid[# 3,row] = argument3; //X position of action
		grid[# 4,row] = argument4; //Y position of action
		if(ds_grid_height(grid) == global.total_actions) {
			obj_action_control.alarm[0] = 10;
		}
		return true;
	}
	else return false;


}