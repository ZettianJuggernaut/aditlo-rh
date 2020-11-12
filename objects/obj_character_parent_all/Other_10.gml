/// @description Equip

var col = 4, row;

if(ds_grid_value_exists(inventory,col,0,col,ds_grid_height(inventory)-1,"s-hold-right")) {
	row = ds_grid_value_y(inventory,col,0,col,ds_grid_height(inventory)-1,"s-hold-right");
	inv_item_equip_vis(inventory[# 0,row],"s-hold-right");
}
else {
	skeleton_attachment_set("s-hold-right",-1);
}

if(ds_grid_value_exists(inventory,col,0,col,ds_grid_height(inventory)-1,"s-hold-left")) {
	row = ds_grid_value_y(inventory,col,0,col,ds_grid_height(inventory)-1,"s-hold-left");
	inv_item_equip_vis(inventory[# 0,row],"s-hold-left");
}
else {
	skeleton_attachment_set("s-hold-left",-1);
}

if(ds_grid_value_exists(inventory,col,0,col,ds_grid_height(inventory)-1,"s-brace-right")) {
	row = ds_grid_value_y(inventory,col,0,col,ds_grid_height(inventory)-1,"s-brace-right");
	inv_item_equip_vis(inventory[# 0,row],"s-brace-right");
}
else {
	skeleton_attachment_set("s-brace-right",-1);
}

if(ds_grid_value_exists(inventory,col,0,col,ds_grid_height(inventory)-1,"s-brace-left")) {
	row = ds_grid_value_y(inventory,col,0,col,ds_grid_height(inventory)-1,"s-brace-left");
	inv_item_equip_vis(inventory[# 0,row],"s-brace-left");
}
else {
	skeleton_attachment_set("s-brace-left",-1);
}