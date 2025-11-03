///@description Get hit by a hitbox
//a hitbox will call this event for the object, 
//no need to call it yourself, unless you want to trigger
//the effects of the last collided hitbox.

//the hitbox should be in charge of setting hitboxTouchingId
show_debug_message("("+object_get_name(self.object_index)+"): colliding w/ hitbox id: " + string(hitboxTouchingId));