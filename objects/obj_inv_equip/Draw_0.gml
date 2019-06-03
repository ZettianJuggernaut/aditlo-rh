/// @description
draw_set_color(c_black);
draw_rectangle_color(x-width,y-250,x+width,y+250,c_gray,c_gray,c_gray,c_gray,0);
draw_text(x,y+25,"Equipped to:");
draw_sprite(spr_inv_action_equip_slit,0,x,y+b1_y);
draw_text(x,y+b1_y,b1_text);
draw_sprite(spr_inv_action_equip_slit,0,x,y+b2_y);
draw_text(x,y+b2_y,b2_text);