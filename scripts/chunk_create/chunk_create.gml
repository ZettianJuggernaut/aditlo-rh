/// @param size,chunk,x1,y1

var size = argument0,
chunk = argument1,
x1 = argument2,
y1 = argument3,;

var base0 = global.grid_tiling_layer0;
var water0 = global.grid_tiling_layer0_water;
var road0 = global.grid_tiling_layer0_road;
var search0 = global.grid_tiling_layer0_search;
var enemy0 = global.grid_tiling_layer0_enemy_spawn;
var base1 = global.grid_tiling_layer1;
var water1 = global.grid_tiling_layer1_water;
var road1 = global.grid_tiling_layer1_road;
var search1 = global.grid_tiling_layer1_search;
var enemy1 = global.grid_tiling_layer1_enemy_spawn;
var enemy_path = global.grid_tiling_layer_enemy_path;
var tree0 = global.grid_trees_layer0;
var tree1 = global.grid_trees_layer1;

var xx = 0, yy = 0, n = 0;

switch(size) {
	case(8): //Smalls
		switch(chunk) {
			case(0):
				#region Small 1
				//Water
				ds_grid_set_region(water0,x1,y1,x1+3,y1+1,1);
				ds_grid_set_region(water0,x1+1,y1+1,x1+5,y1+3,1);
				ds_grid_set_region(water0,x1+5,y1+2,x1+6,y1+6,1);
				ds_grid_set_region(water0,x1+4,y1+5,x1+4,y1+6,1);

				//Road
				ds_grid_set(road0,x1+5,y1+4,18);
				ds_grid_set(road0,x1+6,y1+4,19);

				//Search
				ds_grid_set_region(search0,x1+2,y1+4,x1+2,y1+6,1);
				ds_grid_set_region(search0,x1+1,y1+5,x1+1,y1+7,1);
				ds_grid_set(search0,x1+6,y1,1);

				//Tree
				ds_grid_set(tree0,x1,y1+3,1);
				ds_grid_set(tree0,x1,y1+5,1);
				ds_grid_set(tree0,x1+2,y1+4,1);
				ds_grid_set(tree0,x1+3,y1+3,1);
				ds_grid_set(tree0,x1+6,y1-1,1);
				ds_grid_set(tree0,x1+6,y1+5,1);
				
				//Enemy
				xx = x1+7; yy = y1+4; n = 1;
				ds_grid_set(enemy0,xx,yy,obj_mad_man);
				ds_grid_set(enemy_path,xx--,yy,n++);
				ds_grid_set(enemy_path,xx--,yy,n++);
				ds_grid_set(enemy_path,xx--,yy,n++);
				ds_grid_set(enemy_path,xx,yy,n); //Path End
				#endregion
			break;
			case(1):
				#region Small 2
				//Water
				ds_grid_set_region(water0,x1+1,y1+1,x1+2,y1+3,1);

				//Road
				ds_grid_set_region(road0,x1,y1,x1,y1+4,1);
				ds_grid_set_region(road0,x1,y1+4,x1+3,y1+4,1);
				ds_grid_set_region(road0,x1+3,y1+3,x1+5,y1+3,1);
				ds_grid_set_region(road0,x1+5,y1+4,x1+7,y1+4,1);
				ds_grid_set_region(road0,x1+7,y1+5,x1+7,y1+7,1);

				//Search
				ds_grid_set(search0,x1+5,y1+2,3);

				//Tree
				ds_grid_set(tree0,x1,y1+5,1);
				ds_grid_set(tree0,x1+2,y1+3,1);
				ds_grid_set(tree0,x1+3,y1,1);
				ds_grid_set(tree0,x1+6,y1+1,1);
				
				//Height
				ds_grid_set_region(base1,x1+1,y1+5,x1+6,y1+7,1);
				ds_grid_set_region(base1,x1+3,y1+4,x1+5,y1+4,1);
				
				//Enemy
				xx = x1+7; yy = y1+6; n = 1;
				ds_grid_set(enemy0,xx,yy,obj_bandit);
				ds_grid_set(enemy_path,xx,yy--,n++);
				ds_grid_set(enemy_path,xx,yy--,n++);
				ds_grid_set(enemy_path,xx--,yy,n++);
				ds_grid_set(enemy_path,xx--,yy,n++);
				ds_grid_set(enemy_path,xx,yy--,n++);
				ds_grid_set(enemy_path,xx--,yy,n++);
				ds_grid_set(enemy_path,xx--,yy,n++);
				ds_grid_set(enemy_path,xx,yy++,n++);
				ds_grid_set(enemy_path,xx--,yy,n++);
				ds_grid_set(enemy_path,xx--,yy,n++);
				ds_grid_set(enemy_path,xx--,yy,n++);
				ds_grid_set(enemy_path,xx,yy--,n++);
				ds_grid_set(enemy_path,xx,yy--,n++);
				ds_grid_set(enemy_path,xx,yy,n); //Path End
				#endregion
			break;
			case(2):
				#region Small 3
				//Water
				ds_grid_set_region(water0,x1+3,y1+6,x1+4,y1+7,1);

				//Road
				ds_grid_set_region(road0,x1,y1,x1+7,y1,1);

				//Search
				ds_grid_set(search0,x1,y1+2,2);
				ds_grid_set_region(search0,x1+7,y1+2,x1+7,y1+3,2);
				ds_grid_set(search0,x1+3,y1+3,4);
				ds_grid_set(search0,x1+3,y1+5,2);
				ds_grid_set_region(search0,x1+7,y1+5,x1+7,y1+6,1);
				ds_grid_set_region(search0,x1+5,y1+6,x1+5,y1+7,1);

				//Tree
				ds_grid_set(tree0,x1+1,y1+5,1);
				ds_grid_set(tree1,x1,y1+2,1);
				ds_grid_set(tree1,x1+5,y1+1,1);
				
				//Height
				ds_grid_set_region(base1,x1-1,y1+6,x1+1,y1+6,1);
				ds_grid_set_region(base1,x1-1,y1+2,x1+2,y1+5,1);
				ds_grid_set_region(base1,x1,y1,x1+7,y1+2,1);
				ds_grid_set_region(base1,x1+4,y1+3,x1+7,y1+4,1);
				ds_grid_set_region(base1,x1+5,y1+5,x1+7,y1+6,1);
				#endregion
			break;
			case(3):
				#region Small 4
				//Search
				ds_grid_set_region(search1,x1+4,y1+4,x1+5,y1+4,3);

				//Tree
				ds_grid_set(tree0,x1+3,y1-1,1);
				ds_grid_set(tree1,x1+5,y1+1,1);
				ds_grid_set(tree1,x1+3,y1+2,1);
				ds_grid_set(tree1,x1+2,y1+4,1);
				ds_grid_set(tree0,x1+5,y1+5,1);
				
				//Height
				ds_grid_set_region(base1,x1,y1,x1+3,y1+7,1);
				ds_grid_set_region(base1,x1+4,y1+1,x1+5,y1+7,1);
				ds_grid_set_region(base1,x1+5,y1,x1+7,y1+6,1);
				ds_grid_set(base1,x1,y1+2,21);
				ds_grid_set(base1,x1,y1+3,17);
				ds_grid_set(base1,x1,y1+4,20);
				
				//Enemy
				xx = x1+5; yy = y1+2; n = 1;
				ds_grid_set(enemy1,xx,yy,obj_savage);
				ds_grid_set(enemy_path,xx,yy++,n++);
				ds_grid_set(enemy_path,xx++,yy,n++);
				ds_grid_set(enemy_path,xx,yy++,n++);
				ds_grid_set(enemy_path,xx,yy++,n++);
				ds_grid_set(enemy_path,xx--,yy,n++);
				ds_grid_set(enemy_path,xx--,yy,n++);
				ds_grid_set(enemy_path,xx,yy++,n++);
				ds_grid_set(enemy_path,xx,yy++,n++);
				ds_grid_set(enemy_path,xx--,yy,n++);
				ds_grid_set(enemy_path,xx--,yy,n++);
				ds_grid_set(enemy_path,xx,yy++,n++);
				ds_grid_set(enemy_path,xx--,yy,n++);
				ds_grid_set(enemy_path,xx,yy,n); //Path End
				xx = x1+2; yy = y1+6; n = 1;
				ds_grid_set(enemy1,xx,yy,obj_savage);
				ds_grid_set(enemy_path,xx,yy--,n++);
				ds_grid_set(enemy_path,xx,yy--,n++);
				ds_grid_set(enemy_path,xx--,yy,n++);
				ds_grid_set(enemy_path,xx,yy--,n++);
				ds_grid_set(enemy_path,xx,yy--,n++);
				repeat(3) ds_grid_set(enemy_path,xx++,yy,n++);
				ds_grid_set(enemy_path,xx,yy,n); //Path End
				#endregion
			break;
			case(4):
				#region Small 5
				//Road
				ds_grid_set_region(road0,x1,y1+3,x1+2,y1+3,1);
				ds_grid_set_region(road0,x1+2,y1+4,x1+5,y1+4,1);
				
				//Search
				ds_grid_set(search0,x1+1,y1,2);
				ds_grid_set_region(search0,x1+2,y1,x1+2,y1+2,2);
				ds_grid_set_region(search0,x1+6,y1+2,x1+6,y1+3,2);
				ds_grid_set(search0,x1+7,y1+2,2);
				ds_grid_set_region(search0,x1+6,y1+6,x1+6,y1+7,2);
				ds_grid_set(search0,x1+3,y1+6,3);

				//Tree
				ds_grid_set(tree0,x1,y1,1);
				ds_grid_set(tree0,x1+2,y1-1,1);
				ds_grid_set(tree0,x1+3,y1+1,1);
				ds_grid_set(tree0,x1+4,y1,1);
				ds_grid_set(tree0,x1+6,y1-1,1);
				ds_grid_set(tree0,x1+6,y1+2,1);
				ds_grid_set(tree0,x1+1,y1+3,1);
				ds_grid_set(tree0,x1+5,y1+4,1);
				ds_grid_set(tree0,x1,y1+5,1);
				ds_grid_set(tree0,x1+4,y1+5,1);
				
				//Enemy
				xx = x1+7; yy = y1; n = 1;
				ds_grid_set(enemy0,xx,yy,obj_bandit);
				repeat(2) ds_grid_set(enemy_path,xx--,yy,n++);
				ds_grid_set(enemy_path,xx,yy++,n++);
				ds_grid_set(enemy_path,xx--,yy,n++);
				repeat(2) ds_grid_set(enemy_path,xx,yy++,n++);
				ds_grid_set(enemy_path,xx,yy,n); //Path End
				xx = x1+4; yy = y1+5; n = 1;
				ds_grid_set(enemy0,xx,yy,obj_savage);
				repeat(2) ds_grid_set(enemy_path,xx,yy++,n++);
				repeat(2) ds_grid_set(enemy_path,xx--,yy,n++);
				repeat(2) ds_grid_set(enemy_path,xx,yy--,n++);
				ds_grid_set(enemy_path,xx++,yy,n++);
				ds_grid_set(enemy_path,xx,yy,n); //Path End
				#endregion
			break;
		}
	break;
	case(10): //Mediums
		switch(chunk) {
			case(0):
				#region Medium 1
				//Water
				ds_grid_set_region(water0,x1+2,y1+1,x1+3,y1+4,1);
				ds_grid_set_region(water0,x1+1,y1+3,x1+2,y1+8,1);
				ds_grid_set_region(water0,x1+3,y1+7,x1+6,y1+8,1);
				ds_grid_set_region(water0,x1+5,y1+2,x1+8,y1+6,1);
				ds_grid_set_region(water0,x1+6,y1+1,x1+7,y1+1,1);
				ds_grid_set_region(water0,x1+4,y1+3,x1+4,y1+4,1);

				//Road
				ds_grid_set(road0,x1+4,y1+3,16);
				ds_grid_set(road0,x1+4,y1+4,17);

				//Search
				ds_grid_set_region(search0,x1,y1+6,x1,y1+8,2);
				ds_grid_set_region(search0,x1+5,y1+9,x1+6,y1+9,2);
				ds_grid_set_region(search0,x1+7,y1+8,x1+9,y1+8,2);
				ds_grid_set(search0,x1+8,y1+7,2);
				ds_grid_set(search0,x1+9,y1+9,2);
				ds_grid_set(search0,x1+6,y1,2);
				ds_grid_set(search0,x1+5,y1+1,2);

				//Tree
				ds_grid_set(tree0,x1,y1,1);
				ds_grid_set(tree0,x1+3,y1+4,1);
				ds_grid_set(tree0,x1+8,y1-1,1);
				ds_grid_set(tree0,x1+8,y1+5,1);
				ds_grid_set(tree0,x1+7,y1+7,1);
				
				//Enemy
				xx = x1+3; yy = y1+5; n = 1;
				ds_grid_set(enemy0,xx,yy,obj_mad_man);
				ds_grid_set(enemy_path,xx,yy++,n++);
				ds_grid_set(enemy_path,xx++,yy,n++);
				ds_grid_set(enemy_path,xx,yy--,n++);
				ds_grid_set(enemy_path,xx,yy,n); //Path End
				#endregion
			break;
			case(1):
				#region Medium 2
				//Water
				ds_grid_set_region(water0,x1+2,y1,x1+3,y1+2,1);
				ds_grid_set_region(water0,x1+1,y1+1,x1+1,y1+2,1);

				//Road
				ds_grid_set_region(road0,x1+7,y1,x1+7,y1+2,1);
				ds_grid_set_region(road0,x1+5,y1+2,x1+6,y1+2,1);
				ds_grid_set_region(road0,x1+1,y1+3,x1+5,y1+3,1);
				ds_grid_set_region(road0,x1+1,y1+4,x1+1,y1+8,1);
				ds_grid_set_region(road0,x1+2,y1+8,x1+2,y1+9,1);
				ds_grid_set_region(road0,x1+2,y1+9,x1+6,y1+9,1);
				
				//Search
				ds_grid_set(search0,x1+1,y1,1);
				ds_grid_set_region(search0,x1,y1+4,x1,y1+6,1);
				ds_grid_set_region(search0,x1+5,y1+1,x1+6,y1+1,3);
				ds_grid_set_region(search0,x1+7,y1+8,x1+8,y1+8,1);
				ds_grid_set_region(search0,x1+8,y1+9,x1+9,y1+9,1);

				//Tree
				ds_grid_set(tree0,x1,y1+1,1);
				ds_grid_set(tree0,x1+4,y1,1);
				ds_grid_set(tree0,x1+8,y1,1);
				ds_grid_set(tree0,x1+7,y1+1,1);
				ds_grid_set(tree0,x1+1,y1+4,1);
				ds_grid_set(tree0,x1+8,y1+6,1);
				ds_grid_set(tree0,x1+6,y1+7,1);
				ds_grid_set(tree0,x1,y1+7,1);
				ds_grid_set(tree1,x1+3,y1+5,1);
				ds_grid_set(tree1,x1+5,y1+4,1);
				
				//Height
				ds_grid_set_region(base1,x1+2,y1+4,x1+6,y1+8,1);
				ds_grid_set_region(base1,x1+5,y1+3,x1+7,y1+7,1);
				ds_grid_set(base1,x1+8,y1+3,1);
				ds_grid_set(base1,x1+8,y1+7,1);
				ds_grid_set(base1,x1+8,y1+4,19);
				ds_grid_set(base1,x1+8,y1+5,16);
				ds_grid_set(base1,x1+8,y1+6,18);
				
				//Enemy
				xx = x1+4; yy = y1+2; n = 1;
				ds_grid_set(enemy0,xx,yy,obj_bandit);
				ds_grid_set(enemy_path,xx,yy--,n++);
				ds_grid_set(enemy_path,xx,yy--,n++);
				ds_grid_set(enemy_path,xx++,yy,n++);
				ds_grid_set(enemy_path,xx++,yy,n++);
				ds_grid_set(enemy_path,xx++,yy,n++);
				ds_grid_set(enemy_path,xx++,yy,n++);
				ds_grid_set(enemy_path,xx++,yy,n++);
				ds_grid_set(enemy_path,xx,yy,n); //Path End
				xx = x1+4; yy = y1+6; n = 1;
				ds_grid_set(enemy1,xx,yy,obj_mad_man);
				ds_grid_set(enemy_path,xx++,yy,n++);
				ds_grid_set(enemy_path,xx++,yy,n++);
				ds_grid_set(enemy_path,xx++,yy,n++);
				ds_grid_set(enemy_path,xx,yy--,n++);
				ds_grid_set(enemy_path,xx,yy--,n++);
				ds_grid_set(enemy_path,xx,yy--,n++);
				ds_grid_set(enemy_path,xx,yy,n); //Path End
				#endregion
			break;
			case(2):
				#region Medium 3
				//Road
				ds_grid_set_region(road0,x1,y1+2,x1+2,y1+2,1);
				ds_grid_set_region(road1,x1+3,y1+2,x1+5,y1+2,1);
				ds_grid_set_region(road1,x1+5,y1+3,x1+5,y1+4,1);
				ds_grid_set_region(road1,x1+4,y1+4,x1+4,y1+7,1);
				ds_grid_set_region(road1,x1+5,y1+7,x1+6,y1+7,1);
				ds_grid_set_region(road0,x1+7,y1+7,x1+9,y1+7,1);
				
				//Search
				ds_grid_set(search0,x1+1,y1,2);
				ds_grid_set_region(search0,x1,y1+1,x1+1,y1+1,2);
				ds_grid_set_region(search0,x1,y1+3,x1+2,y1+3,2);
				ds_grid_set_region(search0,x1+8,y1+5,x1+8,y1+6,2);
				ds_grid_set(search0,x1+9,y1+6,2);
				ds_grid_set_region(search0,x1+8,y1+8,x1+8,y1+9,2);
				ds_grid_set(search0,x1+7,y1+9,2);
				ds_grid_set(search1,x1+7,y1+3,3);
				ds_grid_set(search1,x1+5,y1+5,3);
				ds_grid_set(search1,x1+4,y1+8,3);

				//Tree
				ds_grid_set(tree0,x1+1,y1-1,1);
				ds_grid_set(tree0,x1,y1+2,1);
				ds_grid_set(tree0,x1+8,y1+3,1);
				ds_grid_set(tree0,x1,y1+5,1);
				ds_grid_set(tree0,x1+1,y1+7,1);
				ds_grid_set(tree0,x1+8,y1+7,1);
				ds_grid_set(tree1,x1+6,y1,1);
				ds_grid_set(tree1,x1+5,y1+2,1);
				ds_grid_set(tree1,x1+2,y1+5,1);
				
				//Height
				ds_grid_set_region(base1,x1+3,y1,x1+9,y1+3,1);
				ds_grid_set_region(base1,x1,y1+4,x1+8,y1+5,1);
				ds_grid_set_region(base1,x1,y1+6,x1+5,y1+6,1);
				ds_grid_set_region(base1,x1+1,y1+7,x1+5,y1+8,1);
				ds_grid_set_region(base1,x1+2,y1+9,x1+6,y1+9,1);
				ds_grid_set(base1,x1+3,y1+1,21);
				ds_grid_set(base1,x1+3,y1+2,17);
				ds_grid_set(base1,x1+3,y1+3,20);
				ds_grid_set(base1,x1+6,y1+6,19);
				ds_grid_set(base1,x1+6,y1+7,16);
				ds_grid_set(base1,x1+6,y1+8,18);
				
				//Enemy
				xx = x1+8; yy = y1+1; n = 1;
				ds_grid_set(enemy1,xx,yy,obj_bandit);
				ds_grid_set(enemy_path,xx,yy++,n++);
				repeat(2) ds_grid_set(enemy_path,xx--,yy,n++);
				ds_grid_set(enemy_path,xx,yy++,n++);
				ds_grid_set(enemy_path,xx,yy,n); //Path End
				xx = x1+3; yy = y1+8; n = 1;
				ds_grid_set(enemy1,xx,yy,obj_bandit);
				ds_grid_set(enemy_path,xx,yy--,n++);
				ds_grid_set(enemy_path,xx--,yy,n++);
				repeat(2) ds_grid_set(enemy_path,xx,yy--,n++);
				ds_grid_set(enemy_path,xx++,yy,n++);
				ds_grid_set(enemy_path,xx,yy,n); //Path End
				#endregion
			break;
		}
	break;
	case(12): //Larges
		switch(chunk) {
			case(0):
				#region Large 1
				//Water
				ds_grid_set_region(water0,x1+1,y1+2,x1+2,y1+9,1);
				ds_grid_set_region(water0,x1+2,y1+4,x1+3,y1+10,1);
				ds_grid_set_region(water0,x1+4,y1+8,x1+4,y1+10,1);
				ds_grid_set_region(water0,x1+5,y1+9,x1+6,y1+10,1);
				ds_grid_set_region(water0,x1+7,y1+7,x1+7,y1+10,1);
				ds_grid_set_region(water0,x1+8,y1+3,x1+9,y1+10,1);
				ds_grid_set_region(water0,x1+7,y1+3,x1+7,y1+4,1);
				ds_grid_set_region(water0,x1+10,y1+8,x1+10,y1+9,1);

				//Road
				ds_grid_set_region(road0,x1,y1+1,x1+9,y1+1,1);
				ds_grid_set_region(road0,x1+5,y1+2,x1+5,y1+4,1);
				ds_grid_set_region(road0,x1+6,y1+4,x1+6,y1+7,1);
				ds_grid_set(road0,x1+9,y1+2,1);
				ds_grid_set_region(road0,x1+10,y1+2,x1+10,y1+5,1);
				ds_grid_set_region(road0,x1+11,y1+5,x1+11,y1+11,1);

				//Search
				ds_grid_set_region(search0,x1,y1+2,x1,y1+4,2);
				ds_grid_set_region(search0,x1+3,y1,x1+4,y1,2);
				ds_grid_set_region(search0,x1+5,y1+7,x1+5,y1+8,2);
				ds_grid_set(search0,x1+4,y1+7,2);
				ds_grid_set_region(search0,x1+5,y1+11,x1+7,y1+11,2);
				ds_grid_set_region(search0,x1+10,y1,x1+10,y1+1,1);
				ds_grid_set_region(search0,x1+11,y1+1,x1+11,y1+2,1);
				ds_grid_set_region(search0,x1+6,y1+2,x1+7,y1+2,1);
				ds_grid_set_region(search0,x1,y1+11,x1+3,y1+11,1);
				ds_grid_set(search0,x1,y1+10,1);

				//Tree
				ds_grid_set(tree0,x1+2,y1-1,1);
				ds_grid_set(tree0,x1+3,y1+1,1);
				ds_grid_set(tree0,x1+6,y1+1,1);
				ds_grid_set(tree0,x1+10,y1,1);
				ds_grid_set(tree0,x1+4,y1+3,1);
				ds_grid_set(tree0,x1+6,y1+4,1);
				ds_grid_set(tree0,x1+4,y1+5,1);
				ds_grid_set(tree0,x1,y1+8,1);
				ds_grid_set(tree0,x1+1,y1+9,1);
				ds_grid_set(tree0,x1+9,y1+9,1);
				
				//Enemy
				xx = x1+2; yy = y1+1; n = 1;
				ds_grid_set(enemy0,xx,yy,obj_bandit);
				repeat(7) {
					ds_grid_set(enemy_path,xx++,yy,n++);
				}
				ds_grid_set(enemy_path,xx,yy++,n++);
				ds_grid_set(enemy_path,xx++,yy,n++);
				repeat(3) {
					ds_grid_set(enemy_path,xx,yy++,n++);
				}
				ds_grid_set(enemy_path,xx++,yy,n++);
				repeat(3) {
					ds_grid_set(enemy_path,xx,yy++,n++);
				}
				ds_grid_set(enemy_path,xx,yy,n); //Path End
				xx = x1+7; yy = y1+5; n = 1;
				ds_grid_set(enemy0,xx,yy,obj_bandit);
				repeat(3) {
					ds_grid_set(enemy_path,xx--,yy,n++);
				}
				repeat(2) {
					ds_grid_set(enemy_path,xx,yy--,n++);
				}
				repeat(2) {
					ds_grid_set(enemy_path,xx++,yy,n++);
				}
				ds_grid_set(enemy_path,xx,yy,n); //Path End
				#endregion
			break;
			case(1):
				#region Large 2
				//Water
				ds_grid_set_region(water0,x1,y1+1,x1+1,y1+3,1);
				ds_grid_set_region(water0,x1+1,y1+2,x1+4,y1+4,1);
				ds_grid_set_region(water0,x1+5,y1+3,x1+5,y1+4,1);

				//Road
				ds_grid_set(road0,x1+2,y1,1);
				ds_grid_set_region(road0,x1+2,y1+1,x1+6,y1+1,1);
				ds_grid_set_region(road0,x1+6,y1+2,x1+6,y1+10,1);
				ds_grid_set_region(road0,x1+7,y1+10,x1+10,y1+10,1);
				ds_grid_set(road0,x1+10,y1+11,1);
				ds_grid_set_region(road0,x1,y1+5,x1+2,y1+5,1);
				ds_grid_set_region(road0,x1+2,y1+6,x1+9,y1+6,1);
				ds_grid_set_region(road0,x1+9,y1+5,x1+9,y1+2,1);
				ds_grid_set_region(road0,x1+10,y1+2,x1+11,y1+2,1);

				//Search
				ds_grid_set(search0,x1+1,y1,1);
				ds_grid_set(search0,x1+3,y1,1);
				ds_grid_set(search0,x1+6,y1,1);
				ds_grid_set_region(search0,x1+7,y1,x1+7,y1+2,1);
				ds_grid_set_region(search0,x1+8,y1+1,x1+8,y1+4,1);
				ds_grid_set(search0,x1+9,y1+1,1);
				ds_grid_set(search0,x1,y1+10,1);
				ds_grid_set_region(search0,x1,y1+11,x1+1,y1+11,1);
				ds_grid_set_region(search0,x1+11,y1+10,x1+11,y1+11,1);
				ds_grid_set(search0,x1+5,y1+5,3);
				ds_grid_set(search0,x1+7,y1+7,3);

				//Tree
				ds_grid_set(tree0,x1,y1-1,1);
				ds_grid_set(tree0,x1+8,y1-1,1);
				ds_grid_set(tree0,x1+10,y1-1,1);
				ds_grid_set(tree0,x1+6,y1,1);
				ds_grid_set(tree0,x1+7,y1+1,1);
				ds_grid_set(tree0,x1+7,y1+3,1);
				ds_grid_set(tree0,x1+3,y1+4,1);
				ds_grid_set(tree0,x1,y1+8,1);
				ds_grid_set(tree0,x1+6,y1+9,1);
				ds_grid_set(tree0,x1+10,y1+8,1);
				
				//Height
				ds_grid_set_region(base1,x1,y1+6,x1+2,y1+9,1);
				ds_grid_set_region(base1,x1+1,y1+7,x1+5,y1+11,1);
				ds_grid_set_region(base1,x1+6,y1+8,x1+6,y1+11,1);
				ds_grid_set_region(base1,x1+9,y1+3,x1+11,y1+9,1);
				ds_grid_set_region(base1,x1+8,y1+6,x1+8,y1+9,1);
				//ds_grid_set_region(base1,x1+7,y1+6,x1+7,y1+8,1);
				
				//Enemy
				xx = x1+5; yy = y1; n = 1;
				ds_grid_set(enemy0,xx,yy,obj_savage);
				repeat(2) {
					ds_grid_set(enemy_path,xx,yy++,n++);
				}
				ds_grid_set(enemy_path,xx++,yy,n++);
				ds_grid_set(enemy_path,xx,yy++,n++);
				ds_grid_set(enemy_path,xx,yy,n); //Path End
				xx = x1+2; yy = y1+7; n = 1;
				ds_grid_set(enemy0,xx,yy,obj_savage);
				repeat(3) {
					ds_grid_set(enemy_path,xx++,yy,n++);
				}
				ds_grid_set(enemy_path,xx,yy++,n++);
				repeat(2) {
					ds_grid_set(enemy_path,xx,yy++,n++);
				}
				ds_grid_set(enemy_path,xx,yy++,n++);
				ds_grid_set(enemy_path,xx,yy,n); //Path End
				#endregion
			break;
			case(2):
				#region Large 3
				//Water
				ds_grid_set_region(water1,x1+3,y1+4,x1+4,y1+8,1);
				ds_grid_set_region(water1,x1+4,y1+2,x1+6,y1+3,1);
				ds_grid_set_region(water1,x1+5,y1+3,x1+7,y1+5,1);
				ds_grid_set_region(water1,x1+6,y1+5,x1+8,y1+6,1);

				//Search
				ds_grid_set(search0,x1+1,y1,1);
				ds_grid_set_region(search0,x1+10,y1,x1+10,y1+2,1);
				ds_grid_set(search0,x1+11,y1+2,1);
				ds_grid_set(search1,x1+1,y1+2,1);
				ds_grid_set_region(search0,x1,y1+4,x1,y1+5,1);
				ds_grid_set(search0,x1+1,y1+5,1);
				ds_grid_set(search1,x1+5,y1+7,1);
				ds_grid_set_region(search0,x1,y1+10,x1,y1+11,1);
				ds_grid_set(search0,x1+1,y1+11,1);
				ds_grid_set(search0,x1+5,y1+11,1);
				ds_grid_set_region(search1,x1+9,y1+8,x1+9,y1+9,1);
				ds_grid_set_region(search1,x1+8,y1+9,x1+8,y1+10,1);

				//Tree
				ds_grid_set(tree0,x1+1,y1-1,1);
				ds_grid_set(tree0,x1+9,y1-1,1);
				ds_grid_set(tree1,x1+1,y1+1,1);
				ds_grid_set(tree1,x1+7,y1,1);
				ds_grid_set(tree0,x1+10,y1+1,1);
				ds_grid_set(tree1,x1+8,y1+2,1);
				ds_grid_set(tree0,x1,y1+4,1);
				ds_grid_set(tree1,x1+1,y1+6,1);
				ds_grid_set(tree1,x1+7,y1+6,1);
				ds_grid_set(tree1,x1+2,y1+8,1);
				ds_grid_set(tree1,x1+7,y1+8,1);
				ds_grid_set(tree0,x1,y1+9,1);
				ds_grid_set(tree0,x1+4,y1+9,1);
				ds_grid_set(tree0,x1+10,y1+9,1);
				
				//Height
				ds_grid_set_region(base1,x1,y1,x1+10,y1+11,1);
				ds_grid_set_region(base1,x1+11,y1+3,x1+11,y1+6,1);
				ds_grid_set_region(base1,x1,y1,x1+1,y1,0);
				ds_grid_set_region(base1,x1+10,y1,x1+10,y1+1,0);
				ds_grid_set(base1,x1,y1+5,0);
				ds_grid_set_region(base1,x1,y1+10,x1,y1+11,0);
				ds_grid_set(base1,x1+5,y1+11,0);
				//ds_grid_set(base1,x1+10,y1+6,11);
				ds_grid_set(base1,x1+10,y1+7,19);
				ds_grid_set(base1,x1+10,y1+8,16);
				ds_grid_set(base1,x1+10,y1+9,18);
				//ds_grid_set(base1,x1+10,y1+10,7);
				
				//Enemy
				xx = x1+2; yy = y1+7; n = 1;
				ds_grid_set(enemy1,xx,yy,obj_mad_man);
				repeat(3) ds_grid_set(enemy_path,xx,yy++,n++);
				repeat(4) ds_grid_set(enemy_path,xx++,yy,n++);
				ds_grid_set(enemy_path,xx,yy--,n++);
				ds_grid_set(enemy_path,xx++,yy,n++);
				ds_grid_set(enemy_path,xx,yy--,n++);
				repeat(2) ds_grid_set(enemy_path,xx++,yy,n++);
				ds_grid_set(enemy_path,xx,yy--,n++);
				ds_grid_set(enemy_path,xx,yy,n); //Path End
				xx = x1+9; yy = y1+5; n = 1;
				ds_grid_set(enemy1,xx,yy,obj_mad_man);
				repeat(3) ds_grid_set(enemy_path,xx,yy--,n++);
				ds_grid_set(enemy_path,xx--,yy,n++);
				ds_grid_set(enemy_path,xx,yy--,n++);
				ds_grid_set(enemy_path,xx--,yy,n++);
				ds_grid_set(enemy_path,xx,yy--,n++);
				repeat(4) ds_grid_set(enemy_path,xx--,yy,n++);
				ds_grid_set(enemy_path,xx,yy++,n++);
				ds_grid_set(enemy_path,xx--,yy,n++);
				repeat(3) ds_grid_set(enemy_path,xx,yy++,n++);
				ds_grid_set(enemy_path,xx,yy,n); //Path End
				#endregion
			break;
		}
	break;
}