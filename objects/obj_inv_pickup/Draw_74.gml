/// @description Draw Inentory
if(inventory != noone) {
	draw_rectangle_color(x,y,x+width,y+height,c_gray,c_gray,c_gray,c_gray,0);
	draw_rectangle_color(b1_x,b_y,b1_x+b_width,b_y+b_height,c_maroon,c_maroon,c_maroon,c_maroon,1);
	draw_rectangle_color(b2_x,b_y,b2_x+b_width,b_y+b_height,c_navy,c_navy,c_navy,c_navy,1);
	draw_rectangle_color(tb_x,tb_y,tb_x+tb_width,tb_y+tb_height,c_purple,c_purple,c_purple,c_purple,1);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text(b1_x+b_width/2,b_y+b_height/2,"Close");
	draw_text(b2_x+b_width/2,b_y+b_height/2,"Take All");
	draw_set_valign(fa_top);
	draw_text(tb_x+tb_width/2,tb_y+10,text_name + "\n\n" + text_stat);
}