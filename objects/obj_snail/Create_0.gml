///@description Calculuate Elevation Level and Reachable Objects

elevationLevel = elevationSet(self.layer);
above = reidentifyUpperElevationObjects(elevationLevel);
below = reidentifyLowerElevationObjects(elevationLevel);
