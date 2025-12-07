
var newX = self.x;
var newY = self.y;

if (isPushable && 
	self.elevationLevel == obj_snail.elevationLevel /* && 
		((self.bbox_top > obj_snail.bbox_bottom &&
		 self.bbox_left < obj_snail.bbox_right) ||
		(self.bbox_top > obj_snail.bbox_bottom &&
		 self.bbox_right > obj_snail.bbox_left) ||
		 
		(self.bbox_bottom < obj_snail.bbox_top &&
		 self.bbox_left < obj_snail.bbox_right) ||
		(self.bbox_bottom < obj_snail.bbox_top &&
		 self.bbox_right > obj_snail.bbox_left))
		 */
		 ){
		
	show_debug_message("intersect")
	var margin = 2

	// Left side
	if (collision_rectangle(bbox_left - margin, bbox_top, bbox_left, bbox_bottom, obj_snail, false, false)) 
	{
	    newX += obj_snail.moveSpeed
	}

	// Right side
	else if (collision_rectangle(bbox_right, bbox_top, bbox_right + margin, bbox_bottom, obj_snail, false, false))
	{
	    newX -= obj_snail.moveSpeed
	}
	
	else if(place_meeting(x, self.bbox_top, obj_snail)) {
		newY += obj_snail.moveSpeed
	} else if(place_meeting(x, self.bbox_bottom, obj_snail)) {
		newY -= obj_snail.moveSpeed
	}
}

if(!place_meeting(newX, newY, obj_wall_parent)){
	self.x = newX;
	self.y = newY;
}