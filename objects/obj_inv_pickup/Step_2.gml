if(device_mouse_check_button_released(0,mb_left)) {
	//Buttons
	var cam_lock = obj_display_manager.follow;
	var inv_other = cam_lock.inventory;
	var tap = device_mouse_y_to_gui(0);
	if(tap > b_y && tap < b_y + b_height) {
		tap = device_mouse_x_to_gui(0);
		//Close
		if(tap > b1_x  && tap < b1_x + b_width) {
			instance_destroy(obj_action_icon);
			cam_lock.alarm[1] = 1;
			if(ds_grid_get_sum(inventory,1,0,1,ds_grid_height(inventory)) == 0) {
				instance_destroy(bag);
			}
			else {
				with(instance_create_depth(cam_lock.x,cam_lock.y,-300,obj_action_icon)) {
					sprite_index = spr_icon_hand;
				}
			}
			instance_destroy();
		}
		//Take all
		else if(tap > b2_x && tap < b2_x + b_width) {
			for(var yy = 0; yy < ds_grid_height(inventory); yy++) {
				if(inventory[# 0,yy] != 0) {
					var added = inv_item_add(inv_other,inventory[# 0,yy],inventory[# 1,yy],inventory[# 2,yy],inventory[# 3,yy]);
					if(added)  ds_grid_set_region(inventory,0,yy,s_inventory.width,yy,0);
					else show_debug_message("Failed to add item");
				}
			}
			instance_destroy(bag)
			instance_destroy(obj_inv_action_bag);
			instance_destroy(obj_action_icon);
			cam_lock.alarm[1] = 1;
			instance_destroy();
		}
	}
}