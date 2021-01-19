function inv_item_create(i_name,i_type,i_spr,i_descr,i_level,i_s_hth,i_s_str,i_s_spd,i_s_agi,i_s_end,i_s_stl,i_s_awe,i_s_rge,i_dmg_min,i_dmg_max) {
	var item_id = "uitem1",
	n = "1",
	n2;
	i_spr = sprite_get_name(i_spr);
	
	var i_power = 0,
	i_weak = 0,
	list_neg = ds_list_create(),
	list_pos = ds_list_create(),
	stats_array = array_create(10);
		
	//Setting-Up Lists for stats that can be effected
	if(i_s_hth < 0) repeat(abs(i_s_hth)) ds_list_add(list_neg,0);
	else if(i_s_hth > 0) repeat(i_s_hth) ds_list_add(list_pos,0);
	if(i_s_str < 0) repeat(abs(i_s_str)) ds_list_add(list_neg,1);
	else if(i_s_str > 0) repeat(i_s_str) ds_list_add(list_pos,1);
	if(i_s_spd < 0) repeat(abs(i_s_spd)) ds_list_add(list_neg,2);
	else if(i_s_spd > 0) repeat(i_s_spd) ds_list_add(list_pos,2);
	if(i_s_agi < 0) repeat(abs(i_s_agi))  ds_list_add(list_neg,3);
	else if(i_s_agi > 0) repeat(i_s_agi) ds_list_add(list_pos,3);
	if(i_s_end < 0) repeat(abs(i_s_end))  ds_list_add(list_neg,4);
	else if(i_s_end > 0) repeat(i_s_end) ds_list_add(list_pos,4);
	if(i_s_stl < 0) repeat(abs(i_s_stl)) ds_list_add(list_neg,5);
	else if(i_s_stl > 0) repeat(i_s_stl) ds_list_add(list_pos,5);
	if(i_s_awe < 0) repeat(abs(i_s_awe)) ds_list_add(list_neg,6);
	else if(i_s_awe > 0) repeat(i_s_awe) ds_list_add(list_pos,6);
	if(i_s_rge < 0) repeat(abs(i_s_rge)) ds_list_add(list_neg,7);
	else if(i_s_rge > 0) repeat(i_s_rge) ds_list_add(list_pos,7);
	if(i_dmg_min < 0) repeat(abs(i_dmg_min)) ds_list_add(list_neg,8);
	else if(i_dmg_min > 0) repeat(i_dmg_min) ds_list_add(list_pos,8);
	if(i_dmg_max < 0) repeat(abs(i_dmg_max)) ds_list_add(list_neg,9);
	else if(i_dmg_max > 0) repeat(i_dmg_max) ds_list_add(list_pos,9);
		
	var max_pos = ds_list_size(list_pos),
	max_neg = ds_list_size(list_neg); //
		
	switch(i_level) {
		case(1):
			i_power = irandom_range(2,6);
			//Making sure an item cannot have more power than stats to boost
			if(i_power > max_pos) i_power = max_pos;
			while((i_power - i_weak) > 3) i_weak += 1;
		break;
	}
		
	var power_add, i = 0;
	while(i_power > 0) {
		power_add = irandom(i_power);
		i = list_pos[| irandom(max_pos-1)];
		stats_array[i] += power_add;
		i_power -= power_add;
	}
	while(i_weak > 0) {
		power_add = irandom(i_weak);
		i = list_neg[| irandom(max_neg-1)];
		stats_array[i] -= power_add;
		i_weak -= power_add;
	}
	
	ini_open("item_info_u.ini");
		while(ini_section_exists(item_id)) {
			n2 = real(n);
			n2++;
			n2 = string(n2);
			item_id = string_replace(item_id,n,n2);
			n = n2;
		}
		ini_write_string(item_id,"name",i_name);
		ini_write_string(item_id,"type",i_type);
		ini_write_string(item_id,"spr",i_spr);
		ini_write_string(item_id,"descr",i_descr);
		
		if(stats_array[0] != 0)	ini_write_real(item_id,"s_hth",stats_array[0]); //Health
		if(stats_array[1] != 0)	ini_write_real(item_id,"s_str",stats_array[1]); //Stregth
		if(stats_array[2] != 0)	ini_write_real(item_id,"s_spd",stats_array[2]); //Speed
		if(stats_array[3] != 0)	ini_write_real(item_id,"s_agi",stats_array[3]); //Agility
		if(stats_array[4] != 0)	ini_write_real(item_id,"s_end",stats_array[4]); //Endurance
		if(stats_array[5] != 0)	ini_write_real(item_id,"s_stl",stats_array[5]); //Stealth
		if(stats_array[6] != 0)	ini_write_real(item_id,"s_awe",stats_array[6]); //Aweness
		if(stats_array[7] != 0)	ini_write_real(item_id,"s_rge",stats_array[7]); //Range
		if(stats_array[8] != 0)	ini_write_real(item_id,"dmg_min",stats_array[8]); //Damge Min
		if(stats_array[9] != 0)	ini_write_real(item_id,"dmg_max",stats_array[9]); //Damage Max
		ini_write_real(item_id,"equipped",0);
		var item_created = ini_section_exists(item_id);
	ini_close();
	if(item_created) {
		return item_id;	
	}
	else {
		return false;
	}


}
