/// @param id,slot
function inv_item_equip_vis(item_id, slot) {

	var item_facing, item_angle;

	//show_debug_message("Equipping " + string(item_id) + " visually.")

	ini_open("item_info_u.ini");
		var item_type = ini_read_string(item_id,"type",noone);
		var item_spr = asset_get_index(ini_read_string(item_id,"spr",noone));
	ini_close();

	switch(item_type) {
		case("Weapon"):
			switch(sprite_index) {
				case(spr_character_front):
				case(spr_character_back):
					item_facing = spr_item_front1;
					item_angle = -90;
				break;
				case(spr_character_side_right):
					item_facing = spr_item_side1;
					item_angle = 90;
				break;
				case(spr_character_side_left):
					item_facing = spr_item_side1;
					item_angle = 180;
				break;
			}
			switch(item_spr) {
				case(spr_item_axe1): //Rusty Axe
					skeleton_attachment_create("AxeFront1",item_facing,0,-5,14,1,1,item_angle);
					skeleton_attachment_set(slot,"AxeFront1");
				break;
				case(spr_item_dagger1): //Rusty Dagger
					skeleton_attachment_create("DaggerFront1",item_facing,1,-6,23,1,1,item_angle);
					skeleton_attachment_set(slot,"DaggerFront1");
				break;
				case(spr_item_spear1): //Rusty Spear
					skeleton_attachment_create("SpearFront1",item_facing,2,4,3,1,1,item_angle);
					skeleton_attachment_set(slot,"SpearFront1");
				break;
				case(spr_item_sword1): //Rusty Sword
					skeleton_attachment_create("SwordFront1",item_facing,3,1,6,1,1,item_angle);
					skeleton_attachment_set(slot,"SwordFront1");
				break;
				case(spr_item_staff1): //Staff
					skeleton_attachment_create("StaffFront1",item_facing,4,-6,25,1,1,item_angle);
					skeleton_attachment_set(slot,"StaffFront1");
				break;
				case(spr_item_bow1): //bow
					skeleton_attachment_create("BowFront1",spr_item_front_bow,1,-12,6,1,1,item_angle);
					skeleton_attachment_set(slot,"BowFront1");
				break;
			}
		break;
		case("Shield"):
			switch(sprite_index)
			{
				case(spr_character_front):
				case(spr_character_back):
					item_facing = spr_item_front2;
					item_angle = -90;
				break;
				case(spr_character_side_right):
				case(spr_character_side_left):
					item_facing = spr_item_side1;
					item_angle = 0;
				break;
			}
			switch(item_spr) {
				case(spr_item_shield): //Wooden Shield
					skeleton_attachment_create("ShieldFront1",item_facing,1,-15,30,1,1,item_angle);
					skeleton_attachment_set(slot,"ShieldFront1");
				break;
			}
		break;
	}


}
