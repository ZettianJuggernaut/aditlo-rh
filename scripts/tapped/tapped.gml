/// @param x,width,y,height
if(device_mouse_check_button_released(0,mb_left))
{
	var tap = device_mouse_x(0),
	xx = argument0,
	width = argument1;
	if(tap > xx && tap < xx + width)
	{
		tap = device_mouse_y(0);
		var yy = argument2,
		height = argument3;
		if(tap > yy && tap < yy + height)
		{
			return true;
		}
	}
}
return false;