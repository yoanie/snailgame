///@description Calculuate Elevation Level

//we could technically check the layer variable every time we want to check the elevation,
//but i feel like it's simpler to set it here
temp = string_copy(layer_get_name(layer), 11, 10);
if(string_copy(temp, 1, 3) == "sub"){
	temp = "-" + string_copy(temp, 4, 2);
}
elevationLevel = real(temp);
//show_debug_message(elevationLevel);
