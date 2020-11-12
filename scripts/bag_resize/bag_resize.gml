function bag_resize() {
	var size = 0;
	for(var ddown = 0; ddown < ds_grid_height(grid_bag_items); ddown++) {
		if(grid_bag_items[# 1,ddown] > 0) size++;
	}
	size = ceil(size/3);
	image_index = (size-1);


}
