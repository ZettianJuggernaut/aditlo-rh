var x1 = x - width/2;
var y1 = y;
var x2 = x + width/2;
var y2 = y + height;
draw_rectangle(x1,y1,x2,y2,1);
draw_set_halign(fa_center);
draw_text(x,y1+10,"Server Name: " + name_server);
draw_text(x,y1+30,"IP address: " + ip_address);
draw_set_halign(fa_left);