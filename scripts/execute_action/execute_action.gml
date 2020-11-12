function execute_action(row) {
	var grid = global.grid_turn_actions,
	xx = grid[# 3,row],
	yy = grid[# 4,row];
	with(grid[# 1,row]) {
		/*switch(point_direction(x,y,xx,yy)) {
			case(0): sprite_index = spr_character_side_right; break;
			case(90): sprite_index = spr_character_back; break;
			case(180): sprite_index = spr_character_side_left; break;
			case(270): sprite_index = spr_character_front; break;
		}*/
		switch(grid[# 2,row]) {
			case(actions.move):
				if(!place_meeting(xx,yy,obj_character_parent_all)) {
					if(tilemap_get_at_pixel(collision_map,xx,yy) == 4) depth -= 100;
					basic_movement(xx,yy);
				}
				else alarm[0] = 1;
			break;
			case(actions.attack):
				var def = instance_nearest(xx,yy,obj_character_parent_all);
				if(def.x == xx && def.y == yy) {
					combat(id,def);
					alarm[0] = 1;
					break;
				}
			case(actions.search):
				var item_id = ds_grid_get(search_map,floor(xx/64),floor(yy/64));
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
				if(inv_item_add(inventory,item_id,item_sum,item_cap,item_spr)) {
					ds_grid_set(search_map,floor(xx/64),floor(yy/64),0);
					if(tilemap_get_at_pixel(collision_map,xx,yy) == 5) {
						tilemap_set_at_pixel(collision_map,2,xx,yy);
						//Chest Opening
						if(tilemap_get_at_pixel(global.tilemap_search0,xx,yy) == 4) {
							tilemap_set_at_pixel(global.tilemap_search0,5,xx,yy);
						}
						else if(tilemap_get_at_pixel(global.tilemap_search1,xx,yy) == 4) {
							tilemap_set_at_pixel(global.tilemap_search1,5,xx,yy);
						}
					}
					alarm[0] = 1;
				}
			break;
			case(actions.pick_item):
				var grab_bag = instance_nearest(xx,yy,obj_drop_bag);
				grab_bag.sprite_index = spr_drop_bag_open;
				with(instance_create_depth((global.view_w/2)-170,(global.view_h/2)-145,0,obj_inv_pickup)) {
					inventory = grab_bag.grid_bag_items
					bag = grab_bag;
				}
			break;
			default:
			alarm[0] = 1;
		}
	}
}