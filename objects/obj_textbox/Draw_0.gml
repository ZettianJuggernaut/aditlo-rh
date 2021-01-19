/// @description 
draw_self();

draw_set_halign(fa_center);
draw_set_valign(fa_top);

//Draw Name at a special color
draw_set_color(c_yellow);
draw_text(x+xbuf,y+ybuf,textname);

//Drawing text
draw_set_color(c_black);
var text_part = string_copy(text[3,page],1,char_count);
draw_text_ext(x+xbuf,y+ybuf+text_height,text_part,text_height,sprite_width-(xbuf*2));