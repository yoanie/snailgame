/*
//utilizing a temp variable because i want ground to be 0 
//and dashes can't be used in a layer name
var _temp = (elevationLevel+1 < 0 ? "sub" + string(abs(elevationLevel+1)) : string(elevationLevel+1));
show_debug_message("above elevationLevel is " + _temp);
var _above = layer_get_all_elements("Instances_" + _temp);

show_debug_message("above elevationLevel objects: " + string(array_length(_above)));
for(var i = 0; i < array_length(_above); i++){
	show_debug_message(_above[i])//.x) + ", " + string(_above[i].y));
	draw_sprite(gui_elevationUp, -1, _above[i].x, _above[i].y);
}


_temp = (elevationLevel-1 < 0 ? "sub" + string(abs(elevationLevel-1)) : string(elevationLevel-1));
show_debug_message("below elevationLevel is " + _temp);
var _below = layer_get_all_elements("Instances_" + _temp);

show_debug_message("below elevationLevel objects: " + string(array_length(_below)));
for(var i = 0; i < array_length(_below); i++){
	show_debug_message(_below[i])//) + ", " + string(_below[i].y));
	draw_sprite(gui_elevationDown, -1, _below[i].x, _below[i].y);
}*/