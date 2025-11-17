///@description If drop allowed, give player tooltip on action

self.canDropItemHere = self.inventory[self.selectedItemPointer] != pointer_null &&
	power(mouse_x - obj_snail.x, 2)+power(mouse_y - obj_snail.y, 2) <= power(obj_snail.itemReach * 2, 2);

if(obj_snail.elevationLevel == 0){
	self.canDropItemHere = self.canDropItemHere && 
		!position_meeting(mouse_x, mouse_y, obj_wall_parent);
} else {
	var relevantLayer = findLayerNameOfElevationLevel(obj_snail.elevationLevel);
	var allRelevantObjects = layer_get_all_elements(relevantLayer);
	//show_debug_message(allRelevantObjects);
	
	var foundOne = false;
	
	with(obj_tile_parent){
		if (position_meeting(mouse_x, mouse_y, id) &&
			self.elevationLevel == obj_snail.elevationLevel)
			foundOne = true;
	}

	//if(foundOne){ show_debug_message(foundOne); }
	self.canDropItemHere = self.canDropItemHere && foundOne;
}

if (obj_cursorStateController.cursorState == "item" && self.canDropItemHere){
		
	obj_cursorStateController.tooltip_right += "[Right-click] Drop "+self.inventory[self.selectedItemPointer].name+"\n";
}