function checkTime(){
	
	if(obj_timeController.metaTimeHours == 7 && obj_timeController.metaTimeMinutes == 0) {
		var path = path_add();
		mp_linear_path(path, node_bed.x, node_bed.y, self.moveSpeed/2, false);
		path_start(path, self.moveSpeed/2, path_action_stop, false);
	
	} else if(obj_timeController.metaTimeHours == 8 && obj_timeController.metaTimeMinutes == 0) {
		moveTo(node_counter_right, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 9 && obj_timeController.metaTimeMinutes == 30) {
		moveTo(node_chair_kitchen, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 11 && obj_timeController.metaTimeMinutes == 30) {
		moveTo(node_chair_bedroom, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 15 && obj_timeController.metaTimeMinutes == 30) {
		moveTo(node_counter_right, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 17 && obj_timeController.metaTimeMinutes == 0) {
		moveTo(node_couch, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 19 && obj_timeController.metaTimeMinutes == 0) {
		moveTo(node_backyard, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 21 && obj_timeController.metaTimeMinutes == 0) {
		moveTo(node_toilet, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 21 && obj_timeController.metaTimeMinutes == 45) {
		moveTo(node_bed, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 21 && obj_timeController.metaTimeMinutes == 50) {
		var path = path_add();
		mp_linear_path(path, obj_bed.x, obj_bed.y, self.moveSpeed/2, false);
		path_start(path, self.moveSpeed/2, path_action_stop, false);	
	}
}