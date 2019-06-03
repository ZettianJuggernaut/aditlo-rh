ds_list_add(global.list_turn_order,ds_list_find_value(global.list_turn_order,0));
ds_list_delete(global.list_turn_order,0);
with(obj_tree_top) {
	image_alpha = 1;
}
with(global.list_turn_order[| 0]) {
	alarm[1] = 1;
}