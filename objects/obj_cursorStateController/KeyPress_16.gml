if(!instance_exists(obj_snail) && obj_snail.state == -1){ return; }

if(self.cursorState == "normal"){
	cursorState = "item";
	obj_cursor.sprite_index = spr_cursor_item;
} else {
	cursorState = "normal";
	obj_cursor.sprite_index = spr_cursor_normal;
}