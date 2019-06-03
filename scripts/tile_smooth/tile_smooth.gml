///@param tile_setup,layer1,layer2,x,y,check_list

var tile_setup = argument0;
var tile_layer = argument1;
var tile_layer_2 = argument2;
var xx = argument3;
var yy = argument4;
var check_list = argument5; //Tile to check for
var tile_above = false;
var tile_right = false;
var tile_below = false;
var tile_left = false;
var tile_above_left = false;
var tile_above_right = false;
var tile_below_right = false;
var tile_below_left = false;
if(ds_list_find_index(check_list,tilemap_get(tile_layer,xx,yy-1)) > -1
|| ds_list_find_index(check_list,tilemap_get(tile_layer_2,xx,yy-1)) > -1) {
	tile_above = true;
}
if(ds_list_find_index(check_list,tilemap_get(tile_layer,xx+1,yy)) > -1
|| ds_list_find_index(check_list,tilemap_get(tile_layer_2,xx+1,yy)) > -1) {
	tile_right = true;
}
if(ds_list_find_index(check_list,tilemap_get(tile_layer,xx,yy+1)) > -1
|| ds_list_find_index(check_list,tilemap_get(tile_layer_2,xx,yy+1)) > -1) {
	tile_below = true;
}
if(ds_list_find_index(check_list,tilemap_get(tile_layer,xx-1,yy)) > -1
|| ds_list_find_index(check_list,tilemap_get(tile_layer_2,xx-1,yy)) > -1) {
	tile_left = true;
}
if(ds_list_find_index(check_list,tilemap_get(tile_layer,xx-1,yy-1)) > -1
|| ds_list_find_index(check_list,tilemap_get(tile_layer_2,xx-1,yy-1)) > -1) {
	tile_above_left = true;
}
if(ds_list_find_index(check_list,tilemap_get(tile_layer,xx+1,yy-1)) > -1
|| ds_list_find_index(check_list,tilemap_get(tile_layer_2,xx+1,yy-1)) > -1) {
	tile_above_right = true;
}
if(ds_list_find_index(check_list,tilemap_get(tile_layer,xx+1,yy+1)) > -1
|| ds_list_find_index(check_list,tilemap_get(tile_layer_2,xx+1,yy+1)) > -1) {
	tile_below_right = true;
}
if(ds_list_find_index(check_list,tilemap_get(tile_layer,xx-1,yy+1)) > -1
|| ds_list_find_index(check_list,tilemap_get(tile_layer_2,xx-1,yy+1)) > -1) {
	tile_below_left = true;
}

if(tile_above && !tile_right && !tile_below && !tile_left) {
	return "Up";
}
else if(!tile_above && tile_right && !tile_below && !tile_left) {
	return "Right";
}
else if(!tile_above && !tile_right && tile_below && !tile_left) {
	return "Down";
}
else if(!tile_above && !tile_right && !tile_below && tile_left) {
	return "Left";
}
else if(!tile_above && tile_right && tile_below && !tile_left) {
	return "Down Right";
}
else if(!tile_above && !tile_right && tile_below && tile_left) {
	return "Down Left";
}
else if(tile_above && tile_right && !tile_below && !tile_left) {
	return "Up Right";
}
else if(tile_above && !tile_right && !tile_below && tile_left) {
	return "Up Left";
}
else if(tile_above && !tile_right && tile_below && !tile_left) {
	return "Down Up";
}
else if(!tile_above && tile_right && !tile_below && tile_left) {
	return "Right Left";
}
else if(tile_above && tile_right && tile_below && !tile_left) {
	return "Down Up Right";
}
else if(tile_above && !tile_right && tile_below && tile_left) {
	return "Down Up Left";
}
else if(tile_above && tile_right && !tile_below && tile_left) {
	return "Right Left Up";
}
else if(!tile_above && tile_right && tile_below && tile_left) {
	return "Right Left Down";
}
else if(tile_above && tile_right && tile_below && tile_left) {
	if(tile_layer != global.tilemap_layer0_road || tile_layer != global.tilemap_layer1_road) {
		if(!tile_above_left && tile_above_right && tile_below_right && tile_below_left) {
			return "Full Up Left";
		}
		else if(tile_above_left && !tile_above_right && tile_below_right && tile_below_left) {
			return "Full Up Right";
		}
		else if(tile_above_left && tile_above_right && !tile_below_right && tile_below_left) {
			return "Full Down Right";
		}
		else if(tile_above_left && tile_above_right && tile_below_right && !tile_below_left) {
			return "Full Down Left";
		}
		else {
			return "Full"
		}
	}
	else {
		return "Full";
	}
}
else {
	if(tile_above_left && !tile_above_right && !tile_below_right && !tile_below_left) {
			return "None Up Left";
	}
	else if(!tile_above_left && tile_above_right && !tile_below_right && !tile_below_left) {
		return "None Up Right";
	}
	else if(!tile_above_left && !tile_above_right && tile_below_right && !tile_below_left) {
		return "None Down Right";
	}
	else if(!tile_above_left && !tile_above_right && !tile_below_right && tile_below_left) {
		return "None Down Left";
	}
	else {
		return "None"
	}
}