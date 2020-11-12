/// @param item_id
function inv_item_unequip(argument0) {

	var item_id = argument0;
	ini_open("item_info_u.ini");
		s_dmg_min += (ini_read_real(item_id,"dmg_min",0)*-1);
		s_dmg_max += (ini_read_real(item_id,"dmg_max",0)*-1);
		s_strength += (ini_read_real(item_id,"s_str",0)*-1);
		s_speed += (ini_read_real(item_id,"s_spd",0)*-1);
		s_agility += (ini_read_real(item_id,"s_agi",0)*-1);
		s_endurance += (ini_read_real(item_id,"s_end",0)*-1);
		s_stealth += (ini_read_real(item_id,"s_stl",0)*-1);
		s_aware += (ini_read_real(item_id,"s_awe",0)*-1);
		ini_key_delete(item_id,"equipped");
	ini_close();


}
