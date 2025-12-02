///@description If want to be gluedTo, set it
//it doesn't work when its in create event because not everything is initialized

if(self.gluedTo != self && self.gluedTo == pointer_null && self.idGluedTo != 0){

	var instancePhoneNumber = self;
	if(self.idGluedTo != 0){
		var lookingFor = self.idGluedTo;
		
		show_debug_message("obj_tile_parent is searching for true love");
		with(obj_block_parent){
			show_debug_message(self.collisionId);
			if(self.collisionId == lookingFor){
				show_debug_message("matched");
				instancePhoneNumber = self;
			}
		}
	}
	self.gluedTo = instancePhoneNumber;

	if(self.gluedTo != self){
		show_debug_message("my x:"+string(self.x)+" other x:"+string(self.gluedTo.x));
		self.offsetTarget_x = self.x - self.gluedTo.x;
		self.offsetTarget_y = self.y - self.gluedTo.y;
	}
}