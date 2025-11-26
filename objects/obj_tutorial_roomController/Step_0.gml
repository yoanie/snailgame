if(keyboard_check(vk_anykey) || mouse_check_button_pressed(mb_any)) {
	audio_stop_all();
	room_goto(rm_newMain);
}