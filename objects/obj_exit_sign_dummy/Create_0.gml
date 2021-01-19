/// @description Set-Up
event_inherited();
myname = "Exit Sign";
mytext[3,0] = "You have located the Exit Sign";
mytext[3,1] = "Well done! You can now travel to the next area";
var xx = (x - 32)/64,
yy = (y - 32)/64;
if(xx != ceil(xx)) {
	x = (ceil(xx)*64) + 32;
}
if(yy != ceil(yy)) {
	y = (ceil(yy)*64) + 32;
}
alarm[0] = 1;