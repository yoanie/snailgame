if(instance_exists(obj_tutorial_background)) {
	return;
}

audio_play_sound(sfx_click, 1, false);

instance_create_layer(view_get_wport(0)/2, view_get_hport(0)/2, "GUI", obj_tutorial_background);