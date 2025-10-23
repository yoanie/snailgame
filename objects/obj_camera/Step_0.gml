var xTo, yTo;

if(obj_timeController.timeIsFrozen){
	return;
}

//set camera direction to point towards mouse
move_towards_point(mouse_x, mouse_y, 0);

xTo = obj_snail.x + lengthdir_x(min(96, distance_to_point(mouse_x, mouse_y)), direction);
yTo = obj_snail.y + lengthdir_y(min(96, distance_to_point(mouse_x, mouse_y)), direction);

//linear interpolation
x += (xTo - x)/25;
y += (yTo - y)/25;

//view_xview = x - (view_wview/2);
//view_yview = y - (view_hview/2);