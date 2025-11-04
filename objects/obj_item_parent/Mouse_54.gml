/*if((obj_snail.holdingItem == 0) && (grabState == -1) && (distance_to_object(obj_snail) <= 32)
	&& (mouse_x <= self.bbox_right) && (mouse_x >= self.bbox_left)
	&& (mouse_y <= self.bbox_bottom) && (mouse_y >= self.bbox_top)) {
	obj_snail.holdingItem = 1;
	grabState = 1;
} else if((obj_snail.holdingItem == 1) && (grabState == 1)) {
	var newX = obj_snail.x - obj_snail.sprite_width;
	var newY = obj_snail.y;
	
	if(!(place_meeting(newX, newY, obj_item_parent))) {
		obj_snail.holdingItem = 0;
		grabState = -1;
	
		self.x = newX;
		self.y = newY;
	}
}*/

if (distance_to_object(obj_snail) <= 32
	&& (mouse_x <= self.bbox_right) && (mouse_x >= self.bbox_left)
	&& (mouse_y <= self.bbox_bottom) && (mouse_y >= self.bbox_top)) {
	
	show_debug_message("touched!");
	var nextAvail = findNextEmptyIndexInInventory(obj_invController.inventory);
	show_debug_message(nextAvail);
	show_debug_message(obj_invController.inventory);
	if(nextAvail != -1){
		obj_invController.inventory[nextAvail] = self;
		instance_destroy(self);
	}
}