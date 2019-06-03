/// @param grid,friendly,enemy

var	grid = argument0,
friendly = argument1,
enemy = argument2,
across, ddown, tile_setup, enemy_id;

for(ddown = 0; ddown < (ds_grid_height(grid)); ddown++) {
	for(across = 0; across < (ds_grid_width(grid)); across++) {
		enemy_id = instance_position(x+((across-4)*64),y+((ddown-4)*64),enemy);
		tile_setup = tilemap_get_at_pixel(collision_map,x+((across-4)*64),y+((ddown-4)*64));
		//Friendly
		if(position_meeting(x+((across-4)*64),y+((ddown-4)*64),friendly)) {
			tile_setup = 2;
		}
		//Enemy
		else if(enemy_id != noone) {
			if(enemy_id.depth == depth) {
				tile_setup = 3;
			}
		}
		//Current Tile
		if(across == 4 && ddown == 4) {
			//Searchables
			if(ds_grid_get(search_map,(floor(x/64)+(across-4)),(floor(y/64)+(ddown-4))) != 0) {
				tile_setup = 5;
			}
			//Pick Upables
			if(position_meeting(x,y,obj_drop_bag)) {
				if(tile_setup == 5) {
					tile_setup = 7;
				}
				else {
					tile_setup = 6;
				}
			}
		}
		if(tilemap_get_at_pixel(global.tilemap_layer0_collision,x,y) == 4) {
			//Tile Above
			if(across == 4 && ddown == 3) {
				tile_setup = 1;
			}
			//Tile Right
			if(across == 4 && ddown == 5) {
				tile_setup = 1;
			}
			//Tile Below
			if(across == 5 && ddown == 4) {
				tile_setup = 1;
			}
			//Tile Left
			if(across == 5 && ddown == 4) {
				tile_setup = 1;
			}
		}
	
		//Set Tile
		ds_grid_set(grid,across,ddown,tile_setup);
	}
}