//Clean-Up
global.current_menu = "ingame";

//Room Set-Up
global.tile_width = ds_grid_width(global.grid_tiling_layer0);
global.tile_height = ds_grid_height(global.grid_tiling_layer0);
//room_width = global.tile_width*64;
//room_height = global.tile_height*64;

//Turn Order
global.map_assignment = ds_map_create();
global.list_turn_order = ds_list_create();
global.grid_turn_actions = ds_grid_create(5,1);
global.total_actions = 0;

//Global Vars
global.paused = false;
enum s_inventory { 
	width = 6,
	height = 24,
	slot_id = 0,
	slot_sum = 1,
	slot_cap = 2,
	slot_spr = 3
}
enum actions {
	skip,
	move = 1,
	attack = 3,
	search = 5,
	pick_item = 6
}
enum ai_state {
	idle,
	wander,
	alert,
	attack
}

//Temp vars
var tile_setup, tile_mod = 8;

//Tiling
global.tilemap_base0 = layer_tilemap_get_id("tile_base0");
global.tilemap_water0 = layer_tilemap_get_id("tile_water0");
global.tilemap_road0 = layer_tilemap_get_id("tile_road0");
global.tilemap_sand0 = layer_tilemap_get_id("tile_sand0");
global.tilemap_search0 = layer_tilemap_get_id("tile_search0");
global.tilemap_ruin0 = layer_tilemap_get_id("tile_ruin0");
global.tilemap_base1 = layer_tilemap_get_id("tile_base1");
global.tilemap_water1 = layer_tilemap_get_id("tile_water1");
global.tilemap_road1 = layer_tilemap_get_id("tile_road1");
global.tilemap_sand1 = layer_tilemap_get_id("tile_sand1");
global.tilemap_search1 = layer_tilemap_get_id("tile_search1");
global.tilemap_ruin1 = layer_tilemap_get_id("tile_ruin1");
global.tilemap_base2 = layer_tilemap_get_id("tile_base2");
global.tilemap_collision0 = layer_tilemap_get_id("tile_collision0");
global.tilemap_collision1 = layer_tilemap_get_id("tile_collision1");
//var layer_vis = layer_create(-300);
//global.tilemap_visiblity = layer_tilemap_create(layer_vis,0,0,tile_vis,room_width,room_height);

var base0 = global.tilemap_base0;
var water0 = global.tilemap_water0;
var road0 = global.tilemap_road0;
var sand0 = global.tilemap_sand0;
var search0 = global.tilemap_search0;
var ruin0 = global.tilemap_ruin0;
var base1 = global.tilemap_base1;
var water1 = global.tilemap_water1;
var road1 = global.tilemap_road1;
var sand1 = global.tilemap_sand1;
var search1 = global.tilemap_search1;
var ruin1 = global.tilemap_ruin1;
var base2 = global.tilemap_base2;
var collision0 = global.tilemap_collision0;
var collision1 = global.tilemap_collision1;
//var smoothing = 0;

#region World Create
var item_n, item_stats;
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
			switch(tile_setup) {
				case(1):
				case(2):
					tilemap_set(collision0,1,across+tile_mod,ddown+tile_mod);
					item_n = choose(0,"item1","item2","item3","item4");
				break;
				case(3):
					item_n = choose(0,"item1","item2","item3","item4");
					if(item_n != 0) tilemap_set(collision0,5,across+tile_mod,ddown+tile_mod);
					else tilemap_set(collision0,2,across+tile_mod,ddown+tile_mod);
				break;
				case(4):
					tilemap_set(collision0,5,across+tile_mod,ddown+tile_mod);
					switch(irandom(1)) {
						case(0):
							//item_n = inv_item_create("Wood Shield","Shield",spr_item_shield,"Good for blocking.",0,0,0,0,irandom_range(3,5),0,0,0,0,0);
							item_n = inv_item_create("Wood Shield","Shield",spr_item_shield,"Good for blocking.",1,2,0,0,1,2,0,0,0,0,0);
							break;
						case(1):
							//item_n = inv_item_create("Bow","Weapon",spr_item_bow1,"Ranger's Choice.",1,0,0,1,1,-1,1,0,irandom_range(1,2),0,-1);
							item_n = inv_item_create("Bow","Weapon",spr_item_bow1,"Ranger's Choice.",1,0,0,2,2,1,2,0,2,0,1);
							break;
					}
				break;
			}
			tilemap_set(search0,tile_setup,across+tile_mod,ddown+tile_mod);
			ds_grid_set(global.grid_tiling_layer0_search,across,ddown,item_n);
			/*tile_setup = tilemap_get(search0,across+tile_mod,ddown+tile_mod);
			switch(tile_setup) {
				case(1):
				case(2):
					item_n = choose(0,"item1","item2","item3","item4");
				break;
				case(3):
					item_n = choose(0,"item1","item2","item3","item4");
				break;
				case(4):
					switch(irandom(1)) {
						case(0):
							item_n = inv_item_create("Wood Shield","Shield",spr_item_shield,"Good for blocking.",0,0,0,0,irandom_range(3,5),0,0,0,0,0);
							break;
						case(1):
							item_n = inv_item_create("Bow","Weapon",spr_item_bow1,"Ranger's Choice.",0,0,1,1,-1,1,0,irandom_range(1,2),0,-1);
							break;
					}
				break;
			}*/
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
			switch(tile_setup) {
				case(1):
				case(2):
					tilemap_set(collision1,1,across+tile_mod,ddown+tile_mod);
					item_n = choose(0,"item1","item2","item3","item4");
				break;
				case(3):
					item_n = choose(0,"item1","item2","item3","item4");
					if(item_n != 0) tilemap_set(collision1,5,across+tile_mod,ddown+tile_mod);
					else tilemap_set(collision1,2,across+tile_mod,ddown+tile_mod);
				break;
				case(4):
					tilemap_set(collision1,5,across+tile_mod,ddown+tile_mod);
					switch(irandom(1)) {
						case(0):
							item_n = inv_item_create("Wood Shield","Shield",spr_item_shield,"Good for blocking.",0,0,0,0,irandom_range(3,5),0,0,0,0,0);
							break;
						case(1):
							item_n = inv_item_create("Bow","Weapon",spr_item_bow1,"Ranger's Choice.",0,0,1,1,-1,1,0,irandom_range(1,2),0,-1);
							break;
					}
				break;
			}
			tilemap_set(search1,tile_setup,across+tile_mod,ddown+tile_mod);
			ds_grid_set(global.grid_tiling_layer1_search,across,ddown,item_n);
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
		}
		#endregion
		
		#region Layer 2
		tile_setup = ds_grid_get(global.grid_tiling_layer2,across,ddown);
		tilemap_set(base2,tile_setup,across+tile_mod,ddown+tile_mod);
		if(tile_setup > 3)
		{
			if(tile_setup == 5 || tile_setup == 10 || tile_setup == 11)
			{
				tilemap_set(collision1,2,across+tile_mod,ddown+tile_mod);
			}
		}
		else if(tile_setup > 0)
		{
			tilemap_set(collision1,2,across+tile_mod,ddown+tile_mod);
		}
		#endregion
		
		//Visiblity
		//tilemap_set(global.tilemap_visiblity,1,across+tile_mod,ddown+tile_mod);
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

ds_map_add(global.map_assignment,"p1",global.grid_players[# 0,0]);
ds_map_add(global.map_assignment,"p2",global.grid_players[# 0,1]);
ds_map_add(global.map_assignment,"p3",global.grid_players[# 0,2]);
ds_map_add(global.map_assignment,"enemy1",obj_mad_man);
ds_map_add(global.map_assignment,"enemy2",obj_savage);
ds_map_add(global.map_assignment,"enemy3",obj_bandit);
//instance_create_depth(500,500,-50,obj_free_cam);
if(instance_exists(obj_free_cam)) {
	obj_display_manager.follow = obj_free_cam;
}
else {
	obj_display_manager.follow = global.grid_players[# 0,0];
}

alarm[0] = 10;