
//utilizing a temp variable because i want ground to be 0 
//and dashes can't be used in a layer name

//above
var _temp = (elevationLevel+1 < 0 ? "sub" + string(abs(elevationLevel+1)) : string(elevationLevel+1));
//show_debug_message("above elevationLevel is " + _temp);
var _above = layer_get_all_elements("Instances_" + _temp);
for (var i = 0; i < array_length(_above); i++) {
    if (layer_get_element_type(_above[i]) == layerelementtype_instance) {
        var element = layer_instance_get_instance(_above[i]);
        _above[i] = element;
    }
}

//show_debug_message("above elevationLevel objects (len " + string(array_length(_above)) + ") ");
//show_debug_message(_above);
for(var i = 0; i < array_length(_above); i++){
	//show_debug_message(_above[i]);// + ": " + string(_above[i].x) + ", " + string(_above[i].y));
	draw_sprite(gui_elevationUp, -1, _above[i].x, _above[i].y);
}

//below
_temp = (elevationLevel-1 < 0 ? "sub" + string(abs(elevationLevel-1)) : string(elevationLevel-1));
//show_debug_message("below elevationLevel is " + _temp);
var _below = layer_get_all_elements("Instances_" + _temp);
for (var i = 0; i < array_length(_below); i++) {
    if (layer_get_element_type(_below[i]) == layerelementtype_instance) {
        var element = layer_instance_get_instance(_below[i]);
        _below[i] = element;
    }
}

//show_debug_message("below elevationLevel objects (len " + string(array_length(_below)) + ") ");
//show_debug_message(_below);
for(var i = 0; i < array_length(_below); i++){
	//show_debug_message(_below[i]);// + ": " + string(_above[i].x) + ", " + string(_above[i].y));
	draw_sprite(gui_elevationDown, -1, _below[i].x, _below[i].y);
}
