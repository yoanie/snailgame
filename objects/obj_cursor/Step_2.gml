if(!obj_menu_pause.menuIsUp && obj_cursorStateController.cursorState == "item") {
	self.sprite_index = spr_cursor_item;
} else {
	self.sprite_index = spr_cursor_normal;
}