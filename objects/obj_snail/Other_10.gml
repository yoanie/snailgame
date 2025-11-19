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
	
	
	var cornersX = [self.bbox_left, self.bbox_right, self.bbox_right, self.bbox_left];
	var cornersY = [self.bbox_top, self.bbox_top, self.bbox_bottom, self.bbox_bottom];
	snugLedges( sign( mouse_x-self.x)*sprite_get_width (self.elevationCandidate.sprite_index), 
				sign(-mouse_y+self.y)*sprite_get_height(self.elevationCandidate.sprite_index), 
				cornersX, cornersY, self.elevationLevel);
	
	show_debug_message(self.elevationLevel);
//}
