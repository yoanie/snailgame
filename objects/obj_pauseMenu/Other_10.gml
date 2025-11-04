///@description Trigger Menu

menuIsUp=!menuIsUp;
if(instance_exists(obj_timeController)){
	obj_timeController.timeIsFrozen = self.menuIsUp;
}
