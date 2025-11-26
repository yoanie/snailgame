///@description Snail perish

show_debug_message("snail shall die");
with(obj_menu_end){
	self.menuIsUp = false;
	event_user(0);
}
self.state = -1;
obj_cursorStateController.cursorState = "normal";
audio_stop_sound(mus_gameplayMusic);
audio_play_sound(sfx_snailDying, 1, false);
