///@description Increase Elevation

self.layer = layer_get_id("Instances_"+string(elevationLevel+1));
self.depth = layer_get_depth("Instances_"+string(elevationLevel+1));
elevationLevel = int64(string_digits(layer_get_name(layer)));

