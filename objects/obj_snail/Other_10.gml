///@description Change Elevation

var newElevation = findLayerNameOfElevationLevel(elevationLevel);
//if(newElevation != "oob"){ // commented out b/c never going to be out of bounds as long as we check for it
	self.layer = layer_get_id(newElevation);
	self.depth = layer_get_depth(newElevation);
	
	//change camera's elevation too, otherwise unintended UI
	if(instance_exists(obj_camera)){
		obj_camera.layer = layer_get_id(newElevation);
		obj_camera.depth = layer_get_depth(newElevation);
	}
	
	above = reidentifyElevationObjects(elevationLevel+1);
	eyelevel = reidentifyElevationObjects(elevationLevel);
	below = reidentifyElevationObjects(elevationLevel-1);
	
	show_debug_message(self.elevationLevel);
//}
