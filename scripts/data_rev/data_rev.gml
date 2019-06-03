var buff = argument0,
obj = buffer_read(buff,buffer_u8),
xx = buffer_read(buff,buffer_u16),
yy = buffer_read(buff,buffer_u16);
obj = instance_nearest(xx,yy,obj);
with(obj)
{
	var action = buffer_read(buff,buffer_u8);
	switch(action)
	{
		//Character Action
		case(player_selector):
			var arg0 = buffer_read(buff,buffer_u16),
			arg1 = buffer_read(buff,buffer_u16);
			player_selector(arg0,arg1);
			break;
		case(character_action):
			var arg0 = buffer_read(buff,buffer_bool),
			arg1 = buffer_read(buff,buffer_u16),
			arg2 = buffer_read(buff,buffer_u16),
			arg3 = buffer_read(buff,buffer_u8);
			character_action(arg0,arg1,arg2,arg3);
			break;
		//Other
		case(damage_taken):
			var arg0 = obj,
			arg1 = buffer_read(buff,buffer_u8),
			arg2 = buffer_read(buff,buffer_u8);
			damage_taken(arg0,arg1,arg2);
			break;
	}
}