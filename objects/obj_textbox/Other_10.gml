/// @description Creating buttons
if(buttons[0,0] != noone) {
	buttons[0,0] = instance_create_depth(x-105,y+sprite_height-25,depth-1,buttons[0,0]);
	buttons[0,0].text = "Skip";
	buttons[0,0].creator = self;
}
if(buttons[1,0] != noone) {
	buttons[1,0] = instance_create_depth(x-35,y+sprite_height-25,depth-1,buttons[1,0]);
	buttons[1,0].text = "Skip";
	buttons[1,0].creator = self;
}
if(buttons[2,0] != noone) {
	buttons[2,0] = instance_create_depth(x+35,y+sprite_height-25,depth-1,buttons[2,0]);
	buttons[2,0].text = "Skip";
	buttons[2,0].creator = self;
}
if(buttons[3,0] != noone) {
	buttons[3,0] = instance_create_depth(x+105,y+sprite_height-25,depth-1,buttons[3,0]);
	buttons[3,0].text = "Skip";
	buttons[3,0].creator = self;
}