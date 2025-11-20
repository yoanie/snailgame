///@description Calculuate Elevation Level

elevationLevel = elevationSet(self.layer);
//show_debug_message(elevationLevel);

shdDimParams = shader_get_uniform(shd_dim, "params");
shdGhostParams = shader_get_uniform(shd_ghost, "params");
