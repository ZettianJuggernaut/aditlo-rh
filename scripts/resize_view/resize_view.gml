function resize_view() {
	//Display Properties
	if(global.orien == 0)
	{
		ideal_width = 0;
		ideal_height = 576;
		display_width = display_get_width();
		display_height = display_get_height();

		aspect_ratio = display_width/display_height;
		ideal_width = round(ideal_height*aspect_ratio);
	}
	else
	{
		ideal_width = 576;
		ideal_height = 0;
		display_width = display_get_width();
		display_height = display_get_height();

		aspect_ratio = display_width/display_height;
		ideal_height = round(ideal_width/aspect_ratio);
	}

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


}
