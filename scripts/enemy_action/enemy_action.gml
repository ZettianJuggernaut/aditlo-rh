/// @param x,y,move_dir,enemy
var xx = argument0;
var yy = argument1;
var move_dir = argument2;
var enemy = argument3;
//var action = 0;
var radar_x = 4;
var radar_y = 4;

//Right
if(move_dir > 315 || (move_dir > -1 && move_dir < 46)) {
	xx += 64;
	radar_x++;
}
//Up
else if(move_dir > 45 && move_dir < 136) {
	yy -= 64;
	radar_y--;
}
//Left
else if(move_dir > 135 && move_dir < 226) {
	xx -= 64;
	radar_x--;
}
//Down
else if(move_dir > 225 && move_dir < 316) {
	yy += 64;
	radar_y++;
}

switch(radar[# radar_x,radar_y]) {
	case(1):
		basic_movement(xx,yy);
		return true;
	break;
	case(3):
		var att = instance_nearest(x,y,object_index);
		var def = instance_nearest(xx,yy,enemy);
		if(def.x == xx && def.y == yy) {
			if(global.control_p1) {
				combat(att,def);
				alarm[0] = 1;
			}
			queue_action(19,id,3,xx,yy);
			return true;
		}
	break;
	case(4):
		depth -= 100;
		basic_movement(xx,yy);
		return true;
	break;
	
	default:
		return false;
}