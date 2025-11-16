///@description If drop allowed, give player tooltip on action

self.canDropItemHere = !position_meeting(mouse_x, mouse_y, obj_wall_parent) &&
	self.inventory[self.selectedItemPointer] != pointer_null;

if (obj_cursorStateController.cursorState == "item" && self.canDropItemHere){
		
	obj_cursorStateController.currentTooltipMessage = "[Right-click] Drop "+self.inventory[self.selectedItemPointer].name;
}