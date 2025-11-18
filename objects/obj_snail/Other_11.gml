///@description Get hit by a hitbox
//a hitbox will call this event for the object, 
//no need to call it yourself, unless you want to trigger
//the effects of the last collided hitbox.

//the hitbox should be in charge of setting hitboxTouching

show_debug_message("("+object_get_name(self.object_index)+"): ");
show_debug_message("	colliding w/ hitbox id: " + string(self.hitboxTouchingId));

if(self.state == -1){
	return; //if ded can't detec
}

switch (self.hitboxTouchingId){
	case -10: //human crushing hitbox
		show_debug_message("snail shall die");
		with(obj_menu_end){
			event_user(0);
			
		}
		self.state = -1;
		audio_stop_sound(mus_gameplayMusic)
		audio_play_sound(sfx_humanDying, 1, false)
		break;
}

