///@description Trigger Menu

if(obj_menuController.globalMenuIsUp && !self.menuIsUp){
	return;
}
self.menuIsUp=!self.menuIsUp;
obj_menuController.globalMenuIsUp=self.menuIsUp;
show_debug_message("Menu: "+string(obj_menuController.globalMenuIsUp) + " " + string(self.menuIsUp));