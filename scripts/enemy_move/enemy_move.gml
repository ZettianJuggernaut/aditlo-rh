//var moved;
var move_dir = choose(0,90,180,270),
close_player = instance_nearest(x,y,obj_character_parent),
tries = 0;

var paths = global.grid_tiling_layer_enemy_path;
var path_x = (x/64)-0.5;
var path_y = (y/64)-0.5;
var on_path = false;

if(play_vis_check(id,close_player)) {
	move_dir = point_direction(x,y,close_player.x,close_player.y);
}
else if(ds_grid_get(paths,path_x,path_y) > 0) {
	//Right
	if(ds_grid_get(paths,path_x + 1,path_y) == path_current+path_dir) {
		move_dir = 0;
		on_path = true;
	}
	//Up
	else if(ds_grid_get(paths,path_x,path_y - 1) == path_current+path_dir) {
		move_dir = 90;
		on_path = true;
	}
	//Left
	else if(ds_grid_get(paths,path_x - 1,path_y) == path_current+path_dir) {
		move_dir = 180;
		on_path = true;
	}
	//Down
	else if(ds_grid_get(paths,path_x,path_y + 1) == path_current+path_dir) {
		move_dir = 270;
		on_path = true;
	}
	else {
		path_dir = -1;
		//Right
		if(ds_grid_get(paths,path_x + 1,path_y) == path_current+path_dir) {
			move_dir = 0;
			on_path = true;
		}
		//Up
		else if(ds_grid_get(paths,path_x,path_y - 1) == path_current+path_dir) {
			move_dir = 90;
			on_path = true;
		}
		//Left
		else if(ds_grid_get(paths,path_x - 1,path_y) == path_current+path_dir) {
			move_dir = 180;
			on_path = true;
		}
		//Down
		else if(ds_grid_get(paths,path_x,path_y + 1) == path_current+path_dir) {
			move_dir = 270;
			on_path = true;
		}
	}
	if(on_path) {
		path_current += path_dir;
		if(path_current == 1) {
			path_dir = 1;
		}
	}
}

//Queueing Action
var xx = x;
var yy = y;
var enemy = obj_character_parent;
var action = 0;
var radar_x = 4;
var radar_y = 4;
var moveable = false
var tries = 0;

while(!moveable) {
	radar_x = 4;
	radar_y = 4;
	xx = x;
	yy = y;
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
	if(radar[# radar_x,radar_y] != 2) moveable = true;
	else {
		switch(tries++) {
			case(0):
				move_dir += 90;
			break;
			case(1):
				move_dir += 180;
			break;
			case(2):
				move_dir -= 90;
			break;
			case(3):
				moveable = true;
			break;
		}
	}
}
switch(radar[# radar_x,radar_y]) {
	case(1): action = 1; break;
	case(3):
		//var att = instance_nearest(x,y,object_index);
		var def = instance_nearest(xx,yy,enemy);
		if(def.x == xx && def.y == yy) {
			//queue_action(18,id,3,xx,yy);
			action = 3;
		}
	break;
	case(4): action = 4; break;
}
queue_action(18,id,action,xx,yy);

//Move
/*do {
	moved = enemy_action(x,y,move_dir,obj_character_parent);
	switch(tries++) {
		case(0):
			move_dir += 90;
		break;
		case(1):
			move_dir += 180;
		break;
		case(2):
			move_dir -= 90;
		break;
		case(3):
			moved = true;
			alarm[0] = 1;
		break;
	}
}
until(moved);