///@description Get pushed by Snail, if pushable

if(isPushable){
	if(place_meeting(self.bbox_left, y, obj_snail)) {
		self.x += obj_snail.moveSpeed
	} else if(place_meeting(self.bbox_right, y, obj_snail)) {
		self.x -= obj_snail.moveSpeed
	} else if(place_meeting(x, self.bbox_top, obj_snail)) {
		self.y += obj_snail.moveSpeed
	} else if(place_meeting(x, self.bbox_bottom, obj_snail)) {
		self.y -= obj_snail.moveSpeed
	}
}
