ds_grid_clear(global.grid_turn_actions,0);
ds_grid_resize(global.grid_turn_actions,5,1);
var alarm_legth = 1;
for(var index = 0; index < ds_list_size(global.list_turn_order); index++) {
	with(global.list_turn_order[| index]) {
		if(alarm_legth < alarm[0]) alarm_legth = alarm[0]+1;
	}
}
for(var index = 0; index < ds_list_size(global.list_turn_order); index++) {
	with(global.list_turn_order[| index]) {
		alarm[1] = alarm_legth;
	}
}