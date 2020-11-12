/// @description Turn Start

//Move Grid
radar_search(radar,obj_character_parent,obj_enemy_parent);
/*show_debug_message("Current Turn: " + object_get_name(object_index) + " at " + string(x) + "x" + string(y));
show_debug_message("At " + string(x) + "x" + string(y) + " or " + string(floor(x/64)) + "x" + string(floor(y/64)));
show_debug_message("Above = " + string(radar[# 4,3]));
show_debug_message("Left = " + string(radar[# 3,4]));
show_debug_message("Right = " + string(radar[# 5,4]));
show_debug_message("Below = " + string(radar[# 4,5]));
show_debug_message("Current = " + string(radar[# 4,4]));*/

//Available Action

if(bool(ai)) {
	ai_move();
}
else {
	if(object_index == obj_display_manager.follow) {
		var y_mod, x_mod, range_need, enemy_id;
		for(var ddown = 0; ddown < ds_grid_height(radar); ddown++) {
			y_mod = ((ddown-4)*64);
			for(var across = 0; across < ds_grid_width(radar); across++) {
				x_mod = ((across-4)*64);
				range_need = abs(across-4)+abs(ddown-4);
				//Visiblity
				/*if(s_aware >= range_need) tilemap_set_at_pixel(global.tilemap_visiblity,0,x+x_mod,y+y_mod);
				else tilemap_set_at_pixel(global.tilemap_visiblity,1,x+x_mod,y+y_mod);*/
				
				//Actions Creation
				switch(radar[# across,ddown]) {
					case(1):
					case(4): //Move
						if(range_need == 1) {
							with(instance_create_depth(x+x_mod,y+y_mod,-300,obj_action_icon)) 
							sprite_index = spr_icon_feet;
						}
					break;
					case(3): //Attack
						enemy_id = instance_position(x+x_mod,y+y_mod,obj_enemy_parent);
						if(enemy_id != noone) if(enemy_id.depth != depth) range_need++;
						if(s_range >= range_need) {
							with(instance_create_depth(x+x_mod,y+y_mod,-300,obj_action_icon))
							sprite_index = spr_icon_sword;
						}
					break;
					case(5): //Search
						if(range_need == 1)	{
							with(instance_create_depth(x+x_mod,y+y_mod,-300,obj_action_icon))
							sprite_index = spr_icon_eye;
						}
					break;
				}
			}
		}
		//Current Tile
		switch(ds_grid_get(radar,4,4)) {
			case(5):
				with(instance_create_depth(x,y,-300,obj_action_icon)) sprite_index = spr_icon_eye;
			break;
			case(6):
				with(instance_create_depth(x,y,-300,obj_action_icon)) sprite_index = spr_icon_hand;
			break;
			case(7):
				with(instance_create_depth(x,y,-300,obj_action_icon)) sprite_index = spr_icon_eye;
				with(instance_create_depth(x,y,-300,obj_action_icon)) sprite_index = spr_icon_hand;
			break;
		}
	}
}
