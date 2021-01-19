event_inherited();

//Stats
s_health_max = 40;
s_health = s_health_max;
s_speed = 5;
s_agility = 5;
s_strength = 5;
s_endurance = 5;
s_dmg_min = 0;
s_dmg_max = 3;
s_stealth = 6;
s_aware = 5;

var grid = global.grid_players;
var height = ds_grid_height(grid);
var width = ds_grid_width(grid);
var yy = ds_grid_value_y(grid,0,0,width-1,height-1,object_index);
if(grid[# 1,yy] == "ai") ai = 1;
else ai = 0;