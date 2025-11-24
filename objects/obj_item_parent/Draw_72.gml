//set isSelfInteractable. used internally in item and is applicable to both cursor states.

//if(self.isMouseHovering){
	if(obj_cursorStateController.cursorState=="item"){
		self.isSelfInteractable = true;
	}/* else if(obj_cursorStateController.cursorState=="normal"){
		self.isSelfInteractable = 
			obj_invController.inventory[obj_invController.selectedItemPointer] != pointer_null &&
			obj_invController.inventory[obj_invController.selectedItemPointer].item_combines_with_name == self.name;
	}*/
 else {
	self.isSelfInteractable = false;
}

//show_debug_message(self.name + ": i work and my isSelfInteractable is: " + string(self.isSelfInteractable));