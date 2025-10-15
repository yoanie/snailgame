///@description Calculuate Elevation Level

//we could technically check the layer variable every time we want to check the elevation,
//but i feel like it's simpler to set it here
//also, doesnt work for negative elevations yet.
elevationLevel = int64(string_digits(layer_get_name(layer)));
//show_debug_message(elevationLevel);
