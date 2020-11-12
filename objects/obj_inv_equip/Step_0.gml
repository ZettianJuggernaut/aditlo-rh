/// @description
if(device_mouse_check_button_released(0,mb_left)) {
	var tap = device_mouse_x(0);
	if(tap > x - b_width/2 && tap < x + b_width/2) {
		var slot = noone;
		tap = device_mouse_y(0);
		if(tap > y+b1_y - b_height/2 && tap < y+b1_y + b_height/2) {
			switch(b1_text) {
				case("Right Hand"):
					slot = "s-hold-right";
				break;
				case("Right Brace"):
					slot = "s-brace-right";
				break;
			}
		}
		else if(tap > y+b2_y - b_height/2 && tap < y+b2_y + b_height/2) {
			switch(b2_text) {
				case("Left Hand"):
					slot = "s-hold-left";
				break;
				case("Left Brace"):
					slot = "s-brace-left";
				break;
			}
		}
		if(slot != noone) {
			with(character) {
				if(ds_grid_value_exists(inventory,4,0,4,ds_grid_height(inventory)-1,slot)) {
					var pre_y = ds_grid_value_y(inventory,4,0,4,ds_grid_height(inventory)-1,slot);
					inventory[# 4,pre_y] = 0;
					inv_item_unequip(inventory[# 0,pre_y]);
				}
				inventory[# 4,other.slot_y] = slot;
				inv_item_equip(inventory[# 0,other.slot_y]);
				event_user(0);
			}
			instance_destroy();
		}
	}
	else if(tap < x - width || tap > x + width) {
			instance_destroy();
	}
}