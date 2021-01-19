/// @description Creating Textbox
textbox = instance_create_layer(x,y,"Health",obj_textbox);
textbox.creator = self;
textbox.text = mytext;
textbox.buttons = mybuttons;
textbox.textname = myname;
with(textbox) {
	event_user(0);
}