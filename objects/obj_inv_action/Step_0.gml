if(device_mouse_check_button_released(0,mb_left)) {
	var action_id = instance_position(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),object_index);
	if(action_id == id) {
		var yy = slot_y;
		var char = character;
		var item_id = char.inventory[# 0,yy];
		switch(sprite_index) {
			case(spr_inv_action_drop):
				if(char.inventory[# 1,yy] > 0) {
					with(char) {
						var dropped = drop_item(inventory,yy,x,y,1);
						if(dropped) {
							inventory[# 1,yy] -= 1;
							if(inventory[# 1,yy] < 1 && inventory[# 0,yy] != "gold") {
								ds_grid_set_region(inventory,0,yy,ds_grid_width(inventory),yy,0);
							}
							if(inv_item_unique(item_id)) {
								inv_item_unequip(item_id);
								event_user(0);
							}
						}
					}
				}
			break;
			case(spr_inv_action_equip):
				with(instance_create_depth(global.view_x + (global.view_w/2),global.view_y + (global.view_h/2),-500,obj_inv_equip)) {
					character = char;
					slot_y = yy;
					ini_open("item_info_u.ini");
						var type = ini_read_string(item_id,"type",noone)
						switch(type) {
							case("Weapon"):
							case("Shield"):
								b1_text = "Right Hand";
								b2_text = "Left Hand";
							break;
							case("Brace"):
								b1_text = "Right Wrist";
								b2_text = "Left Wrist";
							break;
						}
					ini_close();
				}
			break;
		}
		instance_destroy(object_index);
		with(obj_action_icon) {
			if(sprite_index != spr_icon_hand) instance_destroy();
		}
		obj_button_end_turn.text = "End Turn";
	}
}