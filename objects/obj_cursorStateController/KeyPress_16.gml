if(!instance_exists(obj_snail) && obj_snail.state == -1){ return; }

if(self.cursorState == "normal"){
	cursorState = "item";
} else {
	cursorState = "normal";
}