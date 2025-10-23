if(self.pauseMenuIsUp){
	draw_set_alpha(0.2);
	draw_set_colour(c_white);
	draw_rectangle(0, 0, view_wport[0], view_hport[0], false)
	draw_set_alpha(1);
	
	draw_set_colour(c_black);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed(view_wport[0]/2, view_hport[0]/2, "Game Paused\nPress ESC again to unpause", 3, 3, 0);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}