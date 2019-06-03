/// @param world_n,list_chunks_large,list_chunks_medium,list_chunks_small
var world_n = argument0;
var list_chunks_large = argument1;
var list_chunks_medium = argument2;
var list_chunks_small = argument3;
var world_width = 41;
var world_height = 41;

global.grid_tiling_layer0 = ds_grid_create(world_width,world_height);
global.grid_tiling_layer0_water = ds_grid_create(world_width,world_height);
global.grid_tiling_layer0_road = ds_grid_create(world_width,world_height);
global.grid_tiling_layer0_sand = ds_grid_create(world_width,world_height);
global.grid_tiling_layer0_search = ds_grid_create(world_width+16,world_height+16);
global.grid_tiling_layer0_ruin = ds_grid_create(world_width,world_height);
global.grid_tiling_layer0_enemy_spawn = ds_grid_create(world_width,world_height);
global.grid_tiling_layer1 = ds_grid_create(world_width,world_height);
global.grid_tiling_layer1_water = ds_grid_create(world_width,world_height);
global.grid_tiling_layer1_road = ds_grid_create(world_width,world_height);
global.grid_tiling_layer1_sand = ds_grid_create(world_width,world_height);
global.grid_tiling_layer1_search = ds_grid_create(world_width+16,world_height+16);
global.grid_tiling_layer1_ruin = ds_grid_create(world_width,world_height);
global.grid_tiling_layer1_enemy_spawn = ds_grid_create(world_width,world_height);
global.grid_tiling_layer_enemy_path = ds_grid_create(world_width+16,world_height+16);
global.grid_trees_layer0 = ds_grid_create(world_width,world_height);
global.grid_trees_layer1 = ds_grid_create(world_width,world_height);
global.grid_tiling_layer2 = ds_grid_create(world_width,world_height);

var search0 = global.grid_tiling_layer0_search;
var search1 = global.grid_tiling_layer1_search;
var enemy_path = global.grid_tiling_layer_enemy_path;
var enemy0 = global.grid_tiling_layer0_enemy_spawn;
var enemy1 = global.grid_tiling_layer1_enemy_spawn;
var xx = 0, yy = 0, n = 0;
var frame = rm_game_test;
var index = 0;
var enter_point = irandom(1);
var p1 = global.grid_players[# 0,0];
var p2 = global.grid_players[# 0,1];
var p3 = global.grid_players[# 0,2];

switch(world_n) {
	case("test"):
		frame = rm_game_test;
		#region Chunks
		//Small Chunks
		chunk_create(8,2,2,2);
		chunk_create(8,irandom(2),15,14);
		
		//Medium Chunks
		chunk_create(10,1,13,1);
		
		//Large Chunks
		chunk_create(12,0,1,12);
		#endregion
		
		#region Enemy Spawn/Path
		//Character Spawn
		ds_grid_set(enemy0,12,11,p1);
		ds_grid_set(enemy0,12,10,p2);
		ds_grid_set(enemy0,12,12,p3);
		
		xx = 14; yy = 13; n = 1;
		ds_grid_set(enemy0,xx,yy,obj_mad_man);
		repeat(8) {
			ds_grid_set(enemy_path,xx,yy++,n++);
		}
		ds_grid_set(enemy_path,xx,yy,n); //Path End
		xx = 15; yy = 13; n = 1;
		ds_grid_set(enemy0,xx,yy,obj_mad_man);
		repeat(8) {
			ds_grid_set(enemy_path,xx++,yy,n++);
		}
		ds_grid_set(enemy_path,xx,yy,n); //Path End
		#endregion
		
	break;
	case(0):
		frame = rm_game_0;
		#region Chunks
		//Small Chunks
		chunk_create(8,list_chunks_small[| index++],4,1);
		chunk_create(8,list_chunks_small[| index++],3,10);
		chunk_create(8,list_chunks_small[| index++],11,20);
		chunk_create(8,list_chunks_small[| index++],1,32);
		chunk_create(8,list_chunks_small[| index++],32,29);
		index = 0;
		//Medium Chunks
		chunk_create(10,list_chunks_medium[| index++],1,19);
		chunk_create(10,list_chunks_medium[| index++],9,30);
		chunk_create(10,list_chunks_medium[| index++],22,29);
		index = 0;
		//Large Chunks
		chunk_create(12,list_chunks_large[| index++],12,4);
		chunk_create(12,list_chunks_large[| index++],27,1);
		chunk_create(12,list_chunks_large[| index++],26,17);
		#endregion
		
		#region Enemy Spawn/Path
		if(enter_point == 1) {	
			ds_grid_set(enemy0,40,13,p1);
			ds_grid_set(enemy0,40,14,p2);
			ds_grid_set(enemy0,40,12,p3);
		}
		else {
			ds_grid_set(enemy0,0,29,p1);
			ds_grid_set(enemy0,0,28,p2);
			ds_grid_set(enemy0,0,27,p3);
		}
		
		xx = 19; yy = 3; n = 1;
		ds_grid_set(enemy0,xx,yy,obj_bandit);
		repeat(3) {
			ds_grid_set(enemy_path,xx--,yy,n++);
		}
		ds_grid_set(enemy_path,xx,yy,n); //Path End
		xx = 30; yy = 0; n = 1;
		ds_grid_set(enemy0,xx,yy,obj_mad_man);
		repeat(4) {
			ds_grid_set(enemy_path,xx--,yy,n++);
		}
		ds_grid_set(enemy_path,xx,yy++,n++);
		ds_grid_set(enemy_path,xx,yy,n); //Path End
		xx = 2; yy = 6; n = 1;
		ds_grid_set(enemy0,xx,yy,obj_savage);
		repeat(2) {
			ds_grid_set(enemy_path,xx,yy++,n++);
		}
		ds_grid_set(enemy_path,xx++,yy,n++);
		ds_grid_set(enemy_path,xx,yy++,n++);
		repeat(8) {
			ds_grid_set(enemy_path,xx++,yy,n++);
		}
		repeat(5) {
			ds_grid_set(enemy_path,xx,yy++,n++);
		}
		ds_grid_set(enemy_path,xx,yy,n); //Path End
		xx = 0; yy = 16; n = 1;
		ds_grid_set(enemy0,xx,yy,1);
		ds_grid_set(enemy_path,xx,yy++,n++);
		repeat(2) {
			ds_grid_set(enemy_path,xx++,yy,n++);
		}
		ds_grid_set(enemy_path,xx,yy++,n++);
		ds_grid_set(enemy_path,xx,yy,n); //Path End
		xx = 18; yy = 18; n = 1;
		ds_grid_set(enemy0,xx,yy,obj_bandit);
		ds_grid_set(enemy_path,xx,yy++,n++);
		repeat(2) {
			ds_grid_set(enemy_path,xx--,yy,n++);
		}
		repeat(2) {
			ds_grid_set(enemy_path,xx,yy--,n++);
		}
		ds_grid_set(enemy_path,xx++,yy,n++);
		ds_grid_set(enemy_path,xx,yy,n); //Path End
		xx = 27; yy = 13; n = 1;
		ds_grid_set(enemy0,xx,yy,obj_bandit);
		ds_grid_set(enemy_path,xx--,yy,n++);
		repeat(2) {
			ds_grid_set(enemy_path,xx,yy++,n++);
		}
		ds_grid_set(enemy_path,xx,yy,n); //Path End
		xx = 28; yy = 15; n = 1;
		ds_grid_set(enemy0,xx,yy,obj_bandit);
		ds_grid_set(enemy_path,xx,yy++,n++);
		repeat(2) {
			ds_grid_set(enemy_path,xx++,yy,n++);
		}
		ds_grid_set(enemy_path,xx,yy,n); //Path End
		xx = 39; yy = 18; n = 1;
		ds_grid_set(enemy0,xx,yy,obj_mad_man);
		ds_grid_set(enemy_path,xx,yy++,n++);
		ds_grid_set(enemy_path,xx--,yy,n++);
		repeat(3) {
			ds_grid_set(enemy_path,xx,yy++,n++);
		}
		ds_grid_set(enemy_path,xx,yy,n); //Path End
		xx = 22; yy = 20; n = 1;
		ds_grid_set(enemy0,xx,yy,obj_savage);
		repeat(3) {
			ds_grid_set(enemy_path,xx,yy++,n++);
		}
		ds_grid_set(enemy_path,xx++,yy,n++);
		repeat(2) {
			ds_grid_set(enemy_path,xx,yy++,n++);
		}
		ds_grid_set(enemy_path,xx,yy,n); //Path End
		xx = 1; yy = 30; n = 1;
		ds_grid_set(enemy0,xx,yy,obj_savage);
		ds_grid_set(enemy_path,xx,yy--,n++);
		repeat(5) {
			ds_grid_set(enemy_path,xx++,yy,n++);
		}
		ds_grid_set(enemy_path,xx,yy,n); //Path End
		xx = 8; yy = 30; n = 1;
		ds_grid_set(enemy0,xx,yy,obj_savage);
		ds_grid_set(enemy_path,xx,yy++,n++);
		repeat(5) {
			ds_grid_set(enemy_path,xx--,yy,n++);
		}
		ds_grid_set(enemy_path,xx,yy,n); //Path End
		xx = 18; yy = 28; n = 1;
		ds_grid_set(enemy0,xx,yy,obj_mad_man);
		repeat(3) {
			ds_grid_set(enemy_path,xx++,yy,n++);
		}
		ds_grid_set(enemy_path,xx,yy,n); //Path End
		xx = 35; yy = 37; n = 1;
		ds_grid_set(enemy0,xx,yy,obj_mad_man);
		repeat(2) {
			ds_grid_set(enemy_path,xx--,yy,n++);
		}
		repeat(2) {
			ds_grid_set(enemy_path,xx,yy++,n++);
		}
		repeat(2) {
			ds_grid_set(enemy_path,xx++,yy,n++);
		}
		ds_grid_set(enemy_path,xx,yy--,n++);
		ds_grid_set(enemy_path,xx,yy,n); //Path End
		#endregion
		
	break;
	case(1):
		frame = rm_game_1;
		#region Chunks
		//Small Chunks
		chunk_create(8,list_chunks_small[| index++],15,3);
		chunk_create(8,list_chunks_small[| index++],8,13);
		chunk_create(8,list_chunks_small[| index++],6,22);
		chunk_create(8,list_chunks_small[| index++],20,16);
		index = 0;
		//Medium Chunks
		chunk_create(10,list_chunks_medium[| index++],31,16);
		chunk_create(10,list_chunks_medium[| index++],1,31);
		chunk_create(10,list_chunks_medium[| index++],28,29);
		index = 0;
		//Large Chunks
		chunk_create(12,list_chunks_large[| index++],3,1);
		chunk_create(12,list_chunks_large[| index++],29,2);
		chunk_create(12,list_chunks_large[| index++],15,29);
		#endregion
		
		#region Enemy Spawn/Path
		if(enter_point == 1) {
			ds_grid_set(enemy0,0,4,p1);
			ds_grid_set(enemy0,0,5,p2);
			ds_grid_set(enemy0,0,3,p3);
		}
		else {
			ds_grid_set(enemy0,33,40,p1);
			ds_grid_set(enemy0,32,40,p2);
			ds_grid_set(enemy0,34,40,p3);
		}
		
		/*xx = 19; yy = 3; n = 1;
		ds_grid_set(enemy0,xx,yy,3);
		repeat(3) {
			ds_grid_set(enemy_path,xx--,yy,n++);
		}
		ds_grid_set(enemy_path,xx,yy,n); //Path End
		xx = 30; yy = 0; n = 1;
		ds_grid_set(enemy0,xx,yy,1);
		repeat(4) {
			ds_grid_set(enemy_path,xx--,yy,n++);
		}
		ds_grid_set(enemy_path,xx,yy++,n++);
		ds_grid_set(enemy_path,xx,yy,n); //Path End
		xx = 2; yy = 6; n = 1;
		ds_grid_set(enemy0,xx,yy,2);
		repeat(2) {
			ds_grid_set(enemy_path,xx,yy++,n++);
		}
		ds_grid_set(enemy_path,xx++,yy,n++);
		ds_grid_set(enemy_path,xx,yy++,n++);
		repeat(8) {
			ds_grid_set(enemy_path,xx++,yy,n++);
		}
		repeat(5) {
			ds_grid_set(enemy_path,xx,yy++,n++);
		}
		ds_grid_set(enemy_path,xx,yy,n); //Path End
		xx = 0; yy = 16; n = 1;
		ds_grid_set(enemy0,xx,yy,1);
		ds_grid_set(enemy_path,xx,yy++,n++);
		repeat(2) {
			ds_grid_set(enemy_path,xx++,yy,n++);
		}
		ds_grid_set(enemy_path,xx,yy++,n++);
		ds_grid_set(enemy_path,xx,yy,n); //Path End
		xx = 18; yy = 18; n = 1;
		ds_grid_set(enemy0,xx,yy,3);
		ds_grid_set(enemy_path,xx,yy++,n++);
		repeat(2) {
			ds_grid_set(enemy_path,xx--,yy,n++);
		}
		repeat(2) {
			ds_grid_set(enemy_path,xx,yy--,n++);
		}
		ds_grid_set(enemy_path,xx++,yy,n++);
		ds_grid_set(enemy_path,xx,yy,n); //Path End
		xx = 27; yy = 13; n = 1;
		ds_grid_set(enemy0,xx,yy,3);
		ds_grid_set(enemy_path,xx--,yy,n++);
		repeat(2) {
			ds_grid_set(enemy_path,xx,yy++,n++);
		}
		ds_grid_set(enemy_path,xx,yy,n); //Path End
		xx = 28; yy = 15; n = 1;
		ds_grid_set(enemy0,xx,yy,3);
		ds_grid_set(enemy_path,xx,yy++,n++);
		repeat(2) {
			ds_grid_set(enemy_path,xx++,yy,n++);
		}
		ds_grid_set(enemy_path,xx,yy,n); //Path End
		xx = 39; yy = 18; n = 1;
		ds_grid_set(enemy0,xx,yy,1);
		ds_grid_set(enemy_path,xx,yy++,n++);
		ds_grid_set(enemy_path,xx--,yy,n++);
		repeat(3) {
			ds_grid_set(enemy_path,xx,yy++,n++);
		}
		ds_grid_set(enemy_path,xx,yy,n); //Path End
		xx = 22; yy = 20; n = 1;
		ds_grid_set(enemy0,xx,yy,2);
		repeat(3) {
			ds_grid_set(enemy_path,xx,yy++,n++);
		}
		ds_grid_set(enemy_path,xx++,yy,n++);
		repeat(2) {
			ds_grid_set(enemy_path,xx,yy++,n++);
		}
		ds_grid_set(enemy_path,xx,yy,n); //Path End
		xx = 1; yy = 30; n = 1;
		ds_grid_set(enemy0,xx,yy,2);
		ds_grid_set(enemy_path,xx,yy--,n++);
		repeat(5) {
			ds_grid_set(enemy_path,xx++,yy,n++);
		}
		ds_grid_set(enemy_path,xx,yy,n); //Path End
		xx = 8; yy = 30; n = 1;
		ds_grid_set(enemy0,xx,yy,2);
		ds_grid_set(enemy_path,xx,yy++,n++);
		repeat(5) {
			ds_grid_set(enemy_path,xx--,yy,n++);
		}
		ds_grid_set(enemy_path,xx,yy,n); //Path End
		xx = 18; yy = 28; n = 1;
		ds_grid_set(enemy0,xx,yy,1);
		repeat(3) {
			ds_grid_set(enemy_path,xx++,yy,n++);
		}
		ds_grid_set(enemy_path,xx,yy,n); //Path End
		xx = 35; yy = 37; n = 1;
		ds_grid_set(enemy0,xx,yy,1);
		repeat(2) {
			ds_grid_set(enemy_path,xx--,yy,n++);
		}
		repeat(2) {
			ds_grid_set(enemy_path,xx,yy++,n++);
		}
		repeat(2) {
			ds_grid_set(enemy_path,xx++,yy,n++);
		}
		ds_grid_set(enemy_path,xx,yy--,n++);
		ds_grid_set(enemy_path,xx,yy,n); //Path End*/
		#endregion
		
	break;
}

ds_grid_set_grid_region(enemy_path,enemy_path,0,0,world_width,world_height,8,8);
ds_grid_set_region(enemy_path,0,0,world_width,7,0);
ds_grid_set_region(enemy_path,0,0,7,world_height,0);

return frame;