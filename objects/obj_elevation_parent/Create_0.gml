///@description Calculuate Elevation Level

//we could technically check the layer variable every time we want to check the elevation,
//but i feel like it's simpler to set it here
elevationLevel = elevationSet(self.layer);
//show_debug_message(elevationLevel);

shdDimParams = shader_get_uniform(shd_dim, "params");
shdGhostParams = shader_get_uniform(shd_ghost, "params");
