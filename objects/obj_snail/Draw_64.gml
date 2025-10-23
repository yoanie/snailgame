///@description 

//above

//show_debug_message("above elevationLevel objects (len " + string(array_length(above)) + ") ");
//show_debug_message(above);
for(var i = 0; i < array_length(above); i++){
	if(distance_to_object(above[i]) <= 64){
		draw_sprite(gui_elevationUp, -1, above[i].x, above[i].y);
	}
}

//below

//show_debug_message("below elevationLevel objects (len " + string(array_length(below)) + ") ");
//show_debug_message(below);
for(var i = 0; i < array_length(below); i++){
	if(distance_to_object(below[i]) <= 64){
		draw_sprite(gui_elevationDown, -1, below[i].x, below[i].y);
	}
}

//bbox debug
if(showDebug){
	draw_set_font(fnt_debug);
	
	var cornersX = [self.bbox_left, self.bbox_right, self.bbox_right, self.bbox_left];
	var cornersY = [self.bbox_top, self.bbox_top, self.bbox_bottom, self.bbox_bottom];

	for(var t = 0; t < 4; t++){
		draw_set_colour(c_black);
		draw_circle(cornersX[t], cornersY[t], 3, false);
		draw_set_colour(c_red);
		draw_circle(cornersX[t], cornersY[t], 1, true);
	}
	draw_text(self.x, self.y+100, "Elevation: " + string(elevationLevel));
}