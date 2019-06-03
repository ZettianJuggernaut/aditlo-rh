var moved,
move_dir = choose(0,90,180,270),
close_player = instance_nearest(x,y,obj_character_parent),
tries = 0;

var paths = global.grid_tiling_layer_enemy_path;
var xx = (x/64)-0.5;
var yy = (y/64)-0.5;
var on_path = false;

if(play_vis_check(id,close_player)) {
	move_dir = point_direction(x,y,close_player.x,close_player.y);
}
else if(ds_grid_get(paths,xx,yy) > 0) {
	//Right
	if(ds_grid_get(paths,xx + 1,yy) == path_current+path_dir) {
		move_dir = 0;
		on_path = true;
	}
	//Up
	else if(ds_grid_get(paths,xx,yy - 1) == path_current+path_dir) {
		move_dir = 90;
		on_path = true;
	}
	//Left
	else if(ds_grid_get(paths,xx - 1,yy) == path_current+path_dir) {
		move_dir = 180;
		on_path = true;
	}
	//Down
	else if(ds_grid_get(paths,xx,yy + 1) == path_current+path_dir) {
		move_dir = 270;
		on_path = true;
	}
	else {
		path_dir = -1;
		//Right
		if(ds_grid_get(paths,xx + 1,yy) == path_current+path_dir) {
			move_dir = 0;
			on_path = true;
		}
		//Up
		else if(ds_grid_get(paths,xx,yy - 1) == path_current+path_dir) {
			move_dir = 90;
			on_path = true;
		}
		//Left
		else if(ds_grid_get(paths,xx - 1,yy) == path_current+path_dir) {
			move_dir = 180;
			on_path = true;
		}
		//Down
		else if(ds_grid_get(paths,xx,yy + 1) == path_current+path_dir) {
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

//Move
do {
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