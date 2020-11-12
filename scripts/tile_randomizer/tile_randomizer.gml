/// @param gird,x1,y1,x2,y2,tile_type,range1,range2
function tile_randomizer(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {

	var grid = argument0,
	across = argument1,
	ddown = argument2,
	across_max = argument3,
	ddown_max = argument4,
	tile_type = argument5, //Tile to Randomize
	range1 = argument6, //Range Base
	range2 = argument7; //Range Max

	for(var ddown = argument1; ddown < argument4; ddown++) {
		for(var across = argument0; across < argument3; across++) {
			if(ds_grid_get(grid,across,ddown) == tile_type)
			{
				ds_grid_set(grid,across,ddown,irandom_range(range1,range2));
			}
		}
	}


}
