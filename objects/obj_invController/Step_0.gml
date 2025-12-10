///@description Assign Tooltips

if(obj_snail.state == -1 || obj_menuController.globalMenuIsUp == true ){
	return;
}

if(self.canSwingItemHere  && self.inventory[self.selectedItemPointer] != pointer_null){
	obj_cursorStateController.tooltip_left += "[Left-click] Use "+self.inventory[self.selectedItemPointer].name+"\n";
}

if (obj_cursorStateController.cursorState == "item" 
	&& self.canDropItemHere && !self.canCombineItemHere && self.inventory[self.selectedItemPointer] != pointer_null){
		
	obj_cursorStateController.tooltip_right += "[Right-click] Drop "+self.inventory[self.selectedItemPointer].name+"\n";
}