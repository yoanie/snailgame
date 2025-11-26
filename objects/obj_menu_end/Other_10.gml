///@description Trigger Menu

if(!instance_exists(obj_menuController)){
	show_debug_message("~~~~~~~~~~~~~~~~\nAdd a obj_menuController!!!!\n~~~~~~~~~~~~~~~~~~~~")
	return;
}

show_debug_message("Menu: "+string(obj_menuController.globalMenuIsUp) + " " + string(self.menuIsUp));
if(obj_menuController.globalMenuIsUp && !self.menuIsUp){
	return;
}
self.menuIsUp=!self.menuIsUp;
obj_menuController.globalMenuIsUp=self.menuIsUp;
show_debug_message("	-> "+string(obj_menuController.globalMenuIsUp) + " " + string(self.menuIsUp));


if(instance_exists(obj_timeController)){
	obj_timeController.timeIsFrozen = self.menuIsUp;
}
if(menuIsUp){
	instance_destroy(obj_cursor);
	
	quitbtn = instance_create_layer(view_get_wport(0)/2, 7*view_get_hport(0)/10, "GUI", btn_menu_quit);
	quitbtn.allegiantTo = self;
	
	instance_create_layer(mouse_x, mouse_y, "GUI", obj_cursor);
}
