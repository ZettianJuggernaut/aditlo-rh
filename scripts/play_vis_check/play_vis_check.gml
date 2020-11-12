///
function play_vis_check(cur_obj, other_obj) {

	var awareness = cur_obj.s_aware,
	stealth = other_obj.s_stealth,
	dis_mod = point_distance(cur_obj.x,cur_obj.y,other_obj.x,other_obj.y)/64;
		dis_mod -= 3;

	if(awareness >= (stealth + dis_mod)) {
		return true;
	}
	else {
		return false;
	}
}
