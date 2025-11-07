///@description Trigger Menu

event_inherited();

if(instance_exists(obj_timeController)){
	obj_timeController.timeIsFrozen = self.menuIsUp;
}
if(menuIsUp){
	instance_create_layer(view_get_wport(0)/2, view_get_hport(0)/2, "GUI", btn_menu_resume);
	exitbtn = instance_create_layer(view_get_wport(0)/2, 7*view_get_hport(0)/10, "GUI", btn_menu_quit);
}
