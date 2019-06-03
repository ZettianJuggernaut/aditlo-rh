///@param name,type,spr,descr,hth,str,spd,agi,end,stl,awe,dmg_min,dmg_max
var item_id = "uitem1",
n = "1",
n2;
var i_name = argument0;
var i_type = argument1;
var i_spr = sprite_get_name(argument2);
var i_descr = argument3;
var i_s_hth = argument4;
var i_s_str = argument5;
var i_s_spd = argument6;
var i_s_agi = argument7;
var i_s_end = argument8;
var i_s_stl = argument9;
var i_s_awe = argument10;
var i_dmg_min = argument11;
var i_dmg_max = argument12;
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
	if(i_s_hth != 0)	ini_write_real(item_id,"s_hth",i_s_hth);
	if(i_s_str != 0)	ini_write_real(item_id,"s_str",i_s_str);
	if(i_s_spd != 0)	ini_write_real(item_id,"s_spd",i_s_spd);
	if(i_s_agi != 0)	ini_write_real(item_id,"s_agi",i_s_agi);
	if(i_s_end != 0)	ini_write_real(item_id,"s_end",i_s_end);
	if(i_s_stl != 0)	ini_write_real(item_id,"s_stl",i_s_stl);
	if(i_s_awe != 0)	ini_write_real(item_id,"s_awe",i_s_awe);
	if(i_dmg_min != 0)	ini_write_real(item_id,"dmg_min",i_dmg_min);
	if(i_dmg_max != 0)	ini_write_real(item_id,"dmg_max",i_dmg_max);
	ini_write_real(item_id,"equipped",0);
	var item_created = ini_section_exists(item_id);
ini_close();
if(item_created) {
	return item_id;	
}
else {
	return false;
}