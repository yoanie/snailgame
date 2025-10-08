/*
if(self.bbox_bottom == obj_snail.bbox_top) {
	self.y -= obj_snail.moveSpeed
} else if(self.bbox_top == obj_snail.bbox_bottom) {
	self.y += obj_snail.moveSpeed
} else if(self.bbox_right == obj_snail.bbox_left) {
	self.x -= obj_snail.moveSpeed
} else if(self.bbox_left == obj_snail.bbox_right) {
	self.x += obj_snail.moveSpeed
}
*/

if(place_meeting(self.bbox_left, y, obj_snail)) {
	self.x += obj_snail.moveSpeed
} else if(place_meeting(self.bbox_right, y, obj_snail)) {
	self.x -= obj_snail.moveSpeed
} else if(place_meeting(x, self.bbox_top, obj_snail)) {
	self.y += obj_snail.moveSpeed
} else if(place_meeting(x, self.bbox_bottom, obj_snail)) {
	self.y -= obj_snail.moveSpeed
}