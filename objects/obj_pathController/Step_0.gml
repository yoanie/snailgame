/*
with(obj_human) {
	var snail_direction = point_direction(self.x, self.y, obj_snail.x, obj_snail.y);
	
	if(collision_line(self.x, self.y, obj_snail.x, obj_snail.y, obj_wall_parent, false, true) != noone) {
		return;
	}
	
	if(collision_circle(self.x, self.y, 128, obj_snail, false, true)) {
		moveTo(obj_snail, self.moveSpeed);
		return;
	}
	
	if(!(snail_direction >= self.direction-75 && snail_direction <= self.direction+75)) {
		return;
	}
	
	moveTo(obj_snail, self.moveSpeed);
	self.state = 1;
}
*/