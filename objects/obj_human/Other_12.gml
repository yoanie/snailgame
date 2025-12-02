///@description Human perish

show_debug_message("human shall die");
with(obj_menu_end){
	self.menuIsUp = false;
	event_user(0);
}
path_end();
alarm[0] = 0;
self.state = -1;
obj_cursorStateController.cursorState = "normal";
audio_stop_sound(mus_gameplayMusic);
audio_stop_sound(sfx_humanWalking)
audio_play_sound(sfx_humanDying, 1, false);