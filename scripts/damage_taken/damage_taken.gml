/// 
function damage_taken(wounded,hit,dmg) {
	if(hit > -4 && hit < 4) {
		with(instance_create_depth(wounded.x + wounded.sprite_width/2,wounded.y,-500,obj_text_dmg)) {
			text_dmg = "Miss";
		}
		show_debug_message("Miss");
		dmg = 0;
	}
	if(dmg > 0) {
		wounded.s_health -= dmg;
		with(instance_create_depth(wounded.x + wounded.sprite_width/2,wounded.y,-500,obj_text_dmg)) {
			text_dmg = -dmg;
			show_debug_message(string(text_dmg));
		}
		if(wounded.s_health  <= 0) {
			instance_destroy(wounded);
		}
	}
}
