var number = instance_number(obj_lobby_select)-1;
name_server = obj_client_control.list_servers[| number];
ip_address = obj_client_control.list_connect_ips[| number];
var center_x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2;
x = center_x;
y = camera_get_view_y(view_camera[0]) + 30 + number*65;
width = 600;
height = 60;