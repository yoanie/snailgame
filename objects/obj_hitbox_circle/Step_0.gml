//if gluedTo, teleport to instance the id of instance

//show_debug_message(gluedToInstanceId);
if(gluedTo != -4){
	//show_debug_message(instance_id_get(gluedToInstanceId));
	self.x = gluedTo.x;
	self.y = gluedTo.y;
}

//show_debug_message(string(self.x) + ", " + string(self.y));

if(instance_exists(obj_snail) && self.affectsSnail && 
	point_distance(x+x_offset, y+y_offset, obj_snail.x, obj_snail.y)<=self.radius){
	
	obj_snail.hitboxTouching = self; //for more specific object interactions
	obj_snail.hitboxTouchingId = self.collisionId; //for otherwise
	with(obj_snail){
		event_user(1);
	}
}

//if(self.collisionId != -10 && self.collisionId != 25 && self.collisionId != 29)
//	show_debug_message(string(self.collisionId) + ": " + string(point_distance(x+x_offset, y+y_offset, obj_human.x, obj_human.y)) + " <= " + string(self.radius));

if(instance_exists(obj_human) && self.affectsHuman && 
	point_distance(x+x_offset, y+y_offset, obj_human.x, obj_human.y)<=self.radius){
	//show_debug_message("hitbox is hitboxing (human)");
	
	obj_human.hitboxTouching = self; //for more specific object interactions
	obj_human.hitboxTouchingId = self.collisionId; //for otherwise
	with(obj_human){
		event_user(1);
	}
}
