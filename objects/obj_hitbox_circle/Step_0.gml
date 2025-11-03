if(instance_exists(obj_snail) && self.affectsSnail && distance_to_object(obj_snail)<self.radius){
	
	obj_snail.hitboxTouchingId = self.collisionId;
	with(obj_snail){
		event_user(1);
	}
}

if(instance_exists(obj_human) && self.affectsHuman && distance_to_object(obj_human)<self.radius){
	show_debug_message("hitbox is hitboxing (human)");
	obj_human.hitboxTouchingId = self.collisionId;
	with(obj_human){
		event_user(1);
	}
}
