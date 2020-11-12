event_inherited();

//Stats
//s_strength -= 1;
//s_speed += 2;

//Looks
/*var list_skins = ds_list_create();
skeleton_skin_list(sprite_index,list_skins);*/
skin = "-Madman";
skeleton_skin_set(skin);
//ds_list_destroy(list_skins);

//Inventory
if(choose(false,true)) {
	var i_spr = spr_item_staff1;
	var starting_item = inv_item_create("Staff","Weapon",i_spr,"Blunt.",1,0,0,2,2,1,0,0,0,2,1);

	inv_item_add(inventory,starting_item,1,1,i_spr);
	inventory[# 4,0] = choose("s-hold-right","s-hold-left");
	inv_item_equip(starting_item);
	event_user(0);
}