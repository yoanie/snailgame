///@description Calculuate Elevation Level and Reachable Objects

elevationLevel = elevationSet(self.layer);
above = reidentifyElevationObjects(elevationLevel+1);
eyelevel = reidentifyElevationObjects(elevationLevel);
below = reidentifyElevationObjects(elevationLevel-1);
