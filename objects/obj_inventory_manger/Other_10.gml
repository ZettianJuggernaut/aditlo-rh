/// @description Creating Inv Slots
if(!inv_visible) {
	var xi = 210,
	yi = global.offset+870,
	height = global.offset+871,
	width = (xi+(65*s_inventory.width));
}
else {
	var xi = x-160,
	yi = y+10,
	height = (yi+(65*(s_inventory.height/s_inventory.width))),
	width = (xi+(65*s_inventory.width));
}
var inv = obj_display_manager.follow.inventory;
inv_slot_creation(xi,yi,width,height,inv);