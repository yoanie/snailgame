if(instance_exists(obj_tutorial_background)) {
	return;
}

audio_stop_sound(mus_menu_endscreen)
audio_stop_sound(mus_gameplayMusic)
audio_stop_sound(sfx_humanWalking)
audio_play_sound(sfx_click, 1, false)

with(self.allegiantTo){
	event_user(0);
}
room_goto(roomToGoTo);

