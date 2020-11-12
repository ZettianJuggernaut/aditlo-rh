if(inv_item_unique(i_id)) var ini_file = "item_info_u.ini";
else var ini_file = "item_info.ini";
ini_open(ini_file);
	text_name = ini_read_string(i_id,"name","");
	text_desc = ini_read_string(i_id,"descr","");
	var item_s_str = ini_read_real(i_id,"s_str",0),
	item_s_spd = ini_read_real(i_id,"s_spd",0),
	item_s_agi = ini_read_real(i_id,"s_agi",0),
	item_s_end = ini_read_real(i_id,"s_end",0),
	item_s_stl = ini_read_real(i_id,"s_stl",0),
	item_s_awe = ini_read_real(i_id,"s_awe",0),
	item_s_rge = ini_read_real(i_id,"s_rge",0),
	item_s_dmg_min = ini_read_real(i_id,"dmg_min",0),
	item_s_dmg_max = ini_read_real(i_id,"dmg_max",0);
ini_close();

if(item_s_str > 0) text_stat += "Str +" + string(item_s_str) + "\n";
else if(item_s_str < 0) text_stat += "Str " + string(item_s_str) + "\n";
if(item_s_spd > 0) text_stat += "Spd +" + string(item_s_spd) + "\n";
else if(item_s_spd < 0) text_stat += "Spd " + string(item_s_spd) + "\n";
if(item_s_agi > 0) text_stat += "Agi +" + string(item_s_agi) + "\n";
else if(item_s_agi < 0) text_stat += "Agi " + string(item_s_agi) + "\n";
if(item_s_end > 0) text_stat += "End +" + string(item_s_end) + "\n";
else if(item_s_end < 0) text_stat += "End " + string(item_s_end) + "\n";
if(item_s_stl > 0) text_stat += "Stl +" + string(item_s_stl) + "\n";
else if(item_s_stl < 0) text_stat += "Stl " + string(item_s_stl) + "\n";
if(item_s_awe > 0) text_stat += "Awe +" + string(item_s_awe) + "\n";
else if(item_s_awe < 0) text_stat += "Awe " + string(item_s_awe) + "\n";
if(item_s_awe > 0) text_stat += "Rng +" + string(item_s_rge) + "\n";
else if(item_s_awe < 0) text_stat += "Rng " + string(item_s_rge) + "\n";
if(item_s_dmg_min > 0) text_stat += "Dmg Min +" + string(item_s_dmg_min) + "\n";
else if(item_s_dmg_min < 0) text_stat += "Dmg Min " + string(item_s_dmg_min) + "\n";
if(item_s_dmg_max > 0) text_stat += "Dmg Max +" + string(item_s_dmg_max) + "\n";
else if(item_s_dmg_max < 0) text_stat += "Dmg Max " + string(item_s_dmg_max) + "\n";