/// @param id

var grid = global.grid_turn_actions;
var grid_h = ds_grid_height(grid), grid_w = ds_grid_width(grid);
var row = -1;
for(var ddown = 0; ddown < grid_h-1; ddown++) {
	if(grid[# 1,ddown] = argument0) break;// row = ddown;
}
for(row = ddown; row < grid_h-1; row++) {
	ds_grid_set_grid_region(grid,grid,0,row+1,grid_w,row+1,0,row);
}
ds_grid_resize(grid,grid_w,grid_h-1);