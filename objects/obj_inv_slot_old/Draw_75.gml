/// @description Draw Item
//var inv = current_following.inventory;
if(inv[# s_inventory.slot_spr,slot_y] > 0) {
	var spr = inv[# s_inventory.slot_spr,slot_y];
	if(sprite_exists(spr)) {
		draw_sprite(spr,0,ix,iy);
		draw_set_valign(fa_center);
		draw_set_halign(fa_right);
		if(inv[# s_inventory.slot_cap,slot_y] > 1) {
			if(inv[# s_inventory.slot_id,slot_y] == "gold") {
				draw_text(ix+20,iy+20,string(inv[# s_inventory.slot_sum,slot_y]));
			}
			else {
				draw_text(ix+20,iy+20,string(inv[# s_inventory.slot_sum,slot_y]) + "/" + string(inv[# s_inventory.slot_cap,slot_y]));
			}
		}
	}
}