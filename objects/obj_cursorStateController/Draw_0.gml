
if(cursorState == "normal"){
	draw_sprite(spr_cursor_normal, -1, mouse_x, mouse_y);
} else {
	draw_sprite(spr_cursor_item, -1, mouse_x, mouse_y);
}