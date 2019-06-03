var center_x = x + width/2;
var center_y = y + height/2;
draw_rectangle(x,y,x2,y2,1);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text(center_x,center_y,text_draw);
draw_set_halign(fa_left);
draw_set_valign(fa_top);