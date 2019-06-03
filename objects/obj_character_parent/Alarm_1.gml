/// @description Turn Start

//Move Grid
radar_search(radar,obj_character_parent,obj_enemy_parent);
show_debug_message("Current Turn: " + object_get_name(object_index) + " at " + string(x) + "x" + string(y));
show_debug_message("At " + string(x) + "x" + string(y) + " or " + string(floor(x/64)) + "x" + string(floor(y/64)));
show_debug_message("Above = " + string(radar[# 4,3]));
show_debug_message("Left = " + string(radar[# 3,4]));
show_debug_message("Right = " + string(radar[# 5,4]));
show_debug_message("Below = " + string(radar[# 4,5]));
show_debug_message("Current = " + string(radar[# 4,4]));

//Available Action

if(bool(ai)) {
	ai_move();
}
else {
	if(object_index == obj_display_manager.follow) {
		//Check Up
		switch(ds_grid_get(radar,4,3)) {
			case(1):
			case(4): //Move
				with(instance_create_depth(x,y-64,-300,obj_action_icon)) {
					sprite_index = spr_icon_feet;
				}
			break;
			case(3): //Attack
				with(instance_create_depth(x,y-64,-300,obj_action_icon)) {
					sprite_index = spr_icon_sword;
				}
			break;
			case(5): //Search
				with(instance_create_depth(x,y-64,-300,obj_action_icon)) {
					sprite_index = spr_icon_eye;
				}
			break;
		}
		//Check Left
		switch(ds_grid_get(radar,3,4)) {
			case(1):
			case(4):
				with(instance_create_depth(x-64,y,-300,obj_action_icon))
				{
					sprite_index = spr_icon_feet;
				}
			break;
			case(3):
				with(instance_create_depth(x-64,y,-300,obj_action_icon))
				{
					sprite_index = spr_icon_sword;
				}
			break;
			case(5):
				with(instance_create_depth(x-64,y,-300,obj_action_icon))
				{
					sprite_index = spr_icon_eye;
				}
			break;
		}
		//Check Down
		switch(ds_grid_get(radar,4,5)) {
			case(1):
			case(4):
				with(instance_create_depth(x,y+64,-300,obj_action_icon))
				{
					sprite_index = spr_icon_feet;
				}
			break;
			case(3):
				with(instance_create_depth(x,y+64,-300,obj_action_icon))
				{
					sprite_index = spr_icon_sword;
				}
			break;
			case(5):
				with(instance_create_depth(x,y+64,-300,obj_action_icon))
				{
					sprite_index = spr_icon_eye;
				}
			break;
		}
		//Check Right
		switch(ds_grid_get(radar,5,4)) {
			case(1):
			case(4):
				with(instance_create_depth(x+64,y,-300,obj_action_icon))
				{
					sprite_index = spr_icon_feet;
				}
			break;
			case(3):
				with(instance_create_depth(x+64,y,-300,obj_action_icon))
				{
					sprite_index = spr_icon_sword;
				}
			break;
			case(5):
				with(instance_create_depth(x+64,y,-300,obj_action_icon))
				{
					sprite_index = spr_icon_eye;
				}
			break;
		}
		//Current Tile
		switch(ds_grid_get(radar,4,4)) {
			case(5):
				with(instance_create_depth(x,y,-300,obj_action_icon))
				{
					sprite_index = spr_icon_eye;
				}
			break;
			case(6):
				with(instance_create_depth(x,y,-300,obj_action_icon)) {
					sprite_index = spr_icon_hand;
				}
			break;
			case(7):
				with(instance_create_depth(x,y,-300,obj_action_icon))
				{
					sprite_index = spr_icon_eye;
				}
				with(instance_create_depth(x,y,-300,obj_action_icon))
				{
					sprite_index = spr_icon_hand;
				}
			break;
		}
	}
}