if (obj_invController.canCombineItemHere &&
	obj_cursorStateController.cursorState=="item") {
	
	show_debug_message("combined!");
	instance_create_layer(self.x, self.y, findLayerNameOfElevationLevel(self.elevationLevel), self.item_combines_into);
	obj_invController.inventory[obj_invController.selectedItemPointer] = pointer_null;
	instance_destroy(self);
	
}