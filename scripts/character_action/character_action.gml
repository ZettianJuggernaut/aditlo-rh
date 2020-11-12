/// @param prime,xx,yy,action
function character_action(argument0, argument1, argument2, argument3) {
	var xx = argument1,
	yy = argument2,
	prime = argument0,
	action = argument3;

	instance_destroy(obj_action_icon);
	
	switch(action) {
		case(1):
			basic_movement(xx,yy);
		break;
		case(3):
			//var att = instance_nearest(x,y,object_index),
			var def = instance_nearest(xx,yy,obj_enemy_parent);
			if(def.x == xx && def.y == yy && prime) {
				combat(object_index,def);
			}
			alarm[0] = 1;
		break;
		case(4):
			depth -= 100;
			basic_movement(xx,yy);
		break;
		case(5):
			var item_id = ds_grid_get(search_map,floor(xx/64),floor(yy/64));
			var added;
			if(string_char_at(item_id,1) == "u") {
				ini_open("item_info_u.ini");
					var item_sum = 1,
					item_cap = 1,
					item_spr = asset_get_index(ini_read_string(item_id,"spr",noone));
				ini_close();
			}
			else {
				ini_open("item_info.ini");
					var item_sum = irandom(ini_read_real(item_id,"sum",0))+1,
					item_cap = ini_read_real(item_id,"cap",1),
					item_spr = asset_get_index(ini_read_string(item_id,"spr",noone));
				ini_close();
			}
			added = inv_item_add(inventory,item_id,item_sum,item_cap,item_spr);
			if(added) {
				ds_grid_set(search_map,floor(xx/64),floor(yy/64),0);
				if(tilemap_get_at_pixel(collision_map,xx,yy) == 5) {
					tilemap_set_at_pixel(collision_map,2,xx,yy);
					if(tilemap_get_at_pixel(global.tilemap_layer0_search,xx,yy) == 4) {
						tilemap_set_at_pixel(global.tilemap_layer0_search,5,xx,yy);
					}
					else if(tilemap_get_at_pixel(global.tilemap_layer1_search,xx,yy) == 4) {
						tilemap_set_at_pixel(global.tilemap_layer1_search,5,xx,yy);
					}
				}
				alarm[0] = 1;
			}
			else {
				alarm[1] = 1;
			}
		break;
		case(6):
			var grab_bag = instance_nearest(xx,yy,obj_drop_bag);
			grab_bag.sprite_index = spr_drop_bag_open;
			with(instance_create_depth((global.view_w/2)-170,(global.view_h/2)-145,0,obj_inv_pickup)) {
				inventory = grab_bag.grid_bag_items
				bag = grab_bag;
			}
		break;
	}


}
