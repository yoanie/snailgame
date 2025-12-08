///@description Get hit by a hitbox
//a hitbox will call this event for the object, 
//no need to call it yourself, unless you want to trigger
//the effects of the last collided hitbox.

//the hitbox should be in charge of setting hitboxTouching

if(self.state == -1){
	return; //if ded can't detec
}


show_debug_message("("+object_get_name(self.object_index)+"): ");
show_debug_message("	colliding w/ hitbox id: " + string(self.hitboxTouchingId));

switch (self.hitboxTouchingId){
	case -8: //flamethrower flame
		obj_menu_end.end_state = 3;
		event_user(2);
		break;
	case 25: //banana peel
		self.state = 2;
		self.hitbox.affectsSnail = false;
		
		with(obj_banana_peel) {
			instance_destroy(hitbox);
			instance_destroy(self);
		}
		
		alarm[0] = 10 * game_get_speed(gamespeed_fps); 
		break;
	case 28: //knife hitbox
		show_debug_message("hit by knife");
		if(self.state == 2){
			obj_menu_end.end_state = 1;
			event_user(2);
		}
		break;
	case 29: //beartrap hitbox
		obj_menu_end.end_state = 2;
		obj_bearTrap.image_index = 1;
		audio_play_sound(sfx_bearTrap, 15, -1);
		event_user(2);
		break;
	case -62: //poison gas from used air purifier
		self.poisonProgression += 1/game_get_speed(gamespeed_fps);
		if(self.poisonProgression >= 10){
			obj_menu_end.end_state = 4;
			event_user(2);
		}
		break;

}