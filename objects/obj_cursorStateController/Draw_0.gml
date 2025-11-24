///@description Draw cursor and tooltip

if(cursorState == "normal"){
	draw_sprite(spr_cursor_normal, -1, mouse_x, mouse_y);
} else if(cursorState == "menu") {
	draw_sprite(spr_cursor_normal, -1, mouse_x, mouse_y);
} else if(cursorState == "item"){
	draw_sprite(spr_cursor_item, -1, mouse_x, mouse_y);
}

self.currentTooltipMessage = self.tooltip_left + self.tooltip_right;

if(self.currentTooltipMessage != ""){
	var offset = [35, 35];
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_font(fnt_tooltip);
	
	var clr = ((self.cursorState == "normal" || self.cursorState = "menu") ? c_white : c_lime);
	text_drop_shadow(mouse_x+offset[0], mouse_y+offset[1], clr, c_black, self.currentTooltipMessage, -1, -1);
}

