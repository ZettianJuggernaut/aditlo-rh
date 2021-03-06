if(device_mouse_check_button_released(0,mb_left)) {
	var following = obj_display_manager.follow,
	action_id = instance_position(device_mouse_x(0),device_mouse_y(0),object_index);
	if(action_id != noone) {
		with(action_id) {
			var xx = x,
			yy = y,
			action = 0;
				
			switch(sprite_index) {
				case(spr_icon_feet):
					action = 1;
				break;
				case(spr_icon_sword):
					action = 3;
				break;
				case(spr_icon_eye):
					action = 5;
				break;
				case(spr_icon_hand):
					action = 6;
				break;
				case(spr_icon_speak):
					action = 7;
				break;
			}
				
			with(following) {
				/*if(global.socket_other != noone) {
					var buff = buffer_create(100,buffer_fixed,1);
					buffer_write(buff,buffer_u8,object_index);
					buffer_write(buff,buffer_u16,x);
					buffer_write(buff,buffer_u16,y);
					buffer_write(buff,buffer_u8,character_action);
					buffer_write(buff,buffer_bool,false);
					buffer_write(buff,buffer_u16,xx);
					buffer_write(buff,buffer_u16,yy);
					buffer_write(buff,buffer_u8,action);
					network_send_packet(global.socket_other,buff,buffer_tell(buff));
					buffer_delete(buff);
				}
				character_action(true,xx,yy,action);*/
				switch(action) {
					case(1):
					case(3):
					case(5):
						queue_action(20,id,action,xx,yy);
					break;
					case(6):
						var grab_bag = instance_nearest(xx,yy,obj_drop_bag);
						grab_bag.sprite_index = spr_drop_bag_open;
						with(instance_create_depth((global.view_w/2)-170,(global.view_h/2)-145,0,obj_inv_pickup)) {
							inventory = grab_bag.grid_bag_items
							bag = grab_bag;
						}
					break;
					case(7):
						with(instance_nearest(xx,yy,obj_speak_parent)) {
							event_user(0);
						}
					break;
				}
			}
			instance_destroy(obj_action_icon);
		}
	}
}