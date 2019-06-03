/// @param obj_look,obj_stealth

var cur_obj = argument0;
var other_obj = argument1;
var awareness = argument0.s_aware;
var stealth = argument1.s_stealth;
var dis_mod = point_distance(cur_obj.x,cur_obj.y,other_obj.x,other_obj.y)/64;
	dis_mod -= 3;

if(awareness >= (stealth + dis_mod)) {
	return true;
}
else {
	return false;
}