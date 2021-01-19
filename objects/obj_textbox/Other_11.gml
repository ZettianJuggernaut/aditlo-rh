/// @description 
if(char_count < string_length(text[3,page])) {
	char_count = string_length(text[3,page]);
	if(page+1 < array_length(text[3])) {
		buttons[3,0].text = "Next";
	} else {
		buttons[3,0].text = "End";
	}
} else if(page+1 < array_length(text[3])) {
	page++;
	char_count = 0;
	alarm[0] = 1;
	buttons[3,0].text = "Skip";
} else {
	instance_destroy();
	instance_destroy(buttons[0,0]);
	instance_destroy(buttons[1,0]);
	instance_destroy(buttons[2,0]);
	instance_destroy(buttons[3,0]);
	creator.textbox = noone;
	obj_display_manager.follow.alarm[1] = 1;
}