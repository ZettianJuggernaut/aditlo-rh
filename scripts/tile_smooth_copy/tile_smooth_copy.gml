///@param tile_setup,layer1,layer2,x,y,check_max

var tile_setup = argument0;
var tile_layer = argument1;
var tile_layer_2 = argument2;
var xx = argument3;
var yy = argument4;
var check_max = argument5; //Tile not to check for
var tile_above = false;
var tile_right = false;
var tile_below = false;
var tile_left = false;
var tile_above_left = false;
var tile_above_right = false;
var tile_below_right = false;
var tile_below_left = false;
if(tilemap_get(tile_layer,xx,yy-1) > 0 && tilemap_get(tile_layer,xx,yy-1) < check_max
|| tilemap_get(tile_layer_2,xx,yy-1) > 0 && tilemap_get(tile_layer_2,xx,yy-1) < check_max) {
	tile_above = true;
}
if(tilemap_get(tile_layer,xx+1,yy) > 0 && tilemap_get(tile_layer,xx+1,yy) < check_max
|| tilemap_get(tile_layer_2,xx+1,yy) > 0 && tilemap_get(tile_layer_2,xx+1,yy) < check_max) {
	tile_right = true;
}
if(tilemap_get(tile_layer,xx,yy+1) > 0 && tilemap_get(tile_layer,xx,yy+1) < check_max
|| tilemap_get(tile_layer_2,xx,yy+1) > 0 && tilemap_get(tile_layer_2,xx,yy+1) < check_max) {
	tile_below = true;
}
if(tilemap_get(tile_layer,xx-1,yy) > 0 && tilemap_get(tile_layer,xx-1,yy) < check_max
|| tilemap_get(tile_layer_2,xx-1,yy) > 0 && tilemap_get(tile_layer_2,xx-1,yy) < check_max) {
	tile_left = true;
}
if(tilemap_get(tile_layer,xx-1,yy-1) > 0 && tilemap_get(tile_layer,xx-1,yy-1) < check_max
|| tilemap_get(tile_layer_2,xx-1,yy-1) > 0 && tilemap_get(tile_layer_2,xx-1,yy-1) < check_max) {
	tile_above_left = true;
}
if(tilemap_get(tile_layer,xx+1,yy-1) > 0 && tilemap_get(tile_layer,xx+1,yy-1) < check_max
|| tilemap_get(tile_layer_2,xx+1,yy-1) > 0 && tilemap_get(tile_layer_2,xx+1,yy-1) < check_max) {
	tile_above_right = true;
}
if(tilemap_get(tile_layer,xx+1,yy+1) > 0 && tilemap_get(tile_layer,xx+1,yy+1) < check_max
|| tilemap_get(tile_layer_2,xx+1,yy+1) > 0 && tilemap_get(tile_layer_2,xx+1,yy+1) < check_max) {
	tile_below_right = true;
}
if(tilemap_get(tile_layer,xx-1,yy+1) > 0 && tilemap_get(tile_layer,xx-1,yy+1) < check_max
|| tilemap_get(tile_layer_2,xx-1,yy+1) > 0 && tilemap_get(tile_layer_2,xx-1,yy+1) < check_max) {
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