event_inherited();

//Stats
//s_strength -= 1;
//s_speed += 2;

//Looks
/*var list_skins = ds_list_create();
skeleton_skin_list(sprite_index,list_skins);
look = list_skins[| 3];*/
skin = "-Bandit";
skeleton_skin_set(skin);
//ds_list_destroy(list_skins);

//Inventory
var i_spr = spr_item_dagger1;
var starting_item = inv_item_create("Dagger","Weapon",i_spr,"Assassin's favorite.",0,0,2,2,0,0,0,1,0);

inv_item_add(inventory,starting_item,1,1,i_spr);
inventory[# 4,0] = choose("RightWeaponSlot","LeftWeaponSlot");
inv_item_equip(starting_item);
event_user(0);