if (obj_cursorStateController.cursorState == "item" && self.canDropItemHere){
	show_debug_message("dropping item " + inventory[selectedItemPointer].name);
	
	var newX = mouse_x;
	var newY = mouse_y;
	var lyr = findLayerNameOfElevationLevel(obj_snail.elevationLevel);
	
	show_debug_message(lyr);
	var droppedItem = instance_create_layer(newX, newY, lyr, inventory[selectedItemPointer].object_index);
	droppedItem.elevationLevel = obj_snail.elevationLevel;
	inventory[selectedItemPointer] = pointer_null;
	show_debug_message(droppedItem.elevationLevel);
} else if (obj_cursorStateController.cursorState=="item" && self.canCombineItemHere && !self.canDropItemHere ) {
	//handled in obj_item_parent -> right pressed
	
}

self.canDropItemHere = false;
self.canCombineItemHere = false;