///@description Calculate wheel rotation angle

var targetRotation = 360-(90*obj_invController.selectedItemPointer);

if(targetRotation - self.image_angle > 0){
	//force clockwise rotation always
	self.image_angle += 360;
}
self.image_angle += (targetRotation - self.image_angle)*0.621/2;
//show_debug_message(self.image_angle);