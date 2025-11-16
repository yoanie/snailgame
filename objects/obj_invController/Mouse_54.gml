if (obj_cursorStateController.cursorState == "item" && self.canDropItemHere){
	
	var newX = mouse_x;
	var newY = mouse_y;
	var lyr = findLayerNameOfElevationLevel(obj_snail.elevationLevel);
	instance_create_layer(newX, newY, lyr, inventory[selectedItemPointer].object_index);
	inventory[selectedItemPointer] = pointer_null;
}