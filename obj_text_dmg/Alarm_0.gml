image_alpha -= 0.01;
y -= 1;
if(image_alpha == 0) {
	instance_destroy();
}
else {
	alarm_set(0,1);
}