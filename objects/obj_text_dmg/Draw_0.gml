draw_set_halign(fa_center);
if(is_real(text_dmg))
{
	draw_text_color(x,y,"-" + string(text_dmg),c_red,c_red,c_red,c_red,image_alpha);
}
else
{
	draw_text_color(x,y,text_dmg,c_black,c_black,c_black,c_black,image_alpha);
}