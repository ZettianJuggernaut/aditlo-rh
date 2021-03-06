/// @description HUD
var cam_lock = obj_display_manager.follow,
offset = global.offset;
//var current_turn = global.list_turn_order[| 0];
var cur_c = c_green;
if(cam_lock.ai) {
	cur_c = c_yellow;
}

draw_set_color(c_black);
draw_set_halign(fa_center); draw_set_valign(fa_center);
draw_sprite(spr_hud,0,0,offset);

//Round Timer
draw_text(x1,150,"Round Timer: " + string(round((obj_action_control.alarm[0])/60)));

//Current Player Slot
draw_sprite(spr_cur_player_box,0,x1,y1);
if(!is_undefined(cam_lock.skin)) draw_skeleton(cam_lock.sprite_index,"Idle",cam_lock.skin,0,x1,y1+15,cam_lock.image_xscale,1,0,-1,1);
draw_text_color(x1,y1-50,text1,c_white,c_white,c_white,c_white,1);
/*draw_rectangle_color(x4-h2,y1-h2,x4+h2,y1+h2,cur_c,cur_c,cur_c,cur_c,0);
draw_text(x4,y1,text4);

//Second Player Slot
draw_rectangle_color(x2-(width2/2),y2-h2,x2+(width2/2),y2+h2,c_gray,c_gray,c_gray,c_gray,0);
draw_text(x2,y2,text2);
//Third Player Slot
draw_rectangle_color(x3-(width2/2),y2-h2,x3+(width2/2),y2+h2,c_gray,c_gray,c_gray,c_gray,0);
draw_text(x3,y2,text3);

//Current Player:
//draw_text(200,50,"Current Turn: " + object_get_name(current_turn.object_index));*/

//Action Quene:
if(aq_vis){
	var yq = 250, i = 0, xq = global.view_w/2;
	draw_rectangle_color(xq-200,yq-20,xq+200,yq+380,c_gray,c_gray,c_gray,c_gray,0);
	var qactions = ds_grid_height(global.grid_turn_actions);
	draw_text(xq,yq,"Action Quene:  " + string(qactions) + "/" + string(global.total_actions));
	repeat(qactions) {
		yq += 20;
		draw_text(xq,yq,object_get_name((global.grid_turn_actions[# 1,i].object_index))
		+ "  " +string(global.grid_turn_actions[# 2,i])
		+ "  " +string(global.grid_turn_actions[# 3,i])
		+ "  " +string(global.grid_turn_actions[# 4,i++])
		);
	}
}

//Stats
if(cam_lock != obj_free_cam) {
	draw_text(390,offset+70,"Stats:");
	draw_set_halign(fa_left);
	draw_text(280,offset+130,@"Health: " + string(cam_lock.s_health) + @"
	Strength: " + string(cam_lock.s_strength) + @"
	Speed: " + string(cam_lock.s_speed) + @"
	Agility: " + string(cam_lock.s_agility)+ @"
	Endurence: " + string(cam_lock.s_endurance));
	draw_text(400,offset+130,@"Stealth: " + string(cam_lock.s_stealth) + @"
	Awareness: " + string(cam_lock.s_aware) + @"
	Range: " + string(cam_lock.s_range) + @"
	Dmg Min: " + string(cam_lock.s_dmg_min) + @"
	Dmg Max: " + string(cam_lock.s_dmg_max));
}