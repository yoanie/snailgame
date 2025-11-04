var path = path_add();

/*
if(mp_linear_path(path, mouse_x, mouse_y, 2, false)) {
	path_start(path, 2, path_action_stop, true);
} else if(mp_grid_path(grid, path, self.x, self.y, mouse_x, mouse_y, true)) {
	path_set_kind(path, 1);
	path_start(path, 2, path_action_stop, true);
}
*/



if(mp_grid_path(grid, path, self.x, self.y, mouse_x, mouse_y, true)) {
	path_set_kind(path, 1);
	path_start(path, 2, path_action_stop, true);
}
