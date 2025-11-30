if(instance_exists(obj_tutorial_background)) {
	instance_destroy(obj_tutorial_background);
	
	btn_menu_quit.image_alpha = 1;
	btn_menu_resume.image_alpha = 1;
	btn_tutorial.image_alpha = 1;
	
	return;
}

event_user(0);