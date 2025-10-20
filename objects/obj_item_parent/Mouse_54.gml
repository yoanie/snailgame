if((grabState == -1) && (distance_to_object(obj_snail) <= 32)
	&& (mouse_x <= self.bbox_right) && (mouse_x >= self.bbox_left)
	&& (mouse_y <= self.bbox_bottom) && (mouse_y >= self.bbox_top)) {
	grabState = 1;
} else if(grabState == 1) {
	var newX = obj_snail.x - obj_snail.sprite_width;
	var newY = obj_snail.y;
	
	if(!(place_meeting(newX, newY, obj_item_parent))) {
		grabState = -1;
	
		self.x = newX;
		self.y = newY;
	}
}