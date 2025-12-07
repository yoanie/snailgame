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
