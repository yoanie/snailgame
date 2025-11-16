///@description If drop allowed, give player tooltip on action


self.canDropItemHere = !position_meeting(mouse_x, mouse_y, obj_wall_parent) &&
	self.inventory[self.selectedItemPointer] != pointer_null &&
	power(mouse_x - obj_snail.x, 2)+power(mouse_y - obj_snail.y, 2) <= power(obj_snail.itemReach * 2, 2);

if (obj_cursorStateController.cursorState == "item" && self.canDropItemHere){
		
	obj_cursorStateController.currentTooltipMessage = "[Right-click] Drop "+self.inventory[self.selectedItemPointer].name;
}