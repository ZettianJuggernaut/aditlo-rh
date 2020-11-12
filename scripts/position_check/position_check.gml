function position_check() {
	var xx = x - 32,
	yy = y - 32;
	if(xx/64 != round(xx/64))
	{
		x = round(xx/64)*64 + 32;
	}
	if(yy/64 != round(yy/64))
	{
		y = round(yy/64)*64 + 32;
	}

	//Drop down if flooting
	if(tilemap_get_at_pixel(collision_map,x,y) == 0)
	{
		depth += 100;
	}

	switch(depth)
	{
		case(-150):
			collision_map = global.tilemap_collision1;
			search_map = global.grid_tiling_layer1_search;
		break;
		default:
			collision_map = global.tilemap_collision0;
			search_map = global.grid_tiling_layer0_search;
	}


}
