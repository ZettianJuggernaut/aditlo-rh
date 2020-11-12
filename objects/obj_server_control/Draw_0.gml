if(global.current_menu == "online_lobby")
{
	var xx = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2;
	var yy = camera_get_view_y(view_camera[0]) + 100;
	var y1 = yy + 60;
	var y2 = yy + 135;
	var width = 500;
	var height = 60;
	var p2_name, p2_status;
	
	draw_rectangle(xx - width/2,y1,xx + width/2,y1 + height,1);
	draw_rectangle(xx - width/2,y2,xx + width/2,y2 + height,1);
	draw_set_halign(fa_center);
	draw_text(xx,yy,"Server Name: " + global.server_name);
	//PLayer 1
	draw_text(xx,y1 + 10,"Player 1: Self");
	draw_text(xx,y1 + 30,"Status: Connected");
	
	//Player 2
	if(connected_player == -1)
	{
		p2_name = "N/A";
		p2_status = "N/A";
	}
	else
	{
		p2_name = string(global.socket_other);
		p2_status = "Connected";
	}
	draw_text(xx,y2 + 10,"Player 2: " + p2_name);
	draw_text(xx,y2 + 30,"Status: " + p2_status);
	draw_set_halign(fa_left);
}