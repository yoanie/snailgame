if(obj_timeController.metaTimeHours == 7 && obj_timeController.metaTimeMinutes == 0) {
	var path = path_add();
	mp_linear_path(path, node_bed.x, node_bed.y, 2, false);
	path_start(path, 2, path_action_stop, true);

} else if(obj_timeController.metaTimeHours == 7 && obj_timeController.metaTimeMinutes == 15) {
	var path = path_add();
	mp_grid_path(grid, path, self.x, self.y, node_night_stand.x, node_night_stand.y, true);
	path_set_kind(path, 1);
	path_start(path, 10, path_action_stop, true);
} else if(obj_timeController.metaTimeHours == 7 && obj_timeController.metaTimeMinutes == 30) {
	var path = path_add();
	mp_grid_path(grid, path, self.x, self.y, node_toilet.x, node_toilet.y, true);
	path_set_kind(path, 1);
	path_start(path, 10, path_action_stop, true);
} else if(obj_timeController.metaTimeHours == 7 && obj_timeController.metaTimeMinutes == 40) {
	var path = path_add();
	mp_grid_path(grid, path, self.x, self.y, node_sink_bathroom.x, node_sink_bathroom.y, true);
	path_set_kind(path, 1);
	path_start(path, 10, path_action_stop, true);
} else if(obj_timeController.metaTimeHours == 7 && obj_timeController.metaTimeMinutes == 45) {
	var path = path_add();
	mp_grid_path(grid, path, self.x, self.y, node_counter_right.x, node_counter_right.y, true);
	path_set_kind(path, 1);
	path_start(path, 10, path_action_stop, true);
} else if(obj_timeController.metaTimeHours == 8 && obj_timeController.metaTimeMinutes == 15) {
	var path = path_add();
	mp_grid_path(grid, path, self.x, self.y, node_chair_left_dining.x, node_chair_left_dining.y, true);
	path_set_kind(path, 1);
	path_start(path, 10, path_action_stop, true);
} else if(obj_timeController.metaTimeHours == 9 && obj_timeController.metaTimeMinutes == 0) {
	var path = path_add();
	mp_grid_path(grid, path, self.x, self.y, node_chair_study.x, node_chair_study.y, true);
	path_set_kind(path, 1);
	path_start(path, 10, path_action_stop, true);
} else if(obj_timeController.metaTimeHours == 10 && obj_timeController.metaTimeMinutes == 30) {
	var path = path_add();
	mp_grid_path(grid, path, self.x, self.y, node_toilet.x, node_toilet.y, true);
	path_set_kind(path, 1);
	path_start(path, 10, path_action_stop, true);
} else if(obj_timeController.metaTimeHours == 10 && obj_timeController.metaTimeMinutes == 40) {
	var path = path_add();
	mp_grid_path(grid, path, self.x, self.y, node_sink_bathroom.x, node_sink_bathroom.y, true);
	path_set_kind(path, 1);
	path_start(path, 10, path_action_stop, true);
} else if(obj_timeController.metaTimeHours == 10 && obj_timeController.metaTimeMinutes == 45) {
	var path = path_add();
	mp_grid_path(grid, path, self.x, self.y, node_chair_study.x, node_chair_study.y, true);
	path_set_kind(path, 1);
	path_start(path, 10, path_action_stop, true);
} else if(obj_timeController.metaTimeHours == 12 && obj_timeController.metaTimeMinutes == 0) {
	var path = path_add();
	mp_grid_path(grid, path, self.x, self.y, node_counter_right.x, node_counter_right.y, true);
	path_set_kind(path, 1);
	path_start(path, 10, path_action_stop, true);
} else if(obj_timeController.metaTimeHours == 12 && obj_timeController.metaTimeMinutes == 30) {
	var path = path_add();
	mp_grid_path(grid, path, self.x, self.y, node_couch.x, node_couch.y, true);
	path_set_kind(path, 1);
	path_start(path, 10, path_action_stop, true);
} else if(obj_timeController.metaTimeHours == 13 && obj_timeController.metaTimeMinutes == 15) {
	var path = path_add();
	mp_grid_path(grid, path, self.x, self.y, node_chair_study.x, node_chair_study.y, true);
	path_set_kind(path, 1);
	path_start(path, 10, path_action_stop, true);
} else if(obj_timeController.metaTimeHours == 15 && obj_timeController.metaTimeMinutes == 0) {
	var path = path_add();
	mp_grid_path(grid, path, self.x, self.y, node_toilet.x, node_toilet.y, true);
	path_set_kind(path, 1);
	path_start(path, 10, path_action_stop, true);
} else if(obj_timeController.metaTimeHours == 15 && obj_timeController.metaTimeMinutes == 10) {
	var path = path_add();
	mp_grid_path(grid, path, self.x, self.y, node_sink_bathroom.x, node_sink_bathroom.y, true);
	path_set_kind(path, 1);
	path_start(path, 10, path_action_stop, true);
} else if(obj_timeController.metaTimeHours == 15 && obj_timeController.metaTimeMinutes == 15) {
	var path = path_add();
	mp_grid_path(grid, path, self.x, self.y, node_chair_study.x, node_chair_study.y, true);
	path_set_kind(path, 1);
	path_start(path, 10, path_action_stop, true);
} else if(obj_timeController.metaTimeHours == 17 && obj_timeController.metaTimeMinutes == 0) {
	var path = path_add();
	mp_grid_path(grid, path, self.x, self.y, node_counter_left.x, node_counter_left.y, true);
	path_set_kind(path, 1);
	path_start(path, 10, path_action_stop, true);
} else if(obj_timeController.metaTimeHours == 17 && obj_timeController.metaTimeMinutes == 10) {
	var path = path_add();
	mp_grid_path(grid, path, self.x, self.y, node_oven.x, node_oven.y, true);
	path_set_kind(path, 1);
	path_start(path, 10, path_action_stop, true);
} else if(obj_timeController.metaTimeHours == 17 && obj_timeController.metaTimeMinutes == 20) {
	var path = path_add();
	mp_grid_path(grid, path, self.x, self.y, node_counter_bottom.x, node_counter_bottom.y, true);
	path_set_kind(path, 1);
	path_start(path, 10, path_action_stop, true);
} else if(obj_timeController.metaTimeHours == 17 && obj_timeController.metaTimeMinutes == 30) {
	var path = path_add();
	mp_grid_path(grid, path, self.x, self.y, node_chair_left_dining.x, node_chair_left_dining.y, true);
	path_set_kind(path, 1);
	path_start(path, 10, path_action_stop, true);
} else if(obj_timeController.metaTimeHours == 18 && obj_timeController.metaTimeMinutes == 0) {
	var path = path_add();
	mp_grid_path(grid, path, self.x, self.y, node_couch.x, node_couch.y, true);
	path_set_kind(path, 1);
	path_start(path, 10, path_action_stop, true);
} else if(obj_timeController.metaTimeHours == 18 && obj_timeController.metaTimeMinutes == 30) {
	var path = path_add();
	mp_grid_path(grid, path, self.x, self.y, node_shelf_garage.x, node_shelf_garage.y, true);
	path_set_kind(path, 1);
	path_start(path, 10, path_action_stop, true);
} else if(obj_timeController.metaTimeHours == 19 && obj_timeController.metaTimeMinutes == 30) {
	var path = path_add();
	mp_grid_path(grid, path, self.x, self.y, node_shelf_left_storage.x, node_shelf_left_storage.y, true);
	path_set_kind(path, 1);
	path_start(path, 10, path_action_stop, true);
} else if(obj_timeController.metaTimeHours == 20 && obj_timeController.metaTimeMinutes == 0) {
	var path = path_add();
	mp_grid_path(grid, path, self.x, self.y, node_step_stool.x, node_step_stool.y, true);
	path_set_kind(path, 1);
	path_start(path, 10, path_action_stop, true);
} else if(obj_timeController.metaTimeHours == 21 && obj_timeController.metaTimeMinutes == 0) {
	var path = path_add();
	mp_grid_path(grid, path, self.x, self.y, node_shower.x, node_shower.y, true);
	path_set_kind(path, 1);
	path_start(path, 10, path_action_stop, true);
} else if(obj_timeController.metaTimeHours == 21 && obj_timeController.metaTimeMinutes == 20) {
	var path = path_add();
	mp_grid_path(grid, path, self.x, self.y, node_night_stand.x, node_night_stand.y, true);
	path_set_kind(path, 1);
	path_start(path, 10, path_action_stop, true);
} else if(obj_timeController.metaTimeHours == 21 && obj_timeController.metaTimeMinutes == 30) {
	var path = path_add();
	mp_grid_path(grid, path, self.x, self.y, node_bed.x, node_bed.y, true);
	path_set_kind(path, 1);
	path_start(path, 10, path_action_stop, true);
}