///@description Move player
draw_set_alpha(1);

var xVelocity = moveSpeed * (keyboard_check(vk_right) - keyboard_check(vk_left));
var yVelocity = moveSpeed * (keyboard_check(vk_down) - keyboard_check(vk_up))

//when the snail is not on the ground, snail has to be on top of an object, otherwise they fall.
//so, the regular collision script has to be inverted when elevationLevel =/= 0.

//check every corner of obj_snail's bbox 
var cornersX = [self.bbox_left, self.bbox_right, self.bbox_right, self.bbox_left];
var cornersY = [self.bbox_top, self.bbox_top, self.bbox_bottom, self.bbox_bottom];

for(var t = 0; t < 4; t++){
	//debug
	//draw_set_colour(c_red);
	//draw_circle(cornersX[t], cornersY[t], 10, true);
	
	var insts = ds_list_create();
	instance_position_list(cornersX[t], cornersY[t], eyelevel, insts, true);	
	
	//show_debug_message(ds_list_find_value(insts, 0));
	if(ds_list_size(insts) == 0){
		show_debug_message("corner "+string(t)+" is stepping off a ledge!");
	}
	
	ds_list_destroy(insts); //must have this line, otherwise memory issues
}

x += xVelocity;
y += yVelocity;

//look left/right
//may cause hitbox issue? idk havent looked into yet
if(xVelocity != 0){
	if(xVelocity > 0){
		image_xscale = -1;
	} else {
		image_xscale = 1;
	}
}