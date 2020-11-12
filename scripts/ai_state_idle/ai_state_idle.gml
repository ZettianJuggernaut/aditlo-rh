
function ai_state_idle(){
	if(target_point[0] == x && target_point[1] == y) {
		var tp_max = 10, tp_used = 0, target_set = false;
		do {
			tp_max = 10
			tp_used = irandom_range(-tp_max,tp_max)
			target_point[0] = x+(tp_used*64);
			tp_max -= abs(tp_used);
			tp_used = irandom_range(-tp_max,tp_max)
			target_point[1] = y+(tp_used*64);
			if(tilemap_get_at_pixel(collision_map,target_point[0],target_point[1]) == 1) target_set = true;
		}
		until(target_set);
	}
	state = choose(ai_state.idle,ai_state.wander);
}