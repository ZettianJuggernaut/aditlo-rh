/// @descr Display Properties
ideal_width = 576;
ideal_height = 0;
if(os_type == os_windows)
{
	display_width = display_get_height();
	display_height = display_get_width();
}
else
{
	display_width = display_get_width();
	display_height = display_get_height();
}

aspect_ratio = display_width/display_height;
ideal_height = round(ideal_width/aspect_ratio);

//Check for odd numbers
if(ideal_width & 1)
  ideal_width++;
if(ideal_height & 1)
  ideal_height++;
    
window_set_size(ideal_width,ideal_height);
surface_resize(application_surface,ideal_width,ideal_height);
display_set_gui_size(ideal_width,ideal_height);
  
alarm[0]=1;

global.view_x = 0;
global.view_y = 0;
global.view_w = ideal_width;
global.view_h = ideal_height;

depth = -900;
follow = obj_menu_cam;

//Other Set-Up
global.current_menu = "start";
global.grid_players = ds_grid_create(2,3);;
global.player_id = "p1";

//Next Room
room_goto_next();