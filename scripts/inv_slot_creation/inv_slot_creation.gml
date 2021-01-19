function inv_slot_creation(ix,iy,width,height,use_inv){
var slot_row = 0;
for(var yy = iy; yy < height; yy += 65) {
	for(var xx = ix; xx < width; xx += 65) {
		with(instance_create_depth(xx,yy,0,obj_inv_slot)) {
			slot_y = slot_row++;
			inv = use_inv;
			if(inv == obj_display_manager.follow.inventory) {
				inv_text = obj_inventory_manger;
			}
			else inv_text = obj_inv_pickup;
		}
	}
}
}