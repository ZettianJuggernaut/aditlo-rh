/// @description
if(device_mouse_check_button_released(0,mb_left)) {
	var tap = device_mouse_y_to_gui(0);
	if(tap > y2 - h2 && tap < y2 + h2) {
		tap = device_mouse_x_to_gui(0);
		if(tap > x2 - (width2/2) && tap < x2 + (width2/2)) {
			switch_character(text2);
		}
		else if(tap > x3 - (width2/2) && tap < x3 + (width2/2)) {
			switch_character(text3);
		}
	}
	else if(tap > y1 - h2 && tap < y1 + h2) {
		tap = device_mouse_x_to_gui(0);
		if(tap > x4 - h2 && tap < x4 + h2) {
			with(obj_display_manager.follow) {
				var grid = global.grid_players;
				var g_y = ds_grid_value_y(grid,0,0,0,ds_grid_height(grid),object_index);
				switch(grid[# 1,g_y]) {
					case("ai"):
						ai = 0;
						grid[# 1,g_y] = "p";
					break;
					case("p"):
						grid[# 1,g_y] = global.player_id;
					break;
					case(global.player_id):
						ai = 1;
						grid[# 1,g_y] = "ai";
						//if(global.list_turn_order[| 0] == id) {
						if(!action_queued(id)) {
							instance_destroy(obj_action_icon);
							ai_move();
						}
					break;
				}
			}
			text4 = grid[# 1,g_y];
		}
	}
}