///@description Move player
draw_set_alpha(1);

var xVelocity = moveSpeed * (keyboard_check(vk_right) - keyboard_check(vk_left));
var yVelocity = moveSpeed * (keyboard_check(vk_down) - keyboard_check(vk_up))

//when the snail is not on the ground, snail has to be on top of an object, otherwise they fall.
//so, the regular collision script has to be inverted when elevationLevel =/= 0.

//check every corner of obj_snail's bbox 
var cornersX = [self.bbox_left, self.bbox_right, self.bbox_right, self.bbox_left];
var cornersY = [self.bbox_top, self.bbox_top, self.bbox_bottom, self.bbox_bottom];

//Make snail bbox snug against ledge's edge.
var velocityVector = snugLedges(xVelocity, yVelocity, cornersX, cornersY);

//show_debug_message("new xVel: " + string(xVelocity) + ", new yVel: "+ string(yVelocity));

x += velocityVector[0];
y += velocityVector[1];

//look left/right
//may cause hitbox issue? idk havent looked into yet
if(xVelocity != 0){
	if(xVelocity > 0){
		image_xscale = -1;
	} else {
		image_xscale = 1;
	}
}