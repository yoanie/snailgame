///@description Set elevationCandidate for Climbing up or down

self.elevationCandidate = pointer_null;

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
			self.elevationCandidate = inst;
			//show_debug_message(self.elevationCandidate);
			obj_cursorStateController.currentTooltipMessage += "[Right-click] Climb up\n";
			
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
			self.elevationCandidate = inst;
			//show_debug_message(self.elevationCandidate);
			obj_cursorStateController.currentTooltipMessage += "[Right-click] Climb down\n";
			
			//event_user(0);
			return;
		}
	}
}

//show_debug_message("found nothing! its a sad day for snail. :(");