/// @param grid,id,sum,cap,spr

var grid = argument0,
i_id = argument1,
amount = argument2,
amount_cap = argument3,
i_spr = argument4,
across = 0;

//Stacking
if(amount_cap > 1) { //If stackable
	var remaining_room;
	for(var row = 0; row < ds_grid_height(grid); row++) { //Go through
		if(grid[# 0,row] == i_id) {
			remaining_room = (grid[# 2,row] - grid[# 1,row]);
			if(remaining_room > 0) { //Check for a match
				grid[# 1,row] += clamp(amount,0,remaining_room); //Add
				amount -= remaining_room;
				if(amount < 1) {
					return true;
				}
			}
		}
	}
}

/*if(grid[# 0,0] != 0 && ds_grid_height(grid) < 9) { //If New slot needed for bag
	ds_grid_resize(grid,ds_grid_width(grid),ds_grid_height(grid)+1);
}*/

var slot = -1;
if(ds_grid_value_exists(grid,0,0,0,ds_grid_height(grid),0)) {
	slot = ds_grid_value_y(grid,0,0,0,ds_grid_height(grid),0);
}

if(grid[# 0,slot] == 0) { //If room in inventory
	grid[# across++,slot] = i_id;
	grid[# across++,slot] = amount;
	grid[# across++,slot] = amount_cap;
	grid[# across++,slot] = i_spr;
	show_debug_message("Added " + string(i_id) + " to " + object_get_name(object_index) + "'s Inventory");
	return true;
}
else { //Inventory Full
	show_debug_message("Failed to add" + i_id);
	return false;
}