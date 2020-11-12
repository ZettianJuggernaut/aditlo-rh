var center_x = room_width/2,
center_y = room_height/2;
instance_create_depth(center_x,center_y,0,obj_menu_cam);
//instance_create_depth(camera_get_view_x(view_camera[0])+50,camera_get_view_y(view_camera[0])+50,0,obj_button_back);
switch(global.current_menu) {
	case("start"):
		instance_create_depth(center_x,center_y-200,0,obj_button_play_offline);
		instance_create_depth(center_x,center_y-100,0,obj_button_play_online);
		//instance_create_depth(center_x - 200,center_y - 300,0,obj_button_orien)
		instance_destroy(obj_button_back);
	break;
	case("char_select"):
		instance_create_depth(center_x-30,center_y - 300,0,obj_selector_char_cur);
		with(instance_create_depth(center_x - 150,center_y - 200,0,obj_selector_char)) {
			sprite_index = spr_robin_hood;
			/*if(global.p1_playing == obj_robin_hood) {
				image_blend = c_black;
			}*/
		}
		with(instance_create_depth(center_x - 30,center_y - 200,0,obj_selector_char)) {
			sprite_index = spr_john;
			/*if(global.p1_playing == obj_john) {
				image_blend = c_black;
			}*/
		}
		with(instance_create_depth(center_x + 90,center_y - 200,0,obj_selector_char)) {
			sprite_index = spr_tuck;
			//image_blend = c_black;
		}
/*		with(instance_create_depth(center_x - 150,center_y - 100,0,obj_selector_char))
		{
			sprite_index = spr_robin_hood;
			image_blend = c_black;
		}
		with(instance_create_depth(center_x - 30,center_y - 100,0,obj_selector_char))
		{
			sprite_index = spr_john;
			image_blend = c_black;
		}
		with(instance_create_depth(center_x + 90,center_y - 100,0,obj_selector_char))
		{
			sprite_index = spr_tuck;
			image_blend = c_black;
		}	*/
		//instance_create_depth(center_x-30,center_y - 300,0,obj_selected_char);
		//instance_create_depth(center_x-30,center_y - 300,0,obj_selected_char);
		//if(global.p1_playing == noone && global.control_p1) {
			instance_create_depth(center_x,center_y+50,0,obj_button_next);
		//}
		/*else if(global.p2_playing == noone && global.control_p2) {
			instance_create_depth(center_x,center_y+50,0,obj_button_next);
		}*/
	break;
	case("online_setup"):
		instance_create_depth(center_x,center_y-200,0,obj_button_host);
		instance_create_depth(center_x,center_y-100,0,obj_button_connect);
	break;
	case("online_lobby"):
		if(instance_exists(obj_server_control))
		{
			instance_create_depth(center_x,center_y+100,0,obj_button_next);
		}
	break;
	case("offline_lobby"):
		//if(global.control_p1) {
			instance_create_depth(center_x,center_y+100,0,obj_button_start);
		//}
	break;
}