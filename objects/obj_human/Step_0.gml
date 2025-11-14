// Checks if the human is actually moving
if(self.prev_x == self.x && self.prev_y == self.y) {
	return;
}

// Determines the angle the human is moving at
var current_direction = point_direction(self.prev_x, self.prev_y, self.x, self.y);

// Moving right
if(current_direction > 315 || current_direction <= 45) {
	self.sprite_index = spr_human_sideStatic;
	self.image_xscale = 1;
	self.direction = 0;

// Moving up
} else if(current_direction > 45 && current_direction <= 135) {
	self.sprite_index = spr_human_backStatic;
	self.image_xscale = 1;
	self.direction = 90;

// Moving left
} else if(current_direction > 135 && current_direction <= 225) {
	self.sprite_index = spr_human_sideStatic;
	self.image_xscale = -1;
	self.direction = 180;
	
// Moving down
} else {
	self.sprite_index = spr_human_frontStatic;
	self.image_xscale = 1;
	self.direction = 270;
}

// Update prev_x and prev_y for next step
self.prev_x = self.x;
self.prev_y = self.y;