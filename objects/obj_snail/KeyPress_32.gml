///@description TODO: Consolidate into Right Click Menu | Increase Elevation

///If object is near snail and is eligible, warp snail to object.

var insts = ds_list_create();
instance_position_list(mouse_x, mouse_y, obj_elevation_parent, insts, true);

for(var i = 0; i < ds_list_size(insts); i++){
	var inst = insts[| i]; //gets inst from insts
	if(distance_to_object(inst) <= 64){
		if(inst.elevationLevel - self.elevationLevel == 1){
			//show_debug_message("found one!");
			elevationLevel++;
			self.x = inst.x;
			self.y = inst.y;
			event_user(0);
			return;
		}
	}
}
