if(device_mouse_check_button_released(0,mb_left) && !instance_exists(obj_inv_equip)) {
	//Open/Close Inventory
	var tap = device_mouse_x_to_gui(0);
	if(tap > xx - width/2 && tap < xx + width/2) {
		tap = device_mouse_y_to_gui(0);
		if(tap > yy - height/2 && tap < yy + height/2) {
			if(inv_visible == 6) inv_visible = global.inventory_height;
			alarm[0] = 1;
		}
	}
	//Interact Inventory
	var x1 = inv_x_base, x2 = x1 + 65, x3 = x2 + 65, x4 = x3 + 65, x5 = x4 + 65, x6 = x5 + 65,
	y1 = inv_y_mod, y2 = y1 + 65, y3 = y2 + 65, y4 = y3 + 65,
	width1 = sprite_get_width(spr_inventroy_slot),
	height1 = sprite_get_height(spr_inventroy_slot),
	current_following = obj_display_manager.follow,
	inv_position = 0, tapped_on_x = 0, tapped_on_y = 0, item_id = 0;
	
	#region Tapped y
	tap = device_mouse_y_to_gui(0);
	if(tap > y1 - height1/2 && tap < y1 + height1/2) {
		tapped_on_y = y1;
		inv_position = 0;
	}
	else if(tap > y2 - height1/2 && tap < y2 + height1/2) {
		tapped_on_y = y2;
		inv_position = 6;
	}
	else if(tap > y3 - height1/2 && tap < y3 + height1/2) {
		tapped_on_y = y3;
		inv_position = 12;
	}
	else if(tap > y4 - height1/2 && tap < y4 + height1/2) {
		tapped_on_y = y4;
		inv_position = 18;
	}
	else {
		tapped_on_y = 0;
	}
	#endregion
	
	#region Tapped x
	if(tapped_on_y > 0) {
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
		else if(tap > x4 - width1/2 && tap < x4 + width1/2) {
			tapped_on_x = x4;
			inv_position += 3;
		}
		else if(tap > x5 - width1/2 && tap < x5 + width1/2) {
			tapped_on_x = x5;
			inv_position += 4;
		}
		else if(tap > x6 - width1/2 && tap < x6 + width1/2) {
			tapped_on_x = x6;
			inv_position += 5;
		}
		else {
			tapped_on_x = 0;
		}
	}
	#endregion
	
	instance_destroy(obj_inv_action);
	
	if(inv_position > -1 && tapped_on_x > 0 && tapped_on_y > 0) {
		item_id = current_following.inventory[# 0,inv_position];
		if(item_id != 0) {
			var ini_file = "item_info.ini";
			if(inv_item_unique(item_id)) {
				ini_file = "item_info_u.ini"
			}
			ini_open(ini_file);
				var item_type = ini_read_string(item_id,"type",noone);
				var equipped = ini_read_real(item_id,"equipped",0);
			ini_close();
			switch(item_type) {
				case(0):
					//Emtpy
				break;
				case("Weapon"):
				case("Shield"):
				case("Brace"):
					if(!equipped) {
						with(instance_create_depth(tapped_on_x,tapped_on_y,0,obj_inv_action)) {
							sprite_index = spr_inv_action_equip;
						}
				}
				
				case("Consumable"):
				
				default:
					with(instance_create_depth(tapped_on_x,tapped_on_y,0,obj_inv_action)) {
						sprite_index = spr_inv_action_drop;
					}
			}
			with(obj_inv_action) {
				slot_y = inv_position;
				character = current_following;
			}
		}
	}
}