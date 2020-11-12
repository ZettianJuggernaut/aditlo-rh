/// @description Turn Start
radar_search(radar,obj_enemy_parent,obj_character_parent); //Checking the near tiles
/*New AI code
var enemy = instance_nearest(x,y,obj_character_parent);
if(play_vis_check(id,enemy)) {
	var x_dif = (enemy.x - x)/64,
	y_dif = (enemy.y - y)/64,
	range_need = abs(x_dif) + abs(y_dif);
	if(enemy.depth != depth) range_need++;
	if(s_range >= range_need) state = ai_state.attack;
	else state = ai_state.alert;
}
script_execute(state_array[state]);*/
enemy_move();