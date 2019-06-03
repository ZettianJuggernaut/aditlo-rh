/// @param xx,yy

var xx = argument0;
var yy = argument1;
if(instance_exists(selector))
{
	with(selector)
	{
		x = xx;
		y = yy;
	}
}
else
{
	selector = instance_create_depth(xx,yy,depth-1,obj_tile_selector);
	execute = instance_create_depth(0,0,0,obj_button_execute);
}