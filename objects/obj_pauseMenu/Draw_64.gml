if(self.menuIsUp){
	draw_set_colour(c_white);
	draw_set_alpha(0.2);
	draw_rectangle(0,0,room_width,room_height,false);
	draw_set_colour(c_red);
	draw_set_alpha(1);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed(view_get_wport(0)/2, view_get_hport(0)/2, "Game Paused\nPress ESC to unpause.", 3, 3, 0);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}