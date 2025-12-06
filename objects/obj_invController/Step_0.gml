///@description Assign Tooltips

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