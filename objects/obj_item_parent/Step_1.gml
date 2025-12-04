///@description Set depth & give tooltip when applicable
depth = -y;

//If pickup allowed, give player tooltip on action
if (obj_snail.elevationLevel == self.elevationLevel &&
	self.isMouseHovering && 
	distance_to_object(obj_snail) <= obj_snail.itemReach &&
	obj_cursorStateController.cursorState=="item"){
		
		
		if(obj_invController.inventory[obj_invController.selectedItemPointer] != pointer_null &&
			obj_invController.inventory[obj_invController.selectedItemPointer].item_combines_with_name == self.name){
		
			obj_cursorStateController.tooltip_right += "[Right-click] Combine "+self.name+" with "+self.item_combines_with_name+"\n";
			obj_invController.canCombineItemHere = true;
		} else {
			obj_cursorStateController.tooltip_left += "[Left-click] Pick up "+self.name+"\n";
			
		}
		/*self.isSelfInteractable = 
			obj_invController.inventory[obj_invController.selectedItemPointer] != pointer_null &&
			obj_invController.inventory[obj_invController.selectedItemPointer].item_combines_with_name == self.name;
		*/
}