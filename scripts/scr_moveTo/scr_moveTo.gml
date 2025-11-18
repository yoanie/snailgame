function moveTo(node, moveSpeed){
	// Create a new path
	var path = path_add();
	
	// Set the path to go from the object that called the function to the other object (node)
	mp_grid_path(obj_gridController.grid, path, self.x, self.y, node.x, node.y, true);
	
	// Make the path smooth
	path_set_kind(path, 1);
	
	// Start the path using a move speed and do not repeat
	path_start(path, moveSpeed, path_action_stop, false);
}