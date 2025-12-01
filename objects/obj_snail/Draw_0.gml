///@description Apply elevation based shaders

var deltaElevation = self.elevationLevel - obj_snail.elevationLevel;
if(deltaElevation > 0){
	shader_set(shd_ghost);
	shader_set_uniform_f(shdGhostParams, 1/(1+deltaElevation) );
} else if(deltaElevation < 0){
	shader_set(shd_dim);
	shader_set_uniform_f(shdDimParams, (1.75) * (1/(1-deltaElevation)) );
}
draw_self();
shader_reset();

/*
//show_debug_message("above elevationLevel objects (len " + string(array_length(above)) + ") ");
//show_debug_message(above);
for(var i = 0; i < array_length(above); i++){
	if(distance_to_object(above[i]) <= 64){
		draw_sprite(gui_elevationUp, -1, above[i].x, above[i].y);
	}
}

//show_debug_message("below elevationLevel objects (len " + string(array_length(below)) + ") ");
//show_debug_message(below);
for(var i = 0; i < array_length(below); i++){
	if(distance_to_object(below[i]) <= 64){
		draw_sprite(gui_elevationDown, -1, below[i].x, below[i].y);
	}
}
*/

//draw the "reach" circle for snail.
draw_set_alpha(0.5);
draw_set_colour(c_black);
draw_circle(self.x, self.y, self.itemReach, 2);
draw_set_alpha(1);


//draw the human arrow.
var theta = darctan2(-obj_human.y + self.y, obj_human.x - self.x);
var dist = self.itemReach + 16;
draw_sprite_ext(gui_humanArrow, -1, self.x + dist*dcos(theta), self.y - dist*dsin(theta), 1, 1, theta, c_white, 0.75);

//bbox debug
if(showDebug){
	var cornersX = [self.bbox_left, self.bbox_right, self.bbox_right, self.bbox_left];
	var cornersY = [self.bbox_top, self.bbox_top, self.bbox_bottom, self.bbox_bottom];

	draw_set_colour(c_black);
	draw_circle(self.x, self.y, 3, false);
	draw_set_colour(c_blue);
	draw_circle(self.x, self.y, 1, true);

	for(var t = 0; t < 4; t++){
		draw_set_colour(c_black);
		draw_circle(cornersX[t], cornersY[t], 3, false);
		draw_set_colour(c_red);
		draw_circle(cornersX[t], cornersY[t], 1, true);
		draw_text(self.x, self.y+40+(20*(t)), "Corner "+string(t) + " (" + string(cornersX[t]) + ", " + string(cornersY[t]));
	}
	
	draw_text(self.x, self.y+120, "Elevation: " + string(elevationLevel));
}
