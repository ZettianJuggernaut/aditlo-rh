if(device_mouse_check_button_released(0,mb_left)) {
	var action_id = instance_position(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),object_index);
	if(action_id == id) {
		var yy = slot_y;
		var item_id = character.inventory[# 0,yy];
		var eslot = noone;
		switch(text) {
			case("Drop"):
				if(character.inventory[# 1,yy] > 0) {
					with(character) {
						var dropped = drop_item(inventory,yy,x,y,1);
						if(dropped) {
							inventory[# s_inventory.slot_sum,yy] -= 1;
							if(inventory[# s_inventory.slot_sum,yy] < 1 && inventory[# 0,yy] != "gold") {
								ds_grid_set_region(inventory,0,yy,s_inventory.width,yy,0);
							}
							if(inv_item_unique(item_id)) {
								inv_item_unequip(item_id);
								event_user(0);
							}
						}
					}
				}
			break;
			case("Left"):
				eslot = "s-hold-left";
				with(character) {
					if(ds_grid_value_exists(inventory,4,0,4,ds_grid_height(inventory)-1,eslot)) {
						var pre_y = ds_grid_value_y(inventory,4,0,4,ds_grid_height(inventory)-1,eslot);
						inventory[# 4,pre_y] = 0;
						inv_item_unequip(inventory[# 0,pre_y]);
					}
					inventory[# 4,other.slot_y] = eslot;
					inv_item_equip(inventory[# 0,other.slot_y]);
					event_user(0);
				}
			break;
			case("Right"):
				eslot = "s-hold-right";
				with(character) {
					if(ds_grid_value_exists(inventory,s_inventory.slot_equip,0,s_inventory.slot_equip,ds_grid_height(inventory)-1,eslot)) {
						var pre_y = ds_grid_value_y(inventory,s_inventory.slot_equip,0,s_inventory.slot_equip,ds_grid_height(inventory)-1,eslot);
						inventory[# s_inventory.slot_equip,pre_y] = 0;
						inv_item_unequip(inventory[# 0,pre_y]);
					}
					inventory[# s_inventory.slot_equip,other.slot_y] = eslot;
					inv_item_equip(inventory[# s_inventory.slot_id,other.slot_y]);
					event_user(0);
				}
			break;
			case("Unequip"):
				with(character) {
					inventory[# s_inventory.slot_equip,other.slot_y] = 0;
					inv_item_unequip(inventory[# s_inventory.slot_id,other.slot_y]);
					event_user(0);
				}
			break;
			case("Consume"):
				item_consume(item_id,character,slot_y);
			break;
		}
		instance_destroy(object_index);
		with(obj_action_icon) {
			if(sprite_index != spr_icon_hand) instance_destroy();
		}
		obj_button_end_turn.text = "End Turn";
	}
}