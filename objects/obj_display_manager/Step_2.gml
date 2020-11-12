/// @descr Follow Player

var xx = follow.x,
yy = follow.y;

global.view_x = xx - global.view_w/2;
global.view_y = yy - global.view_h/2;

global.view_x = clamp(global.view_x,0,room_width-global.view_w);
global.view_y = clamp(global.view_y,0,room_height-global.view_h);

camera_set_view_size(view_camera[0],global.view_w,global.view_h);

var _round = global.view_w/surface_get_width(application_surface),
cam_x = round_n(global.view_x,_round),
cam_y = round_n(global.view_y,_round);
camera_set_view_pos(view_camera[0],cam_x,cam_y);

global.offset = (ideal_height - 1024)/2;