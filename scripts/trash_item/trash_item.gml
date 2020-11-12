/// @param grid,row
function trash_item(argument0, argument1) {

	var grid = argument0,
	row_remove = argument1,
	row_current = row_remove + 1;

	if(ds_grid_height(grid) == 1) { //Only 1 item
		if(grid[# 1,0] < 1) {
			ds_grid_set_region(grid,0,0,ds_grid_width(grid),0,0);
		} 
	}
	else {
		for(i = row_remove; i < ds_grid_height(grid); ++i) {
			ds_grid_set_grid_region(grid,grid,0,row_current,s_inventory.width,row_current++,0,i);
		}
		ds_grid_resize(grid,ds_grid_width(grid),ds_grid_height(grid)-1);
	}


}
