function checkTime(){
	
	if(obj_timeController.metaTimeHours == 7 && obj_timeController.metaTimeMinutes == 0) {
		var path = path_add();
		mp_linear_path(path, node_bed.x, node_bed.y, self.moveSpeed/2, false);
		path_start(path, self.moveSpeed/2, path_action_stop, false);
	
	} else if(obj_timeController.metaTimeHours == 7 && obj_timeController.metaTimeMinutes == 10) {
		moveTo(node_night_stand, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 7 && obj_timeController.metaTimeMinutes == 20) {
		moveTo(node_shelf_bedroom, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 7 && obj_timeController.metaTimeMinutes == 30) {
		moveTo(node_toilet, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 7 && obj_timeController.metaTimeMinutes == 40) {
		moveTo(node_sink_bathroom, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 7 && obj_timeController.metaTimeMinutes == 45) {
		moveTo(node_counter_right, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 8 && obj_timeController.metaTimeMinutes == 15) {
		moveTo(node_chair_kitchen, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 8 && obj_timeController.metaTimeMinutes == 30) {
		moveTo(node_couch, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 8 && obj_timeController.metaTimeMinutes == 55) {
		moveTo(node_chair_bedroom, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 10 && obj_timeController.metaTimeMinutes == 20) {
		moveTo(node_toilet, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 10 && obj_timeController.metaTimeMinutes == 30) {
		moveTo(node_sink_bathroom, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 10 && obj_timeController.metaTimeMinutes == 35) {
		moveTo(node_chair_bedroom, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 12 && obj_timeController.metaTimeMinutes == 0) {
		moveTo(node_counter_bottom, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 12 && obj_timeController.metaTimeMinutes == 15) {
		moveTo(node_counter_right, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 12 && obj_timeController.metaTimeMinutes == 25) {
		moveTo(node_chair_kitchen, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 12 && obj_timeController.metaTimeMinutes == 40) {
		moveTo(node_couch, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 13 && obj_timeController.metaTimeMinutes == 40) {
		moveTo(node_shelf_bedroom, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 14 && obj_timeController.metaTimeMinutes == 0) {
		moveTo(node_backyard, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 14 && obj_timeController.metaTimeMinutes == 50) {
		moveTo(node_chair_bedroom, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 17 && obj_timeController.metaTimeMinutes == 0) {
		moveTo(node_toilet, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 17 && obj_timeController.metaTimeMinutes == 10) {
		moveTo(node_sink_bathroom, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 17 && obj_timeController.metaTimeMinutes == 15) {
		moveTo(node_chair_bedroom, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 18 && obj_timeController.metaTimeMinutes == 10) {
		moveTo(node_counter_right, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 18 && obj_timeController.metaTimeMinutes == 20) {
		moveTo(node_oven, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 18 && obj_timeController.metaTimeMinutes == 40) {
		moveTo(node_counter_bottom, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 18 && obj_timeController.metaTimeMinutes == 50) {
		moveTo(node_chair_kitchen, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 19 && obj_timeController.metaTimeMinutes == 10) {
		moveTo(node_couch, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 21 && obj_timeController.metaTimeMinutes == 0) {
		moveTo(node_toilet, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 21 && obj_timeController.metaTimeMinutes == 15) {
		moveTo(node_shower, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 21 && obj_timeController.metaTimeMinutes == 30) {
		moveTo(node_sink_bathroom, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 21 && obj_timeController.metaTimeMinutes == 35) {
		moveTo(node_night_stand, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 21 && obj_timeController.metaTimeMinutes == 45) {
		moveTo(node_bed, self.moveSpeed);
	
	} else if(obj_timeController.metaTimeHours == 21 && obj_timeController.metaTimeMinutes == 50) {
		var path = path_add();
		mp_linear_path(path, obj_bed.x, obj_bed.y, self.moveSpeed/2, false);
		path_start(path, self.moveSpeed/2, path_action_stop, false);	
	}
}