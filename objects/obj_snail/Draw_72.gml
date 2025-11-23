///@description Set elevationCandidate for Climbing up or down

self.elevationCandidateLevel = self.elevationLevel;

if(obj_cursorStateController.cursorState != "normal"){
	return;
}

var insts = ds_list_create();
instance_position_list(mouse_x, mouse_y, above, insts, true);

for(var i = 0; i < ds_list_size(insts); i++){
	var inst = insts[| i]; //gets inst from insts
	if(distance_to_object(inst) <= 64){
		if(inst.elevationLevel - self.elevationLevel == 1){
			//show_debug_message("found one! its above snail.");
			self.elevationCandidateLevel = inst.elevationLevel;
			self.elevationCandidateX = inst.x;
			self.elevationCandidateY = inst.y;
			//show_debug_message(self.elevationCandidate);
			obj_cursorStateController.tooltip_right += "[Right-click] Climb up\n";
			
			//event_user(0);
			return;
		}
	}
}

ds_list_clear(insts);
instance_position_list(mouse_x, mouse_y, below, insts, true);

for(var i = 0; i < ds_list_size(insts); i++){
	var inst = insts[| i]; //gets inst from insts
	if(distance_to_object(inst) <= 64){
		if(inst.elevationLevel - self.elevationLevel == -1){
			//show_debug_message("found one! its below snail.");
			self.elevationCandidateLevel = inst.elevationLevel;
			self.elevationCandidateX = inst.x;
			self.elevationCandidateY = inst.y;
			//show_debug_message(self.elevationCandidate);
			obj_cursorStateController.tooltip_right += "[Right-click] Climb down\n";
			
			//event_user(0);
			return;
		}
	}
}


//as a last resort, check if snail wants to get down. here, we check if its not a piece of furniture.
if(elevationLevel == 1){

ds_list_clear(insts);
instance_position_list(mouse_x, mouse_y, below, insts, true);


	if (ds_list_size(insts)==0){
			
		//show_debug_message("found one! its below snail.");
		self.elevationCandidateLevel = 0;
		self.elevationCandidateX = mouse_x;
		self.elevationCandidateY = mouse_y;
		
		//show_debug_message(self.elevationCandidate);
		obj_cursorStateController.tooltip_right += "[Right-click] Climb down\n";
			
		ds_list_destroy(insts);
		return;
	}
}

ds_list_destroy(insts);

//show_debug_message("found nothing! its a sad day for snail. :(");