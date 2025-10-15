///@description TODO: Check if Elevation Level Exists | Increase Elevation

var newElevationInt = elevationLevel+1;
var newElevation;
if(newElevationInt >= 0){
	newElevation = string(newElevationInt);
} else {
	newElevation = "sub" + string(abs(newElevationInt));
}

self.layer = layer_get_id("Instances_"+newElevation);
self.depth = layer_get_depth("Instances_"+newElevation);

show_debug_message(newElevationInt);
elevationLevel = newElevationInt;
