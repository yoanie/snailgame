//if gluedTo, teleport to instance the id of instance

//show_debug_message(gluedToInstanceId);
if(gluedTo != -4){
	//show_debug_message(instance_id_get(gluedToInstanceId));
	self.x = gluedTo.x;
	self.y = gluedTo.y;
}