if(device_mouse_check_button_released(0,mb_left)) {
	//var action_id = instance_position(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),object_index);
	if(position_meeting(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),id)) {
		switch(sprite_index) {
			case(spr_inv_action_pickup):
				var added = inv_item_add(inv_to,inv_from[# 0,slot_y],1,inv_from[# 2,slot_y],inv_from[# 3,slot_y]);
				if(added) inv_from[# 1,slot_y] -= 1;
				if(inv_from[# 1,slot_y] < 1) ds_grid_set_region(inv_from,0,slot_y,s_inventory.width,slot_y,0);
			break;
			case(spr_inv_action_pickup_all):
				var added = inv_item_add(inv_to,inv_from[# 0,slot_y],inv_from[# 1,slot_y],inv_from[# 2,slot_y],inv_from[# 3,slot_y]);
				if(added) ds_grid_set_region(inv_from,0,slot_y,s_inventory.width,slot_y,0);
			break;
		}
		if(ds_grid_get_sum(inv_from,1,0,1,ds_grid_height(inv_from)) == 0) {
			instance_destroy(obj_inv_pickup);
			instance_destroy(bag);
		}
		else obj_inv_pickup.used = true;
		instance_destroy(object_index);
		obj_button_end_turn.text = "End Turn";
	}
}