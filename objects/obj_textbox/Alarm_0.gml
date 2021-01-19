/// @description Increasing char_count
if(char_count < string_length(text[3,page])) {
	char_count += 0.5;
	alarm[0] = 1;
} else if(page+1 < array_length(text[3])) {
		buttons[3,0].text = "Next";
} else {
	buttons[3,0].text = "End";
}