//Inentory
//with(obj_inv_action) draw_sprite(sprite_index,0,x,y);
if(inv_visible) {
	draw_rectangle_color(x-200,y-250,x+200,y+250,c_gray,c_gray,c_gray,c_gray,0);
	draw_rectangle(x-190,y-240,x+190,y-40,1);
	//if(slot_y > -1) {
		draw_text(x,y-230,text_name);
		draw_text(x-100,y-100,text_desc);
		draw_text(x+100,y-100,text_stat);
	//}
}