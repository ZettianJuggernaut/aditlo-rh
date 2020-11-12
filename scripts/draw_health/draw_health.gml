function draw_health() {
	draw_set_halign(fa_center);
	var color = c_black;
	if(s_health < s_health_max/3)
	{
		color = c_red;
	}
	else if(s_health < s_health_max/2)
	{
		color = c_yellow;
	}
	draw_set_color(color);
	draw_text(x,y - 40,string(s_health));


}
