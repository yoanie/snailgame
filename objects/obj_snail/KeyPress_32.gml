///@description TODO: Consolidate into Right Click Menu | Increase Elevation

var newElevation = findLayerNameOfElevationLevel(elevationLevel + 1);
if(newElevation != "oob"){
	elevationLevel++;
	self.layer = layer_get_id(newElevation);
	self.depth = layer_get_depth(newElevation);
}

show_debug_message(self.elevationLevel);
