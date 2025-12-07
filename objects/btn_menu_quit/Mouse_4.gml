// Inherit the parent event
event_inherited();

if(instance_exists(obj_end_screen_parent)) {
	instance_destroy(obj_end_screen_parent);
}
