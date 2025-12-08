///@description Display time on sundial

if(obj_menu_pause.menuIsUp || obj_menu_end.menuIsUp) {
	return;
}

//draw sundial first
draw_sprite(gui_sundialSky, -1, view_wport, 0);
draw_sprite(gui_sundialBox, -1, view_wport, 0);

percentage_through_day = self.currentTime / self.endTime;
draw_sprite_ext(gui_sundialHand, -1, view_wport-161, 156, .30, .30, -percentage_through_day*180, c_white, 1);


//meta minute should always be two digits to display as in real life
var tempMetaMinute = string(metaTimeMinutes);
if(metaTimeMinutes < 10){
	tempMetaMinute = "0" + tempMetaMinute;
}
//if am/pm is enabled, simply append either am/pm to the end of tempMetaMinute.
if(self.AMPM){
	tempMetaMinute = tempMetaMinute + (metaTimeHours < 12 ? "AM" : "PM");
}


//if am/pm is enabled, meta hour shouldn't be 13 or more.
var tempMetaHour;
if(self.AMPM){
	tempMetaHour = string((metaTimeHours-1)%12 + 1);
	if(metaTimeHours == 0){
		tempMetaHour = "12";
	}
} else {
	tempMetaHour = string(metaTimeHours);
	
	//in 24 hours mode, meta hours should always be 2 digits.
	if(metaTimeHours < 10){
		tempMetaHour = "0" + tempMetaHour;
	}
}

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_sundial);
draw_set_colour(c_black);
draw_text(view_wport-165, 204, "Time: " + tempMetaHour + ":" + tempMetaMinute);