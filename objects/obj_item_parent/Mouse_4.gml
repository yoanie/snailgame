//@description drop item/combine items

if(obj_snail.state == -1){ return; }

if(distance_to_object(obj_snail) > obj_snail.itemReach || !self.isMouseHovering)
	return;

if (self.isSelfInteractable && !self.tooHeavyToBePickedUp &&
	obj_cursorStateController.cursorState == "item") {
	
	show_debug_message("touched!");
	var nextAvail = findNextEmptyIndexInInventory(obj_invController.inventory);
	show_debug_message(nextAvail);
	show_debug_message(obj_invController.inventory);
	if(nextAvail != -1){
		audio_play_sound(sfx_itemPickup, 0, false);
		obj_invController.inventory[nextAvail] = self;
		
		//to prevent objects with everlasting hitboxes having their hitbox linger there
		//only works if there is only one of these items in room.
		var probablyHitboxId = abs(self.internal_id);
		with(obj_hitbox_circle){
			if(probablyHitboxId == abs(self.collisionId))
				instance_destroy(self);
		}
		
		instance_destroy(self);
	}
} else if (obj_cursorStateController.cursorState=="item" && 
	obj_invController.canCombineItemHere) {
	
	show_debug_message("combined!");
	instance_create_layer(self.x, self.y, findLayerNameOfElevationLevel(self.elevationLevel), self.item_combines_into);
	obj_invController.inventory[obj_invController.selectedItemPointer] = pointer_null;
	instance_destroy(self);
	
}