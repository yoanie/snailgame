///@description Test path
var path = path_add();
mp_linear_path(path, mouse_x, mouse_y, 4, false);
path_start(path, 4, path_action_stop, false);