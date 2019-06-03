var xx = argument0,
yy = argument1;
if(visible) {
	speed = 4;
	direction = point_direction(x,y,xx,yy);
	alarm[0] = (point_distance(x,y,xx,yy)/speed);
	//image_xscale = 1;
	switch(direction) {
		case(0): sprite_index = spr_character_side_right; break;
		case(90): sprite_index = spr_character_back; break;
		case(180): sprite_index = spr_character_side_left; break;
		case(270): sprite_index = spr_character_front; break;
	}
	skeleton_animation_set("Walk");
	skeleton_skin_set(skin);
	event_user(0);
}
else {
	x = xx;
	y = yy;
	alarm[0] = 1;
}