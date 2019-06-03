/// @description Draw Inentory
var ddown = 0;
if(inventory != noone) {
	draw_rectangle_color(x,y,x+width,y+height,c_gray,c_gray,c_gray,c_gray,0);
	draw_set_halign(fa_right);
	draw_set_valign(fa_center);
	for(var inv_yy = inv_y; inv_yy < (y+height-20); inv_yy += 65) { 
		for(var inv_xx = inv_x; inv_xx < (x+width-100); inv_xx += 65) { 
			draw_sprite(spr_inventroy_slot,0,inv_xx,inv_yy);
			if(ddown < ds_grid_height(inventory)) {
				if(!is_undefined(inventory[# slot_spr,ddown])) {
					if(inventory[# slot_spr,ddown] > 0) {
						draw_sprite(inventory[# slot_spr,ddown],0,inv_xx,inv_yy);
						if(inventory[# slot_cap,ddown] > 1)
						draw_text(inv_xx + 20,inv_yy + 20,string(inventory[# slot_sum,ddown]));
					}
				}
			}
			ddown++;
		}
	}
	draw_rectangle_color(b1_x,b_y,b1_x+b_width,b_y+b_height,c_maroon,c_maroon,c_maroon,c_maroon,1);
	draw_rectangle_color(b2_x,b_y,b2_x+b_width,b_y+b_height,c_navy,c_navy,c_navy,c_navy,1);
	draw_rectangle_color(tb_x,tb_y,tb_x+tb_width,tb_y+tb_height,c_purple,c_purple,c_purple,c_purple,1);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text(b1_x+b_width/2,b_y+b_height/2,"Close");
	draw_text(b2_x+b_width/2,b_y+b_height/2,"Take All");
	draw_set_valign(fa_top);
	draw_text(tb_x+tb_width/2,tb_y+10,text);
	with(obj_inv_action_bag) {
		draw_sprite(sprite_index,0,x,y);
	}
}