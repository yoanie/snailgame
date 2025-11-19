///@description Set elevationCandidate for Climbing up or down

self.elevationCandidateLevel = self.elevationLevel;

if (obj_cursorStateController.cursorState != "normal" ||
	power(mouse_x-self.x, 2) + power(mouse_y-self.y, 2) > power(self.itemReach*4, 2)){
	return;
}

//check tiles which are above snail first
var insts = ds_list_create();
instance_position_list(mouse_x, mouse_y, above, insts, true);

for(var i = 0; i < ds_list_size(insts); i++){
	var inst = insts[| i]; //gets inst from insts
	if (distance_to_object(inst) <= 64 &&
		object_get_parent(inst.object_index) == obj_tile_parent &&
		inst.elevationLevel - self.elevationLevel == 1){
			
		//show_debug_message("found one! its above snail.");
		self.elevationCandidateLevel = inst.elevationLevel;
		//show_debug_message(self.elevationCandidate);
		obj_cursorStateController.tooltip_right += "[Right-click] Climb up\n";
			
		//event_user(0);
		return;
	}
}

//check tiles which are below snail next
ds_list_clear(insts);
instance_position_list(mouse_x, mouse_y, below, insts, true);

for(var i = 0; i < ds_list_size(insts); i++){
	var inst = insts[| i]; //gets inst from insts
	if (distance_to_object(inst) <= 64 &&
		object_get_parent(inst.object_index) == obj_tile_parent &&
		inst.elevationLevel - self.elevationLevel == -1){
			
		//show_debug_message("found one! its below snail.");
		self.elevationCandidateLevel = inst.elevationLevel;
		
		//show_debug_message(self.elevationCandidate);
		obj_cursorStateController.tooltip_right += "[Right-click] Climb down\n";
			
		//event_user(0);
		return;
	}
}

//as a last resort, check if snail wants to get down. here, we check if its not a piece of furniture.
if(elevationLevel == 1){

obj_cursorStateController.tooltip_right += "[Right-click] Climb down\n";
self.elevationCandidateLevel = 0;
return;

/*
ds_list_clear(insts);
instance_position_list(mouse_x, mouse_y, below, insts, true);

//obj_grid_parent
for(var i = 0; i < ds_list_size(insts); i++){
	var inst = insts[| i]; //gets inst from insts
	if (distance_to_object(inst) <= 64 &&
		object_get_parent(inst.object_index) != obj_grid_parent && //not going in furniture
		inst.elevationLevel - self.elevationLevel == -1){
			
		//show_debug_message("found one! its below snail.");
		self.elevationCandidate = inst;
		//show_debug_message(self.elevationCandidate);
		obj_cursorStateController.tooltip_right += "[Right-click] Climb down\n";
			
		//event_user(0);
		return;
	}
}
*/
}

//show_debug_message("found nothing! its a sad day for snail. :(");