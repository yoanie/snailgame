with(obj_human) {
	if(self.state == -1 || self.state == 2 || obj_menu_pause.menuIsUp || distance_to_object(obj_snail) > (20 * 64)) {
		return;
	}
	
	var snail_direction = point_direction(self.x, self.y, obj_snail.x, obj_snail.y);
	
	if(collision_line(self.x, self.y, obj_snail.x, obj_snail.y, obj_wall_parent, false, true) != noone || collision_line(self.x, self.y, obj_snail.x, obj_snail.y, obj_grid_parent, false, true) != noone) {
		if(self.state == 1) {
			path_end();
			if(self.hdirection == 90) {
				self.sprite_index = spr_human_back_s;
	
			} else if(self.hdirection == 270) {
				self.sprite_index = spr_human_front_s;
	
			} else if(self.hdirection == 0) {
				self.sprite_index = spr_human_side_s;
			} else {
				self.sprite_index = spr_human_left_s
			}
			self.state = 0;
		}
		return;
	}
	
	if(collision_circle(self.x, self.y, 128, obj_snail, false, true)) {
		moveTo(obj_snail, self.moveSpeed);
		return;
	}
	
	if(!(snail_direction >= self.hdirection-75 && snail_direction <= self.hdirection+75)) {
		return;
	}
	
	moveTo(obj_snail, self.moveSpeed);
	self.state = 1;
}
