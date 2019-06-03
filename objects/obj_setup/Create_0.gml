//Clean-Up
global.current_menu = "";

//Room Set-Up
global.tile_width = ds_grid_width(global.grid_tiling_layer0);
global.tile_height = ds_grid_height(global.grid_tiling_layer0);
//room_width = global.tile_width*64;
//room_height = global.tile_height*64;

//Turn Order
global.map_assignment = ds_map_create();
global.list_turn_order = ds_list_create();
global.grid_turn_actions = ds_grid_create(5,1);
//global.total_action = 0;

//Global Vars
global.paused = false;
global.inventory_width = 5;
global.inventory_height = 24;

//Temp vars
var tile_setup,
p1 = global.grid_players[# 0,0],
p2 = global.grid_players[# 0,1],
p3 = global.grid_players[# 0,2],
tile_mod = 8;

//Tiling
global.tilemap_layer0_base = layer_tilemap_get_id("tile_base0");
global.tilemap_layer0_water = layer_tilemap_get_id("tile_water0");
global.tilemap_layer0_road = layer_tilemap_get_id("tile_road0");
global.tilemap_layer0_sand = layer_tilemap_get_id("tile_sand0");
global.tilemap_layer0_search = layer_tilemap_get_id("tile_search0");
global.tilemap_layer0_ruin = layer_tilemap_get_id("tile_ruin0");
global.tilemap_layer1_base = layer_tilemap_get_id("tile_base1");
global.tilemap_layer1_water = layer_tilemap_get_id("tile_water1");
global.tilemap_layer1_road = layer_tilemap_get_id("tile_road1");
global.tilemap_layer1_sand = layer_tilemap_get_id("tile_sand1");
global.tilemap_layer1_search = layer_tilemap_get_id("tile_search1");
global.tilemap_layer1_ruin = layer_tilemap_get_id("tile_ruin1");
global.tilemap_layer2_base = layer_tilemap_get_id("tile_base2");
global.tilemap_layer0_collision = layer_tilemap_get_id("tile_collision0");
global.tilemap_layer1_collision = layer_tilemap_get_id("tile_collision1");

var base0 = global.tilemap_layer0_base;
var water0 = global.tilemap_layer0_water;
var road0 = global.tilemap_layer0_road;
var sand0 = global.tilemap_layer0_sand;
var search0 = global.tilemap_layer0_search;
var ruin0 = global.tilemap_layer0_ruin;
var base1 = global.tilemap_layer1_base;
var water1 = global.tilemap_layer1_water;
var road1 = global.tilemap_layer1_road;
var sand1 = global.tilemap_layer1_sand;
var search1 = global.tilemap_layer1_search;
var ruin1 = global.tilemap_layer1_ruin;
var base2 = global.tilemap_layer2_base;
var collision0 = global.tilemap_layer0_collision;
var collision1 = global.tilemap_layer1_collision;
var smoothing = 0;

#region World Create

for(var ddown = 0; ddown < global.tile_height; ddown++) {
	for(var across = 0; across < global.tile_width; across++) {
		#region Layer 0
		//Base
		tile_setup = ds_grid_get(global.grid_tiling_layer0,across,ddown);
		if(tile_setup > 0) {
			tilemap_set(base0,tile_setup,across+tile_mod,ddown+tile_mod);
			tilemap_set(collision0,1,across+tile_mod,ddown+tile_mod);
		}
	
		//Water
		tile_setup = ds_grid_get(global.grid_tiling_layer0_water,across,ddown);
		if(tile_setup > 0) {
			tilemap_set(water0,tile_setup,across+tile_mod,ddown+tile_mod);
			tilemap_set(collision0,2,across+tile_mod,ddown+tile_mod);
		}
	
		//Roads
		tile_setup = ds_grid_get(global.grid_tiling_layer0_road,across,ddown);
		if(tile_setup > 0) {
			tilemap_set(road0,tile_setup,across+tile_mod,ddown+tile_mod);
			tilemap_set(collision0,1,across+tile_mod,ddown+tile_mod);
		}
		
		//Sands
		tile_setup = ds_grid_get(global.grid_tiling_layer0_sand,across,ddown);
		if(tile_setup > 0) {
			tilemap_set(sand0,tile_setup,across+tile_mod,ddown+tile_mod);
			tilemap_set(collision0,1,across+tile_mod,ddown+tile_mod);
		}
	
		//Searchables
		tile_setup = ds_grid_get(global.grid_tiling_layer0_search,across,ddown);
		if(tile_setup > 0) {
			tilemap_set(search0,tile_setup,across+tile_mod,ddown+tile_mod);
			switch(tile_setup) {
				case(1):
				case(2):
					tilemap_set(collision0,1,across+tile_mod,ddown+tile_mod);
				break;
				case(3):
					tilemap_set(collision0,5,across+tile_mod,ddown+tile_mod);
				break;
				case(4):
					tilemap_set(collision0,5,across+tile_mod,ddown+tile_mod);
				break;
			}
		}
		tile_setup = tilemap_get(search0,across+tile_mod,ddown+tile_mod);
		switch(tile_setup) {
			case(1):
			case(2):
				ds_grid_set(global.grid_tiling_layer0_search,across,ddown,choose(0,"item1","item2","item3","item4"));
			break;
			case(3):
				ds_grid_set(global.grid_tiling_layer0_search,across,ddown,choose(0,"item1","item2","item3","item4"));
			break;
			case(4):
				ds_grid_set(global.grid_tiling_layer0_search,across,ddown,inv_item_create("Wood Shield","Shield",spr_item_shield,"Good for blocking.",0,0,0,0,4,0,0,0,0));
			break;
		}
	
		//Ruins
		tile_setup = ds_grid_get(global.grid_tiling_layer0_ruin,across,ddown);
		if(tile_setup > 0) {
			tilemap_set(ruin0,tile_setup,across+tile_mod,ddown+tile_mod);
			tilemap_set(collision0,1,across+tile_mod,ddown+tile_mod);
		}
	
		//Trees
		tile_setup = ds_grid_get(global.grid_trees_layer0,across,ddown);
		if(tile_setup > 0) {
			switch(tile_setup) {
				case(1):
					with(instance_create_depth((across+tile_mod)*64,(ddown+tile_mod)*64,-25,obj_tree_base)) {
						sprite_index = spr_tree_base_a;
					}
				break;
				case(2):
					with(instance_create_depth((across+tile_mod)*64,(ddown+tile_mod)*64,-25,obj_tree_base)) {
						sprite_index = spr_tree_base_b;
					}
				break;
			}
		}
	
		//Characters
		tile_setup = ds_grid_get(global.grid_tiling_layer0_enemy_spawn,across,ddown);
		if(tile_setup > 0) {
			instance_create_depth((across+tile_mod)*64,(ddown+tile_mod)*64,-50,tile_setup);
		}
		#endregion
		
		#region Layer 1
		//Base
		tile_setup = ds_grid_get(global.grid_tiling_layer1,across,ddown);
		if(tile_setup > 0) {
			tilemap_set(base1,tile_setup,across+tile_mod,ddown+tile_mod);
			if(tile_setup > 15) {
				tilemap_set(collision1,1,across+tile_mod,ddown+tile_mod);
				tilemap_set(collision0,4,across+tile_mod,ddown+tile_mod);
			}
			else if(tile_setup > 3) {
				tilemap_set(collision1,2,across+tile_mod,ddown+tile_mod);
				if(tile_setup == 5 || tile_setup == 10 || tile_setup == 11) {
					tilemap_set(collision0,2,across+tile_mod,ddown+tile_mod);
				}
			}
			else {
				if(tile_setup > 0) {
					tilemap_set(collision1,1,across+tile_mod,ddown+tile_mod);
					tilemap_set(collision0,2,across+tile_mod,ddown+tile_mod);
				}
			}
		}
	
		//Water
		tile_setup = ds_grid_get(global.grid_tiling_layer1_water,across,ddown);
		if(tile_setup > 0) {
			tilemap_set(water1,tile_setup,across+tile_mod,ddown+tile_mod);
			tilemap_set(collision1,2,across+tile_mod,ddown+tile_mod);
		}
	
		//Roads
		tile_setup = ds_grid_get(global.grid_tiling_layer1_road,across,ddown);
		if(tile_setup > 0) {
			tilemap_set(road1,tile_setup,across+tile_mod,ddown+tile_mod);
			tilemap_set(collision1,1,across+tile_mod,ddown+tile_mod);
		}
		
		//Sands
		tile_setup = ds_grid_get(global.grid_tiling_layer1_sand,across,ddown);
		if(tile_setup > 0) {
			tilemap_set(sand0,tile_setup,across+tile_mod,ddown+tile_mod);
			tilemap_set(collision0,1,across+tile_mod,ddown+tile_mod);
		}
	
		//Searchables
		tile_setup = ds_grid_get(global.grid_tiling_layer1_search,across,ddown);
		if(tile_setup > 0) {
			tilemap_set(search1,tile_setup,across+tile_mod,ddown+tile_mod);
			switch(tile_setup) {
				case(1):
				case(2):
					tilemap_set(collision1,1,across+tile_mod,ddown+tile_mod);
				break;
				case(3):
					tilemap_set(collision1,5,across+tile_mod,ddown+tile_mod);
				break;
				case(4):
					tilemap_set(collision1,5,across+tile_mod,ddown+tile_mod);
				break;
			}
		}
		tile_setup = tilemap_get(search1,across+tile_mod,ddown+tile_mod);
		switch(tile_setup) {
			case(1):
			case(2):
				ds_grid_set(global.grid_tiling_layer1_search,across,ddown,choose(0,"item1","item2","item3","item4"));
			break;
			case(3):
				ds_grid_set(global.grid_tiling_layer1_search,across,ddown,choose(0,"item1","item2","item3","item4"));
			break;
			case(4):
				ds_grid_set(global.grid_tiling_layer1_search,across,ddown,inv_item_create("Wood Shield","Shield",spr_item_shield,"Good for blocking.",0,0,0,0,4,0,0,0,0));
			break;
		}
	
		//Trees
		tile_setup = ds_grid_get(global.grid_trees_layer1,across,ddown);
		if(tile_setup > 0)
		{
			switch(tile_setup)
			{
				case(1):
					with(instance_create_depth((across+tile_mod)*64,(ddown+tile_mod)*64,-125,obj_tree_base)) {
						sprite_index = spr_tree_base_a;
					}
				break;
				case(2):
					with(instance_create_depth((across+tile_mod)*64,(ddown+tile_mod)*64,-125,obj_tree_base)) {
						sprite_index = spr_tree_base_b;
					}
				break;
			}
		}
	
		//Enemies
		tile_setup = ds_grid_get(global.grid_tiling_layer1_enemy_spawn,across,ddown);
		if(tile_setup > 0) {
			instance_create_depth((across+tile_mod)*64,(ddown+tile_mod)*64,-150,tile_setup);
			/*switch(tile_setup) {
				case(p1):
					instance_create_depth((across+tile_mod)*64,(ddown+tile_mod)*64,-150,p1);
				break;
				case(p2):
					instance_create_depth((across+tile_mod)*64,(ddown+tile_mod)*64,-150,p2);
				break;
				case(p3):
					instance_create_depth((across+tile_mod)*64,(ddown+tile_mod)*64,-150,p3);
				break;
				case(1):
					instance_create_depth((across+tile_mod)*64,(ddown+tile_mod)*64,-150,obj_mad_man);
				break;
				case(2):
					instance_create_depth((across+tile_mod)*64,(ddown+tile_mod)*64,-150,obj_savage);
				break;
				case(3):
					instance_create_depth((across+tile_mod)*64,(ddown+tile_mod)*64,-150,obj_bandit);
				break;
			}*/
		}
		#endregion
		
		#region Layer 2
		tile_setup = ds_grid_get(global.grid_tiling_layer2,across,ddown);
		tilemap_set(global.tilemap_layer2_base,tile_setup,across+tile_mod,ddown+tile_mod);
		if(tile_setup > 3)
		{
			if(tile_setup == 5 || tile_setup == 10 || tile_setup == 11)
			{
				tilemap_set(global.tilemap_layer1_collision,2,across+tile_mod,ddown+tile_mod);
			}
		}
		else if(tile_setup > 0)
		{
			tilemap_set(global.tilemap_layer1_collision,2,across+tile_mod,ddown+tile_mod);
		}
		#endregion
	}
}
#endregion

#region World Smoothing
var vaild_tiles = ds_list_create();
var index = 0;
var tile = 1;
for(ddown = 8; ddown < (room_height/64)-7; ddown++) {
	for(across = 8; across < (room_width/64)-7; across++) {
		ds_list_clear(vaild_tiles); index = 0; tile = 1;
		#region Base1
		tile_setup = tilemap_get(base1,across,ddown);
		if(tile_setup > 0 && tile_setup < 16) {
			#region Vaild Tiles List Set-Up
			repeat(3) vaild_tiles[| index++] = tile++;
			switch(tile_setup)	{
				case(1):
				case(2):
				case(3):
					repeat(18) vaild_tiles[| index++] = tile++;
				break;
				case(4):
					vaild_tiles[| index++] = 4;
					tile = 6;
					repeat(7) vaild_tiles[| index++] = tile++;
					vaild_tiles[| index] = 15;
				break;
				case(5):
					tile = 5;
					repeat(7) vaild_tiles[| index++] = tile++;
					tile = 13;
					repeat(2) vaild_tiles[| index++] = tile++;
				break;
				case(6):
					repeat(3) vaild_tiles[| index++] = tile++;
					tile = 8;
					repeat(6) vaild_tiles[| index++] = tile++;
				break;
				case(7):
					repeat(2) vaild_tiles[| index++] = tile++;
					tile = 7;
					repeat(5) vaild_tiles[| index++] = tile++;
					tile = 14;
					repeat(2) vaild_tiles[| index++] = tile++;
				break;
				case(8):
					vaild_tiles[| index++] = 4;
					tile = 7;
					repeat(5) vaild_tiles[| index++] = tile++;
					vaild_tiles[| index++] = 15;
				case(9):
					vaild_tiles[| index++] = 4;
					vaild_tiles[| index++] = 6;
					tile = 8;
					repeat(5) vaild_tiles[| index++] = tile++;
				break;
				case(10):
					tile = 5;
					repeat(2) vaild_tiles[| index++] = tile++;
					tile = 9;
					repeat(3) vaild_tiles[| index++] = tile++;
					vaild_tiles[| index++] = 13;
				break;
				case(11):
					vaild_tiles[| index++] = 5;
					tile = 7;
					repeat(5) vaild_tiles[| index++] = tile++;
					vaild_tiles[| index++] = 14;
				break;
				case(12):
					vaild_tiles[| index++] = 4;
					vaild_tiles[| index++] = 6;
					vaild_tiles[| index++] = 9;
					vaild_tiles[| index++] = 21;
				break;
				case(13):
					vaild_tiles[| index++] = 5;
					vaild_tiles[| index++] = 6;
					vaild_tiles[| index++] = 10;
					vaild_tiles[| index++] = 20;
				break;
				case(14):
					vaild_tiles[| index++] = 5;
					vaild_tiles[| index++] = 7;
					vaild_tiles[| index++] = 11;
					vaild_tiles[| index++] = 18;
				break;
				case(15):
					vaild_tiles[| index++] = 4;
					vaild_tiles[| index++] = 7;
					vaild_tiles[| index++] = 8;
					vaild_tiles[| index++] = 19;
				break;
			}
			#endregion
			switch(tile_smooth(tile_setup,base1,base1,across,ddown,vaild_tiles)) {
				case("Down Right"):
					tilemap_set(base1,12,across,ddown);
				break;
				case("Down Left"):
					tilemap_set(base1,15,across,ddown);
				break;
				case("Up Right"):
					tilemap_set(base1,13,across,ddown);
				break;
				case("Up Left"):
					tilemap_set(base1,14,across,ddown);
				break;
				case("Down Up Right"):
					tilemap_set(base1,6,across,ddown);
				break;
				case("Down Up Left"):
					tilemap_set(base1,7,across,ddown);
				break;
				case("Right Left Up"):
					tilemap_set(base1,5,across,ddown);
				break;
				case("Right Left Down"):
					tilemap_set(base1,4,across,ddown);
				break;
				case("Full Up Left"):
					tilemap_set(base1,9,across,ddown);
				break;
				case("Full Up Right"):
					tilemap_set(base1,8,across,ddown);
				break;
				case("Full Down Right"):
					tilemap_set(base1,11,across,ddown);
				break;
				case("Full Down Left"):
					tilemap_set(base1,10,across,ddown);
				break;
				case("Full"):
					tilemap_set(base1,irandom(2)+1,across,ddown);
				break;
			}
			tile_setup = tilemap_get(base1,across,ddown);
			if(tile_setup < 4) { //If is a flat
				//Removing things that got covered
				tilemap_set(search0,0,across,ddown);
				tilemap_set(road0,0,across,ddown);
				tilemap_set(water0,0,across,ddown);
				tilemap_set(collision1,1,across,ddown);
			}
			else if(tile_setup < 16 || tile_setup > 18) { //If is a Ledge
				tilemap_set(collision1,2,across,ddown); //Setting it to Unwalkable
				if(tile_setup != 5 && tile_setup != 10 && tile_setup != 11) {
					if(tilemap_get(water0,across,ddown) < 1) tilemap_set(collision0,1,across,ddown);
				}
				else if(tile_setup == 5 || tile_setup == 10 || tile_setup == 11) {
					tilemap_set(search0,0,across,ddown);
					tilemap_set(road0,0,across,ddown);
				}
			}
		}
		#endregion
		ds_list_clear(vaild_tiles); index = 0; tile = 1;
		#region Water0
		tile_setup = tilemap_get(water0,across,ddown);
		if(tile_setup > 0 && tile_setup < 14) {
			repeat(17) vaild_tiles[| index++] = tile++;
			switch(tile_smooth(tile_setup,water0,water0,across,ddown,vaild_tiles)) {
				case("Down Right"):
					tilemap_set(water0,6,across,ddown);
				break;
				case("Down Left"):
					tilemap_set(water0,7,across,ddown);
				break;
				case("Up Right"):
					tilemap_set(water0,9,across,ddown);
				break;
				case("Up Left"):
					tilemap_set(water0,8,across,ddown);
				break;
				case("Down Up Right"):
					tilemap_set(water0,2,across,ddown);
				break;
				case("Down Up Left"):
					tilemap_set(water0,4,across,ddown);
				break;
				case("Right Left Up"):
					tilemap_set(water0,3,across,ddown);
				break;
				case("Right Left Down"):
					tilemap_set(water0,1,across,ddown);
				break;
				case("Full Up Left"):
					tilemap_set(water0,10,across,ddown);
				break;
				case("Full Up Right"):
					tilemap_set(water0,11,across,ddown);
				break;
				case("Full Down Right"):
					tilemap_set(water0,12,across,ddown);
				break;
				case("Full Down Left"):
					tilemap_set(water0,13,across,ddown);
				break;
				case("Full"):
					tilemap_set(water0,5,across,ddown);
				break;
			}
		}
		#endregion
		ds_list_clear(vaild_tiles); index = 0; tile = 1;
		#region Road0
		tile_setup = tilemap_get(road0,across,ddown);
		if(tile_setup > 0 && tile_setup < 16) {
			repeat(19) vaild_tiles[| index++] = tile++;
			switch(tile_smooth(tile_setup,road0,road1,across,ddown,vaild_tiles)) {
				case("Down Right"):
					tilemap_set(road0,10,across,ddown);
				break;
				case("Down Left"):
					tilemap_set(road0,9,across,ddown);
				break;
				case("Up Right"):
					tilemap_set(road0,8,across,ddown);
				break;
				case("Up Left"):
					tilemap_set(road0,11,across,ddown);
				break;
				case("Down Up Right"):
					tilemap_set(road0,5,across,ddown);
				break;
				case("Down Up Left"):
					tilemap_set(road0,6,across,ddown);
				break;
				case("Right Left Up"):
					tilemap_set(road0,4,across,ddown);
				break;
				case("Right Left Down"):
					tilemap_set(road0,7,across,ddown);
				break;
				case("Full"):
					tilemap_set(road0,3,across,ddown);
				break;
				case("Right Left"):
					if(tilemap_get(water0,across,ddown) > 0) tilemap_set(road0,18,across,ddown);
					else tilemap_set(road0,1,across,ddown);
				break;
				case("Down Up"):
					if(tilemap_get(water0,across,ddown) > 0) tilemap_set(road0,16,across,ddown);
					else tilemap_set(road0,2,across,ddown);
				break;
				case("Up"):
					tilemap_set(road0,14,across,ddown);
				break;
				case("Right"):
					tilemap_set(road0,13,across,ddown);
				break;
				case("Down"):
					tilemap_set(road0,15,across,ddown);
				break;
				case("Left"):
					tilemap_set(road0,12,across,ddown);
				break;
			}
		}
		#endregion
		ds_list_clear(vaild_tiles); index = 0; tile = 1;
		#region Road1
		tile_setup = tilemap_get(road1,across,ddown);
		if(tile_setup > 0 && tile_setup < 16) {
			repeat(19) vaild_tiles[| index++] = tile++;
			switch(tile_smooth(tile_setup,road1,road0,across,ddown,vaild_tiles)) {
				case("Down Right"):
					tilemap_set(road1,10,across,ddown);
				break;
				case("Down Left"):
					tilemap_set(road1,9,across,ddown);
				break;
				case("Up Right"):
					tilemap_set(road1,8,across,ddown);
				break;
				case("Up Left"):
					tilemap_set(road1,11,across,ddown);
				break;
				case("Down Up Right"):
					tilemap_set(road1,5,across,ddown);
				break;
				case("Down Up Left"):
					tilemap_set(road1,6,across,ddown);
				break;
				case("Right Left Up"):
					tilemap_set(road1,4,across,ddown);
				break;
				case("Right Left Down"):
					tilemap_set(road1,7,across,ddown);
				break;
				case("Full"):
					tilemap_set(road1,3,across,ddown);
				break;
				case("Right Left"):
					if(tilemap_get(water1,across,ddown) > 0) {
						tilemap_set(road1,18,across,ddown);
					}
					else { 
						tilemap_set(road1,1,across,ddown);
					}
				break;
				case("Down Up"):
					if(tilemap_get(water1,across,ddown) > 0) {
						tilemap_set(road1,16,across,ddown);
					}
					else { 
						tilemap_set(road1,2,across,ddown);
					}
				break;
				case("Up"):
					tilemap_set(road1,14,across,ddown);
				break;
				case("Right"):
					tilemap_set(road1,13,across,ddown);
				break;
				case("Down"):
					tilemap_set(road1,15,across,ddown);
				break;
				case("Left"):
					tilemap_set(road1,12,across,ddown);
				break;
			}
		}
		#endregion
		ds_list_clear(vaild_tiles); index = 0; tile = 1;
		#region Water1
		tile_setup = tilemap_get(water1,across,ddown);
		if(tile_setup > 0 && tile_setup < 14) {
			repeat(17) vaild_tiles[| index++] = tile++;
			switch(tile_smooth(tile_setup,water1,water1,across,ddown,vaild_tiles)) {
				case("Down Right"):
					tilemap_set(water1,6,across,ddown);
				break;
				case("Down Left"):
					tilemap_set(water1,7,across,ddown);
				break;
				case("Up Right"):
					tilemap_set(water1,9,across,ddown);
				break;
				case("Up Left"):
					tilemap_set(water1,8,across,ddown);
				break;
				case("Down Up Right"):
					tilemap_set(water1,2,across,ddown);
				break;
				case("Down Up Left"):
					tilemap_set(water1,4,across,ddown);
				break;
				case("Right Left Up"):
					tilemap_set(water1,3,across,ddown);
				break;
				case("Right Left Down"):
					tilemap_set(water1,1,across,ddown);
				break;
				case("Full Up Left"):
					tilemap_set(water1,10,across,ddown);
				break;
				case("Full Up Right"):
					tilemap_set(water1,11,across,ddown);
				break;
				case("Full Down Right"):
					tilemap_set(water1,12,across,ddown);
				break;
				case("Full Down Left"):
					tilemap_set(water1,13,across,ddown);
				break;
				case("Full"):
					tilemap_set(water1,5,across,ddown);
				break;
			}
		}
		#endregion
	}
}
#endregion

#region Height Smoothing 2
for(ddown = 8; ddown < (room_height/64)-7; ddown++) {
	for(across = 8; across < (room_width/64)-7; across++) {
		ds_list_clear(vaild_tiles); index = 0; tile = 1;
		#region Base1
		tile_setup = tilemap_get(base1,across,ddown);
		if(tile_setup > 3 && tile_setup < 16) {
			repeat(3) vaild_tiles[| index++] = tile++;
			switch(tile_smooth(tile_setup,base1,base1,across,ddown,vaild_tiles)) {
				case("Down Right"):
					tilemap_set(base1,9,across,ddown);
				break;
				case("Down Left"):
					tilemap_set(base1,8,across,ddown);
				break;
				case("Up Right"):
					tilemap_set(base1,10,across,ddown);
				break;
				case("Up Left"):
					tilemap_set(base1,11,across,ddown);
				break;
				case("Down"):
					tilemap_set(base1,4,across,ddown);
				break;
				case("Right"):
					tilemap_set(base1,6,across,ddown);
				break;
				case("Up"):
					tilemap_set(base1,5,across,ddown);
				break;
				case("Left"):
					tilemap_set(base1,7,across,ddown);
				break;
				case("None Up Left"):
					tilemap_set(base1,14,across,ddown);
				break;
				case("None Up Right"):
					tilemap_set(base1,13,across,ddown);
				break;
				case("None Down Right"):
					tilemap_set(base1,12,across,ddown);
				break;
				case("None Down Left"):
					tilemap_set(base1,15,across,ddown);
				break;
			}
		}
		#endregion
	}
}
#endregion

//Searchables Reposition
ds_grid_set_grid_region(global.grid_tiling_layer0_search,global.grid_tiling_layer0_search,0,0,global.tile_width,global.tile_height,8,8);
ds_grid_set_region(global.grid_tiling_layer0_search,0,0,global.tile_width,7,0);
ds_grid_set_region(global.grid_tiling_layer0_search,0,0,7,global.tile_height,0);
ds_grid_set_grid_region(global.grid_tiling_layer1_search,global.grid_tiling_layer1_search,0,0,global.tile_width,global.tile_height,8,8);
ds_grid_set_region(global.grid_tiling_layer1_search,0,0,global.tile_width,7,0);
ds_grid_set_region(global.grid_tiling_layer1_search,0,0,7,global.tile_height,0);

ds_map_add(global.map_assignment,"p1",p1);
ds_map_add(global.map_assignment,"p2",p2);
ds_map_add(global.map_assignment,"p3",p3);
ds_map_add(global.map_assignment,"enemy1",obj_mad_man);
ds_map_add(global.map_assignment,"enemy2",obj_savage);
ds_map_add(global.map_assignment,"enemy3",obj_bandit);
//instance_create_depth(500,500,-50,obj_free_cam);
if(instance_exists(obj_free_cam)) {
	obj_display_manager.follow = obj_free_cam;
}
else {
	obj_display_manager.follow = p1;
}

alarm[0] = 10;