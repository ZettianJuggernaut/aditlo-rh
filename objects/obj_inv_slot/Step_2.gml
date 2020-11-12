if(device_mouse_check_button_released(0,mb_left)) {
	instance_destroy(obj_inv_action);
	var clicked = instance_position(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),object_index);
	if(clicked) {
		with(clicked) {
			var item_id = current_following.inventory[# s_inventory.slot_id,slot_y];
			if(item_id != 0) {
				if(inv_item_unique(item_id)) var ini_file = "item_info_u.ini";
				else var ini_file = "item_info.ini";
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
				
					case("Consumable"):
				
					default:
						with(instance_create_depth(x,y,0,obj_inv_action)) {
							sprite_index = spr_inv_action_drop;
						}
				}
				with(obj_inv_action) {
					slot_y = other.slot_y;
					character = other.current_following;
				}
				with(obj_inventory_manger) {
					text_stat = "";
					i_id = item_id;
					event_user(1);
				}
			}
		}
	}
}