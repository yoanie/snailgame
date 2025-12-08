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
	case -10: //human crushing hitbox
		obj_menu_end.end_state = 0;
		event_user(2);
		break;
}

