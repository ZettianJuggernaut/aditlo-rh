if(global.current_menu == "online_lobby")
{
	if(connected == true)
	{
		draw_text(x,y,"Connected to " + name_server);
	}
	else
	{
		draw_text(x,y,"Searching for Local Games");
	}
}