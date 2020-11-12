function ai_move() {
	var moved = false, move_dir = choose(0,90,180,270);
	var other1 = noone, other2 = noone;
	var close_player = noone;
	if(object_index == global.map_assignment[? "p1"]) {
		other1 = global.map_assignment[? "p2"];
		other2 = global.map_assignment[? "p3"];
	}
	else if(object_index == global.map_assignment[? "p2"]) {
		other1 = global.map_assignment[? "p1"];
		other2 = global.map_assignment[? "p3"];
	}
	else if(object_index == global.map_assignment[? "p3"]) {
		other1 = global.map_assignment[? "p1"];
		other2 = global.map_assignment[? "p2"];
	}
	if(other1.ai) close_player = other2;
	else if(other2.ai) close_player = other1;
	else {
		if(point_distance(x,y,other1.x,other1.y) < point_distance(x,y,other2.x,other2.y)) close_player = other1;
		else close_player = other2;
	}
	var close_enemy = instance_nearest(x,y,obj_enemy_parent);
	var tries = 0;

	if(!play_vis_check(close_enemy,id)) {
		var dis = point_distance(x,y,close_player.x,close_player.y)/64;
		if(dis > 1.5) move_dir = point_direction(x,y,close_player.x,close_player.y);
		else tries = 3;//move_dir = clamp(point_direction(x,y,close_player.x,close_player.y)+180,0,360);
	}
	else {
		move_dir = point_direction(x,y,close_enemy.x,close_enemy.y);
	}

	//Queueing Action
	var xx = x;
	var yy = y;
	var enemy = obj_enemy_parent;
	var action = 0;
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
	switch(ds_grid_get(radar,radar_x,radar_y)) {
		case(1): action = 1; break;
		case(3):
		//	var att = instance_nearest(x,y,object_index);
			var def = instance_nearest(xx,yy,enemy);
			if(def.x == xx && def.y == yy) {
				//queue_action(19,id,3,xx,yy);
				action = 3;
			}
		break;
		case(4):
			action = 4;
		break;
	}
	queue_action(19,id,action,xx,yy);

	//Move
	/*while(!moved) {
		moved = enemy_action(x,y,move_dir,obj_enemy_parent);
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

/* end ai_move */
}
