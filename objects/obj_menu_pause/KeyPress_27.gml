if(room_get_name(room) != "rm_newMain") {
	return;
}

if(instance_exists(obj_tutorial_background)) {
	instance_destroy(obj_tutorial_background);
	return;
}

event_user(0);