/// @description
if(obj_display_manager.follow == object_index) {
	var inv = inventory;
	var i = 0;
	var o_name = object_get_name(object_index);
	var name_len = string_width(o_name);
	var name = "";
	for(var n = 5; n < name_len; n++) {
		name += string_char_at(o_name,n)
	}
	
	show_debug_message("Items in " + name + "'s Inventory:");
	show_debug_message(string(inv[# 0,i++]) + " | " + string(inv[# 0,i++]) + " | " + string(inv[# 0,i++])
	+ " | " + string(inv[# 0,i++]) + " | " + string(inv[# 0,i++]) + " | " + string(inv[# 0,i++]));
	show_debug_message(string(inv[# 0,i++]) + " | " + string(inv[# 0,i++]) + " | " + string(inv[# 0,i++])
	+ " | " + string(inv[# 0,i++]) + " | " + string(inv[# 0,i++]) + " | " + string(inv[# 0,i++]));
	show_debug_message(string(inv[# 0,i++]) + " | " + string(inv[# 0,i++]) + " | " + string(inv[# 0,i++])
	+ " | " + string(inv[# 0,i++]) + " | " + string(inv[# 0,i++]) + " | " + string(inv[# 0,i++]));
	show_debug_message(string(inv[# 0,i++]) + " | " + string(inv[# 0,i++]) + " | " + string(inv[# 0,i++])
	+ " | " + string(inv[# 0,i++]) + " | " + string(inv[# 0,i++]) + " | " + string(inv[# 0,i++]));
}