//Inentory
var current_following = obj_display_manager.follow,
offset = global.offset,
inv_x = inv_x_base,
inv_y = inv_y_mod,
ddown = 0;
if(current_following != obj_free_cam) {
	var inv = current_following.inventory;
	draw_set_halign(fa_right);
	draw_set_valign(fa_center);
	repeat(inv_visible) {
		draw_sprite(spr_inventroy_slot,0,inv_x,inv_y);
		if(ddown < ds_grid_height(inv)) {
			if(sprite_exists(inv[# slot_spr,ddown])) {
				if(inv[# slot_spr,ddown] > 0) {
					draw_sprite(inv[# slot_spr,ddown],0,inv_x,inv_y);
					if(inv[# slot_cap,ddown] > 1) {
						if(inv[# slot_id,ddown] == "gold") {
							draw_text(inv_x + 20,inv_y + 20,string(inv[# slot_sum,ddown]));
						}
						else {
							draw_text(inv_x + 20,inv_y + 20,string(inv[# slot_sum,ddown]) + "/" + string(inv[# slot_cap,ddown]));
						}
					}
				}
			}
		}
		ddown++;
		inv_x += 65;
		if(((inv_x - inv_x_base)/65) == 6) {
			inv_x = inv_x_base;
			inv_y += 65;
		}
	}
	draw_sprite_ext(spr_button_inventory,0,50,offset+870,1,1,image_angle,c_white,1);
	draw_sprite(spr_bag_cover,0,inv_x_base - 40,inv_y_base + 35);

	with(obj_inv_action) {
		draw_sprite(sprite_index,0,x,y);
	}
}