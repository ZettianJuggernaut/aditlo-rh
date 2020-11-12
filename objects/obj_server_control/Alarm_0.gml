/// @description Broadcast
if(connected_player == -1 && global.current_menu == "online_lobby")
{
	buffer_seek(buff_broadcast,buffer_seek_start,0);
	buffer_write(buff_broadcast,buffer_string,global.server_name);
	network_send_broadcast(global.socket_self,port,buff_broadcast,buffer_tell(buff_broadcast));
	alarm_set(0,1800);
}
else
{
	buffer_delete(buff_broadcast);
}