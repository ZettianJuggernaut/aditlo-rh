/// @description Inventory Open/Close
if(global.paused) {
	inv_y_mod += 10;
	if(inv_y_mod < inv_y_base) {
		alarm[0] = 1;
	}
	else {
		global.paused = false;
		inv_visible = 6;
	}
	if(image_angle > 0) {
		image_angle -= 20;
	}
}
else {
	inv_y_mod -= 10;
	if(inv_y_mod > inv_y_base - 200) {
		alarm[0] = 1;
	}
	else {
		global.paused = true;
	}
	if(image_angle < 180) {
		image_angle += 20;
	}
}