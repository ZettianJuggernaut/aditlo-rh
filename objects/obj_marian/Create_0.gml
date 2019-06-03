//Stats
event_inherited();

/*s_strength -= 1;
s_speed += 2;
s_agility += 2;*/

//Looks
/*var list_skins = ds_list_create();
skeleton_skin_list(sprite_index,list_skins);
look = list_skins[| 3];*/
skin = "+MarianBase";
skeleton_skin_set(skin);
//ds_list_destroy(list_skins);

//Inventory
var i_spr = spr_item_spear1;
var starting_item = inv_item_create("Staff","Weapon",i_spr,"Long and Pointy.",0,0,2,-2,0,-1,0,2,2);

inv_item_add(inventory,starting_item,1,1,i_spr);
inventory[# 4,0] = "s-hold-right";
inv_item_equip(starting_item);