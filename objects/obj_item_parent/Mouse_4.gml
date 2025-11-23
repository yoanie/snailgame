//@description drop item/combine items

if(distance_to_object(obj_snail) > obj_snail.itemReach || !self.isMouseHovering)
	return;

if (self.isSelfInteractable &&
	obj_cursorStateController.cursorState == "item") {
	
	show_debug_message("touched!");
	var nextAvail = findNextEmptyIndexInInventory(obj_invController.inventory);
	show_debug_message(nextAvail);
	show_debug_message(obj_invController.inventory);
	if(nextAvail != -1){
		audio_play_sound(sfx_itemPickup, 0, false);
		obj_invController.inventory[nextAvail] = self;
		instance_destroy(self);
	}
} else if (obj_cursorStateController.canCombineItemHere &&
	obj_cursorStateController.cursorState=="item") {
	
	show_debug_message("combined!");
	instance_create_layer(self.x, self.y, findLayerNameOfElevationLevel(self.elevationLevel), self.item_combines_into);
	obj_invController.inventory[obj_invController.selectedItemPointer] = pointer_null;
	instance_destroy(self);
	
}