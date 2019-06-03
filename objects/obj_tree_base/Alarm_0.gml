/// @description
with(instance_create_depth(x,y,-250,obj_tree_top)) {
	switch(other.sprite_index) {
		case(spr_tree_base_a): sprite_index = spr_tree_top_a; break;
		case(spr_tree_base_b): sprite_index = spr_tree_top_b; break;
		case(spr_tree_base_c): sprite_index = spr_tree_top_c; break;
	}
}