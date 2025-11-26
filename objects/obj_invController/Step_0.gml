///@description If drop allowed, give player tooltip on action

//show_debug_message("this is invController.\ncandrop: "+string(self.canDropItemHere)+" cancombine: "+string(self.canCombineItemHere));

self.canSwingItemHere = obj_cursorStateController.cursorState == "normal" && 
	inventory[self.selectedItemPointer] != pointer_null &&
	inventory[self.selectedItemPointer].canBeSwung;


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
	self.canDropItemHere = self.canDropItemHere && foundOne
}

self.canDropItemHere = self.canDropItemHere && !self.canCombineItemHere;

if(obj_snail.state == -1 || obj_menuController.globalMenuIsUp == true){
	return;
}

if(self.canSwingItemHere){
	obj_cursorStateController.tooltip_left += "[Left-click] Swing "+self.inventory[self.selectedItemPointer].name+"\n";
}

if (obj_cursorStateController.cursorState == "item" 
	&& self.canDropItemHere && !self.canCombineItemHere){
		
	obj_cursorStateController.tooltip_right += "[Right-click] Drop "+self.inventory[self.selectedItemPointer].name+"\n";
}