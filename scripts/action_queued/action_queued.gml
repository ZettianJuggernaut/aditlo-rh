/// @param id
function action_queued(argument0) {
	if(ds_grid_value_exists(global.grid_turn_actions,1,0,1,ds_grid_height(global.grid_turn_actions)-1,argument0)) 
		return true;
	else return false;
}
