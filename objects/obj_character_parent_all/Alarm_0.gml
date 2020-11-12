/// @description Turn End
speed = 0;
direction = 0;
position_check();
skeleton_animation_set("Idle");
/*if(sprite_index != spr_character_front) {
	sprite_index = spr_character_front;
	skeleton_skin_set(look);
}
else {
	skeleton_animation_set("Idle");
}
image_xscale = 1;*/
//var bottom = bbox_bottom;
event_user(0);

obj_action_control.alarm[0] = 1;
/*var grid = global.grid_turn_actions;

if(grid[# 1,ds_grid_height(grid)-1] = id) start_round();