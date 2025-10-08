if(self.bbox_top == obj_snail.bbox_bottom) {
	self.y += obj_snail.moveSpeed
} else if(self.bbox_bottom = obj_snail.bbox_top) {
	self.y -= obj_snail.moveSpeed
} else if(self.bbox_left = obj_snail.bbox_right) {
	self.x += obj_snail.moveSpeed
} else {
	self.x -= obj_snail.moveSpeed
}