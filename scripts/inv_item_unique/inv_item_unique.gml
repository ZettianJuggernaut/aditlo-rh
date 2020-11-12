///
function inv_item_unique(item_id) {
	if(string_char_at(item_id,1) == "u") {
		return true
	}
	else {
		return false
	}
}