function MoveSelfToNode(node){
	var path = path_add();
	mp_grid_path(obj_gridController.grid, path, self.x, self.y, node.x, node.y, true);
	path_set_kind(path, 1);
	path_start(path, 10, path_action_stop, true);
}