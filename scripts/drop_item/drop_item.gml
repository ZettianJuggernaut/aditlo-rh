/// @param inventory,row,x,y,sum

var cur_inventory = argument0,
row = argument1,
xx = argument2,
yy = argument3,
item_id = cur_inventory[# 0,row],
item_sum = argument4,
item_cap = cur_inventory[# 2,row],
item_spr = cur_inventory[# 3,row],
added, bag = instance_position(xx,yy,obj_drop_bag);
if(bag == noone) {
	bag = instance_create_depth(xx,yy,depth+1,obj_drop_bag);
}
with(bag) {
	added = inv_item_add(grid_bag_items,item_id,item_sum,item_cap,item_spr);
}
if(added) {
	with(bag) {
		bag_resize();
	}
	return true;
}
else {
	return false;
}