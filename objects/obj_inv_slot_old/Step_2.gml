if(device_mouse_check_button_pressed(0,mb_left)) {
	if(position_meeting(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),id)) held++
}
else if(device_mouse_check_button_released(0,mb_left)) {
	if(ix != x && iy != y) {
		with(instance_position(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),object_index)) {
			item_id = inv[# s_inventory.slot_id,slot_y];
			var sum = inv[# s_inventory.slot_sum,slot_y],
			cap = inv[# s_inventory.slot_cap,slot_y];
			if(item_id == 0) {
				ds_grid_add_grid_region(inv,other.inv,0,other.slot_y,s_inventory.width,other.slot_y,0,slot_y);
				other.inv[# s_inventory.slot_sum,other.slot_y] = 0;
			}
			else if(sum < cap){
				var add = clamp(other.inv[# s_inventory.slot_sum,other.slot_y],0,cap-sum);
				inv[# s_inventory.slot_sum,slot_y] += add;
				other.inv[# s_inventory.slot_sum,other.slot_y] -= add;
			}
		}
		if(inv[# s_inventory.slot_sum,slot_y] < 1) {
			ds_grid_set_region(inv,0,slot_y,s_inventory.width,slot_y,0);
		}
		held = 0;
		ix = x;
		iy = y;
		if(instance_exists(obj_inv_pickup)) {
			obj_inv_pickup.used = true;
		}
	}
	var clicked = position_meeting(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),id);
	if(clicked) {
		instance_destroy(obj_inv_action);
		var item_id = inv[# s_inventory.slot_id,slot_y];
		with(inv_text) {
			i_id = -1;
			text_stat = "";
			text_desc = "";
			text_name = "";
		}
		if(item_id != 0) {
			if(inv_text == obj_inventory_manger) {
				if(inv_item_unique(item_id)) {
					var ini_file = "item_info_u.ini";
				}
				else {
					var ini_file = "item_info.ini";
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
							with(instance_create_depth(x,y,0,obj_inv_action)) {
								sprite_index = spr_inv_action_equip;
							}
						}
					break;
					case("Consumable"):
						with(instance_create_depth(x,y,0,obj_inv_action)) {
							//sprite_index = spr_inv_action_consum;
						}
					break;
				}
				with(instance_create_depth(x,y,0,obj_inv_action)) {
					sprite_index = spr_inv_action_drop;
				}
				with(obj_inv_action) {
					slot_y = other.slot_y;
					character = other.current_following;
				}
			}
			else {
				with(instance_create_depth(x,y,0,obj_inv_action_bag)) {
					sprite_index = spr_inv_action_pickup;
				}
				if(inv[# s_inventory.slot_sum,slot_y] > 1) {
					with(instance_create_depth(x,y,0,obj_inv_action_bag)) {
						sprite_index = spr_inv_action_pickup_all;
					}
				}
				with(obj_inv_action_bag) {
					slot_y = other.slot_y;
					inv_from = other.inv;
					inv_to = other.current_following.inventory;
					bag = other.inv_text.bag;
				}
			}
			with(inv_text) {
				i_id = item_id;
				event_user(1);
			}
		}
	}
}
else if(device_mouse_check_button(0,mb_left)) {
	var clicked = position_meeting(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),id);
	if(clicked) {
		if(held > 0) {
			held++;
		}
	}
	if(held > 30) {
		ix = device_mouse_x_to_gui(0);
		iy = device_mouse_y_to_gui(0);
	}
}