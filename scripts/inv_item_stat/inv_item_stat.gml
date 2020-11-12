function inv_item_stat(i_level,min_power,max_power,i_hth,i_str,i_spd,i_agi,i_end,i_stl,i_awe,i_rge,i_dmg_min,i_dmg_max){
	var i_power = irandom_range(min_power,max_power),
	i_weak = 0,
	list_neg = ds_list_create(),
	list_pos = ds_list_create(),
	stats_array = array_create(10);
	switch(i_level) {
		case(1):
			while((i_power - i_weak) > 3) i_weak += 1;//random(1);
		break;
	}
	if(i_hth == 1) ds_list_add(list_neg,0);
	else if(i_hth == 2) ds_list_add(list_pos,0);
	if(i_str == 1) ds_list_add(list_neg,1);
	else if(i_str == 2) ds_list_add(list_pos,1);
	if(i_spd == 1) ds_list_add(list_neg,2);
	else if(i_spd == 2) ds_list_add(list_pos,2);
	if(i_agi == 1) ds_list_add(list_neg,3);
	else if(i_agi == 2) ds_list_add(list_pos,3);
	if(i_end == 1) ds_list_add(list_neg,4);
	else if(i_end == 2) ds_list_add(list_pos,4);
	if(i_stl == 1) ds_list_add(list_neg,5);
	else if(i_stl == 2) ds_list_add(list_pos,5);
	if(i_awe == 1) ds_list_add(list_neg,6);
	else if(i_awe == 2) ds_list_add(list_pos,6);
	if(i_rge == 1) ds_list_add(list_neg,7);
	else if(i_rge == 2) ds_list_add(list_pos,7);
	if(i_dmg_min == 1) ds_list_add(list_neg,8);
	else if(i_dmg_min == 2) ds_list_add(list_pos,8);
	if(i_dmg_max == 1) ds_list_add(list_neg,9);
	else if(i_dmg_max == 2) ds_list_add(list_pos,9);
	
	var power_add;
	while(i_power > 0) {
		power_add = irandom(i_power)
		stats_array[list_pos[| irandom(ds_list_size(list_pos))]] = power_add;
		i_power -= power_add;
	}
	while(i_weak > 0) {
		power_add = irandom(i_weak)
		stats_array[list_neg[| irandom(ds_list_size(list_neg))]] = power_add;
		i_weak -= power_add;
	}
	return stats_array;
}