if(instance_exists(obj_pauseMenu) && !obj_pauseMenu.menuIsUp){
	instance_destroy(self);
} else if (!instance_exists(obj_pauseMenu)){
	instance_destroy(self);
}