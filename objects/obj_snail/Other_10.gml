///@description Change Elevation

var newElevation = findLayerNameOfElevationLevel(elevationLevel);
//if(newElevation != "oob"){ //never going to be out of bounds as long as we check for it
	self.layer = layer_get_id(newElevation);
	self.depth = layer_get_depth(newElevation);
	
	above = reidentifyUpperElevationObjects(elevationLevel);
	below = reidentifyLowerElevationObjects(elevationLevel);
//}

show_debug_message(self.elevationLevel);
