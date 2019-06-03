event_inherited();

//Stats
//s_strength -= 1;
//s_speed += 2;

//Looks
/*var list_skins = ds_list_create();
skeleton_skin_list(sprite_index,list_skins);
look = list_skins[| 5];*/
skin = "-Savage";
skeleton_skin_set(skin);
//ds_list_destroy(list_skins);

//Inventory
var i_spr = spr_item_staff1;
var starting_item = inv_item_create("Staff","Weapon",i_spr,"Blunt.",0,0,2,2,0,1,0,1,-1);

inv_item_add(inventory,starting_item,1,1,i_spr);
inventory[# 4,0] = choose("RightWeaponSlot","LeftWeaponSlot");
inv_item_equip(starting_item);
event_user(0);