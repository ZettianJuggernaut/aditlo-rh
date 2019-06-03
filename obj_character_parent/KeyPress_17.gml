/// @description
if(id == global.list_turn_order[| 0]) {
	instance_destroy(obj_action_icon);
	/*var nearest_enemy = instance_nearest(x,y,obj_enemy_parent);
	var nearest_enemy_obj = nearest_enemy.object_index;
	var message = ("Nearest Enemy: " + object_get_name(nearest_enemy_obj));
	message += " at ";
	message += string(nearest_enemy.x);
	message += "x";
	message += string(nearest_enemy.y);
	show_debug_message(message);*/
	alarm[1] = 1;
}