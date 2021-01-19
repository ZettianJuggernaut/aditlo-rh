/// @description Set-Up
event_inherited();
myname = "Enter Sign";
mytext[3,0] = "You entered here";
mytext[3,1] = "You cannot go back this way";
mytext[3,2] = "This is a very long text, like we will get to see what happens when I type alot of text";
var xx = (x - 32)/64,
yy = (y - 32)/64;
if(xx != ceil(xx)) {
	x = (ceil(xx)*64) + 32;
}
if(yy != ceil(yy)) {
	y = (ceil(yy)*64) + 32;
}
alarm[0] = 1;