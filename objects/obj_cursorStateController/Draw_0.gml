
if(cursorState == "normal"){
	draw_sprite(spr_cursor_normal, -1, mouse_x, mouse_y);
} else {
	draw_sprite(spr_cursor_item, -1, mouse_x, mouse_y);
}
if(self.currentTooltipMessage != ""){
	var offset = [35, 35];
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fnt_tooltip);
	//draw_text(mouse_x+40, mouse_y+40, self.currentTooltipMessage);
	text_drop_shadow(mouse_x+offset[0], mouse_y+offset[1], c_white, c_black, self.currentTooltipMessage, -1, -1);
}