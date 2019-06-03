/// @param wounded,hit,dmg

var wounded = argument0,
dmg = argument2;
if(argument1 > -1 && argument1 < 4) {
	with(instance_create_depth(wounded.x + wounded.sprite_width/2,wounded.y,-500,obj_text_dmg)) {
		text_dmg = "Miss";
	}
	dmg = 0;
}
if(dmg > 0) {
	wounded.s_health -= dmg;
	with(instance_create_depth(wounded.x + wounded.sprite_width/2,wounded.y,-500,obj_text_dmg)) {
		text_dmg = dmg;
	}
	if(wounded.s_health  <= 0) {
		//tilemap_set_at_pixel(wounded.collision_map,1,wounded.x,wounded.y);
		instance_destroy(wounded);
	}
}