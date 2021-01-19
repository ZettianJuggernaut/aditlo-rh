//Inentory
//with(obj_inv_action) draw_sprite(sprite_index,0,x,y);
if(inv_visible) {
	draw_rectangle_color(x-200,y-250,x+200,y+250,c_gray,c_gray,c_gray,c_gray,0);
	draw_rectangle(x-190,y-240,x+190,y-40,1);
	draw_set_valign(fa_top);
		draw_text(x,y-230,text_name);
		draw_text(x-100,y-200,text_desc);
		draw_text(x+100,y-200,text_stat);
	draw_set_valign(fa_center);
}