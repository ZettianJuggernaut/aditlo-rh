function item_consume(item_id,character,row){
	var used = false;
ini_open("item_info.ini");
	var item_effect = ini_read_string(item_id,"effect",noone),
	item_effectness = ini_read_real(item_id,"effectness",0);
ini_close();
switch(item_effect) {
	case("Heal"):
		var max_effect = clamp(item_effectness,0,character.s_health_max-character.s_health);
		with(character) {
			s_health += max_effect;
			if(max_effect > 0) {
				used = true;
				with(instance_create_depth(x + sprite_width/2,y,-500,obj_text_dmg)) {
					text_dmg = max_effect;
					show_debug_message(string(max_effect));
				}
			}
		}
	break;
	case("Poison"):
		var max_effect = -item_effectness;
		with(character) {
			s_health -= max_effect;
			used = true;
			with(instance_create_depth(x + sprite_width/2,y,-500,obj_text_dmg)) {
				text_dmg = max_effect;
				show_debug_message(string(max_effect));
			}
		}
	break;
}
if(used) {
	with(character) {
		if(inventory[# s_inventory.slot_sum,row] > 1) {
			inventory[# s_inventory.slot_sum,row] -= 1;
		}
		else {
			ds_grid_set_region(inventory,0,row,s_inventory.width,row,0);
		}
	}
}
}