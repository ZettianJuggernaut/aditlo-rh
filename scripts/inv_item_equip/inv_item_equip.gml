/// @param item_id
function inv_item_equip(argument0) {
	var item_id = argument0;
	if(inv_item_unique(item_id)) {
		ini_open("item_info_u.ini");
			if(!ini_read_real(item_id,"equipped",0)) {
				s_dmg_min += ini_read_real(item_id,"dmg_min",0);
				s_dmg_max += ini_read_real(item_id,"dmg_max",0);
				s_strength += ini_read_real(item_id,"s_str",0);
				s_speed += ini_read_real(item_id,"s_spd",0);
				s_agility += ini_read_real(item_id,"s_agi",0);
				s_endurance += ini_read_real(item_id,"s_end",0);
				s_stealth += ini_read_real(item_id,"s_stl",0);
				s_aware += ini_read_real(item_id,"s_awe",0);
				s_range += ini_read_real(item_id,"s_rge",0);
				ini_write_real(item_id,"equipped",1);
				show_debug_message("Equipping " + string(item_id) + " statistically.");
			}
		ini_close();
	}


}
