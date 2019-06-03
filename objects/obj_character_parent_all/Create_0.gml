collision_map = global.tilemap_layer0_collision;
search_map = global.grid_tiling_layer0_search;
x += 32;
y += 32;
position_check();

//Controls
radar = ds_grid_create(9,9);

//Stats
s_health_max = 5;
s_health = 5;
s_speed = 5;
s_agility = 5;
s_strength = 5;
s_endurance = 5;
s_dmg_min = 0;
s_dmg_max = 3;
s_stealth = 3;
s_aware = 5;
action_max = 1;

alarm[11] = 5;

//Looks
look = noone;
look_hud = noone;

//Inventory
inventory = ds_grid_create(global.inventory_width,global.inventory_height);
inventory[# 0,5] = "gold";
inventory[# 1,5] = irandom_range(5,10);
inventory[# 2,5] = 9999;
inventory[# 3,5] = spr_item_gold;