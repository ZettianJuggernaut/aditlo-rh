/// @param text#
var player = "p";
player += string_char_at(argument0,8);
switch(player) {
	case("p1"):
		text1 = "Player 1";
		text2 = "Player 2";
		text3 = "Player 3";
	break;
	case("p2"):
		text1 = "Player 2";
		text2 = "Player 1";
		text3 = "Player 3";
	break;
	case("p3"):
		text1 = "Player 3";
		text2 = "Player 1";
		text3 = "Player 2";
	break;
}
obj_display_manager.follow = ds_map_find_value(global.map_assignment,player);
instance_destroy(obj_action_icon);
with(obj_display_manager.follow) {
	var grid = global.grid_players;
	var g_y = ds_grid_value_y(grid,0,0,0,ds_grid_height(grid),object_index);
	other.text4 = grid[# 1,g_y];
	//if(id == global.list_turn_order[| 0]) {
	if(!action_queued(id)) {
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