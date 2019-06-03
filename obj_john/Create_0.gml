//Stats
event_inherited();

/*s_base_speed -= 1;
s_base_strength += 2;
s_base_endurance += 2;*/

s_speed -= 1;
s_strength += 2;
s_endurance += 2;

//Looks
/*var list_skins = ds_list_create();
skeleton_skin_list(sprite_index,list_skins);
look = list_skins[| 1];*/
skin = "+JohnBase";
skeleton_skin_set(skin);
/*look_hud = spr_john;
ds_list_destroy(list_skins);*/

//Inventory
var i_spr = spr_item_sword1;
var starting_item = inv_item_create("Sword","Weapon",i_spr,"Sharp!",0,2,0,0,2,0,0,0,1);

inv_item_add(inventory,starting_item,1,1,i_spr);
inventory[# 4,0] = "s-hold-right";
inv_item_equip(starting_item);