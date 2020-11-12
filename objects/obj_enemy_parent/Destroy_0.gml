/// @description Killed

for(var row = 0; row < ds_grid_height(inventory)-1; row++) {
	var item_id = inventory[# 0,row]
	if(item_id != 0) {
		if(inv_item_unique(item_id)) {
			ini_open("item_info_u.ini");
				ini_key_delete(item_id,"equipped");
			ini_close();
		}
		var dropped = drop_item(inventory,row,x,y,inventory[# 1,row]);
		if(dropped) {
			ds_grid_set_region(inventory,0,row,ds_grid_width(inventory)-1,row,0);
		}
	}
}

var turn_number = ds_list_find_index(global.list_turn_order,id);
ds_list_delete(global.list_turn_order,turn_number); //Remove from Turn Order
unqueue_action(id);
global.total_actions -= action_max;
if(alarm[0] > 0) {
	obj_action_control.alarm[0] = 1;
}
show_debug_message(object_get_name(object_index) + " died");