if(obj_timeController.metaTimeHours == 7 && obj_timeController.metaTimeMinutes == 0) {
	var path = path_add();
	mp_linear_path(path, self.x, obj_bed.bbox_top - self.sprite_height/2, 2, false);
	path_start(path, 2, path_action_stop, true);

} else if(obj_timeController.metaTimeHours == 7 && obj_timeController.metaTimeMinutes == 30) {
	var path = path_add();
	mp_grid_path(grid, path, self.x, self.y, obj_toilet.bbox_right + self.sprite_width/2, obj_toilet.y, true);
	path_set_kind(path, 1);
	path_start(path, 10, path_action_stop, true);
} else if(obj_timeController.metaTimeHours == 7 && obj_timeController.metaTimeMinutes == 45) {
	var path = path_add();
	mp_grid_path(grid, path, self.x, self.y, obj_counter_right.bbox_left - self.sprite_width/2, obj_counter_right.y, true);
	path_set_kind(path, 1);
	path_start(path, 10, path_action_stop, true);
} else if(obj_timeController.metaTimeHours == 8 && obj_timeController.metaTimeMinutes == 15) {
	var path = path_add();
	mp_grid_path(grid, path, self.x, self.y, obj_chair_left_dining.bbox_left - self.sprite_width/2, obj_chair_left_dining.y, true);
	path_set_kind(path, 1);
	path_start(path, 10, path_action_stop, true);
} else if(obj_timeController.metaTimeHours == 9 && obj_timeController.metaTimeMinutes == 0) {
	var path = path_add();
	mp_grid_path(grid, path, self.x, self.y, obj_chair_study.bbox_right + self.sprite_width/2, obj_chair_study.y, true);
	path_set_kind(path, 1);
	path_start(path, 10, path_action_stop, true);
} else if(obj_timeController.metaTimeHours == 10 && obj_timeController.metaTimeMinutes == 30) {
	var path = path_add();
	mp_grid_path(grid, path, self.x, self.y, obj_toilet.bbox_right + self.sprite_width/2, obj_toilet.y, true);
	path_set_kind(path, 1);
	path_start(path, 10, path_action_stop, true);
} else if(obj_timeController.metaTimeHours == 10 && obj_timeController.metaTimeMinutes == 45) {
	var path = path_add();
	mp_grid_path(grid, path, self.x, self.y, obj_chair_study.bbox_right + self.sprite_width/2, obj_chair_study.y, true);
	path_set_kind(path, 1);
	path_start(path, 10, path_action_stop, true);
} else if(obj_timeController.metaTimeHours == 12 && obj_timeController.metaTimeMinutes == 0) {
	var path = path_add();
	mp_grid_path(grid, path, self.x, self.y, obj_counter_right.bbox_left - self.sprite_width/2, obj_counter_right.y, true);
	path_set_kind(path, 1);
	path_start(path, 10, path_action_stop, true);
}