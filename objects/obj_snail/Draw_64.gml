///@description 

if(showElevationDebug){
	draw_text(self.x, self.y+100, "Elevation: " + string(elevationLevel));
}

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
