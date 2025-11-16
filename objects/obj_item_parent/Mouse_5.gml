if (distance_to_object(obj_snail) <= itemPickupRange &&
	obj_cursorStateController.cursorState == "normal") {
	
	show_debug_message("touched!");
	var nextAvail = findNextEmptyIndexInInventory(obj_invController.inventory);
	show_debug_message(nextAvail);
	show_debug_message(obj_invController.inventory);
	if(nextAvail != -1){
		obj_invController.inventory[nextAvail] = self;
		instance_destroy(self);
	}
}