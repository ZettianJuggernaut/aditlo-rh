/// @description Turn End

event_inherited();

var vvis = false;
if(global.control_p1) {
	vvis = play_vis_check(global.map_assignment[? "p1"],id);
}
if(global.map_assignment[? "p2"] != noone) {
	if(global.control_p2 && !vvis) {
		vvis = play_vis_check(global.map_assignment[? "p2"],id);
	}
}
visible = vvis;
//turn_order();