if(!inv_visible) {
	var xi = 210;
	var yi = global.offset+870;
	var height = global.offset+871;
	var width = (xi+(65*s_inventory.width));
}
else {
	var xi = x-160;
	var yi = y+10;
	var height = (yi+(65*(s_inventory.height/s_inventory.width)));
	var width = (xi+(65*s_inventory.width));
}
var slot_row = 0;
for(var yy = yi; yy < height; yy += 65) {
	for(var xx = xi; xx < width; xx += 65) {
		with(instance_create_depth(xx,yy,0,obj_inv_slot)) slot_y = slot_row++;
	}
}