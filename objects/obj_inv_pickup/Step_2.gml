if(device_mouse_check_button_released(0,mb_left)) {
	//Buttons
	var cam_lock = obj_display_manager.follow;
	var inv_other = cam_lock.inventory;
	var tap = device_mouse_y_to_gui(0);
	if(tap > b_y && tap < b_y + b_height) {
		tap = device_mouse_x_to_gui(0);
		//Close
		if(tap > b1_x  && tap < b1_x + b_width) {
			if(!used) cam_lock.alarm[1] = 1;
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
			obj_button_end_turn.text = "End Turn";
			instance_destroy();
		}
	}
	
	//Interact with Inventory Slots
	var x1 = inv_x, x2 = x1 + 65, x3 = x2 + 65,
	y1 = inv_y, y2 = y1 + 65, y3 = y2 + 65,
	width1 = sprite_get_width(spr_inventroy_slot),
	height1 = sprite_get_height(spr_inventroy_slot),
	inv_position = -1, tapped_on_x = 0, tapped_on_y = 0, item_id = 0;
	
	#region Tapped y
	tap = device_mouse_y_to_gui(0);
	if(tap > y1 - height1/2 && tap < y1 + height1/2) {
		tapped_on_y = y1;
		inv_position = 0;
	}
	else if(tap > y2 - height1/2 && tap < y2 + height1/2) {
		tapped_on_y = y2;
		inv_position = 3;
	}
	else if(tap > y3 - height1/2 && tap < y3 + height1/2) {
		tapped_on_y = y3;
		inv_position = 6;
	}
	else {
		tapped_on_y = 0;
	}
	#endregion
	
	#region Tapped x
	if(tapped_on_y > 0)
	{
		tap = device_mouse_x_to_gui(0);
		if(tap > x1 - width1/2 && tap < x1 + width1/2) {
			tapped_on_x = x1;
		}
		else if(tap > x2 - width1/2 && tap < x2 + width1/2) {
			tapped_on_x = x2;
			inv_position += 1;
		}
		else if(tap > x3 - width1/2 && tap < x3 + width1/2) {
			tapped_on_x = x3;
			inv_position += 2;
		}
		else {
			tapped_on_x = 0;
		}
	}
	#endregion
	
	instance_destroy(obj_inv_action_bag);
	text = "";
	if(inv_position > -1 && tapped_on_x > 0 && tapped_on_y > 0) {
		item_id = inventory[# 0,inv_position];
		if(item_id != 0) {
			var ini_file = "item_info.ini";
			if(inv_item_unique(item_id)) {
				ini_file = "item_info_u.ini"
			}
			ini_open(ini_file);
				var item_name = ini_read_string(item_id,"name",noone);
				var item_s_str = ini_read_real(item_id,"s_str",0);
				var item_s_spd = ini_read_real(item_id,"s_spd",0);
				var item_s_agi = ini_read_real(item_id,"s_agi",0);
				var item_s_end = ini_read_real(item_id,"s_end",0);
				var item_s_stl = ini_read_real(item_id,"s_stl",0);
				var item_s_awe = ini_read_real(item_id,"s_awe",0);
				var item_s_rge = ini_read_real(item_id,"s_rge",0);
				var item_s_dmg_min = ini_read_real(item_id,"dmg_min",0);
				var item_s_dmg_max = ini_read_real(item_id,"dmg_max",0);
			ini_close();
			text = item_name + "\n";
			if(item_s_str > 0) text += "Str +" + string(item_s_str) + "\n";
			else if(item_s_str < 0) text += "Str " + string(item_s_str) + "\n";
			if(item_s_spd > 0) text += "Spd +" + string(item_s_spd) + "\n";
			else if(item_s_spd < 0) text += "Spd " + string(item_s_spd) + "\n";
			if(item_s_agi > 0) text += "Agi +" + string(item_s_agi) + "\n";
			else if(item_s_agi < 0) text += "Agi " + string(item_s_agi) + "\n";
			if(item_s_end > 0) text += "End +" + string(item_s_end) + "\n";
			else if(item_s_end < 0) text += "End " + string(item_s_end) + "\n";
			if(item_s_stl > 0) text += "Stl +" + string(item_s_stl) + "\n";
			else if(item_s_stl < 0) text += "Stl " + string(item_s_stl) + "\n";
			if(item_s_awe > 0) text += "Awe +" + string(item_s_awe) + "\n";
			else if(item_s_awe < 0) text += "Awe " + string(item_s_awe) + "\n";
			if(item_s_awe > 0) text += "Rng +" + string(item_s_rge) + "\n";
			else if(item_s_awe < 0) text += "Rng " + string(item_s_rge) + "\n";
			if(item_s_dmg_min > 0) text += "Dmg Min +" + string(item_s_dmg_min) + "\n";
			else if(item_s_dmg_min < 0) text += "Dmg Min " + string(item_s_dmg_min) + "\n";
			if(item_s_dmg_max > 0) text += "Dmg Max +" + string(item_s_dmg_max) + "\n";
			else if(item_s_dmg_max < 0) text += "Dmg Max " + string(item_s_dmg_max) + "\n";
			if(inventory[# 1,inv_position] > 1) {
				with(instance_create_depth(tapped_on_x,tapped_on_y,0,obj_inv_action_bag)) {
					sprite_index = spr_inv_action_pickup_all;
				}
			}
			with(instance_create_depth(tapped_on_x,tapped_on_y,0,obj_inv_action_bag)) {
				sprite_index = spr_inv_action_pickup;
			}
			with(obj_inv_action_bag) {
				slot_y = inv_position;
				inv_from = other.inventory;
				inv_to = inv_other;
				bag = other.bag;
			}
		}
	}
}