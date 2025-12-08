if(self.menuIsUp){
	draw_set_colour(c_white);
	draw_set_alpha(0.2);
	draw_rectangle(0,0,room_width,room_height,false);
	draw_set_colour(c_red);
	draw_set_alpha(1);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(fnt_menu);
	
	if(self.end_state == 0) {
		if(!instance_exists(obj_loss_screen)) {
			instance_create_layer(view_get_wport(0)/2, view_get_hport(0)/2, "GUI", obj_loss_screen);
		}
	} else {
		if(!instance_exists(obj_win_screen)) {
			instance_create_layer(view_get_wport(0)/2, view_get_hport(0)/2, "GUI", obj_win_screen);
		}
		draw_text_transformed(5*view_get_wport(0)/12, view_get_hport(0)/2, "You used method " + string(self.end_state) + " of 4", 2, 2, 0);
	}
	
	if(!instance_exists(btn_menu_quit)) {
		var quitbtn = instance_create_layer(view_get_wport(0)/2, 8*view_get_hport(0)/10, "GUI", btn_menu_quit);
		quitbtn.allegiantTo = self;
	}
}