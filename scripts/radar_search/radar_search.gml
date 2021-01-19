///
function radar_search(grid,friendly,enemy) {
	var	across, ddown, tile_setup;

	for(ddown = 0; ddown < ds_grid_height(grid); ddown++) {
		for(across = 0; across < ds_grid_width(grid); across++) {
			tile_setup = tilemap_get_at_pixel(collision_map,x+((across-4)*64),y+((ddown-4)*64));
			if(((across == 4) && (ddown == 3 || ddown == 5)) || ((ddown == 4) && (across == 3 || across == 5))) {
				if(tile_setup == 0 && tilemap_get_at_pixel(global.tilemap_collision0,x,y) == 4) {
					tile_setup = tilemap_get_at_pixel(global.tilemap_collision0,x+((across-4)*64),y+((ddown-4)*64));
				}
			}
			//Friendly
			if(position_meeting(x+((across-4)*64),y+((ddown-4)*64),friendly)) {
				tile_setup = 2;
			}
			//Enemy
			else if(position_meeting(x+((across-4)*64),y+((ddown-4)*64),enemy)) {
				tile_setup = 3;
			}
			//Set Tile
			ds_grid_set(grid,across,ddown,tile_setup);
		}
	}
	if(ds_grid_get(search_map,floor(x/64),floor(y/64)) != 0) {
		ds_grid_set(grid,4,4,5);;
	}
}