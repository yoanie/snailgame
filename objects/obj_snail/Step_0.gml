///@description Move player
if(instance_exists(obj_menu_pause) && obj_menu_pause.menuIsUp){
	return;
}

var isRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
var isLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
var isUp = keyboard_check(vk_up) || keyboard_check(ord("W"));
var isDown = keyboard_check(vk_down) || keyboard_check(ord("S"));

var xRawVelocity = (isRight - isLeft);
var yRawVelocity = (isDown - isUp);

//normalize vector
var c = sqrt(power(xRawVelocity,2) + power(yRawVelocity,2));
if(c > 1){
	xRawVelocity /= c;
	yRawVelocity /= c;
}

var xVelocity = moveSpeed * xRawVelocity;
var yVelocity = moveSpeed * yRawVelocity;

//when the snail is not on the ground, snail has to be on top of an object, otherwise they fall.
//so, the regular collision script has to be inverted when elevationLevel =/= 0.

//check every corner of obj_snail's bbox 
var cornersX = [self.bbox_left, self.bbox_right, self.bbox_right, self.bbox_left];
var cornersY = [self.bbox_top, self.bbox_top, self.bbox_bottom, self.bbox_bottom];

//Make snail bbox snug against ledge's edge.
//Unless elevationLevel = 0 (for now)
var velocityVector = snugLedges(xVelocity, yVelocity, cornersX, cornersY, elevationLevel);

//show_debug_message("new xVel: " + string(xVelocity) + ", new yVel: "+ string(yVelocity));
var newX = self.x + velocityVector[0];
var newY = self.y + velocityVector[1];

while(place_meeting(newX, self.y, obj_wall_parent)) {
	if(isRight) {
		newX -= 1;
	} else if(isLeft) {
		newX += 1;
	}
}

while(place_meeting(self.x, newY, obj_wall_parent)) {
	if(isUp) {
		newY += 1;
	} else if(isDown) {
		newY -= 1;
	}
}

self.x = newX;
self.y = newY;

//look left/right
//may cause hitbox issue? idk havent looked into yet
if(xVelocity != 0){
	if(xVelocity > 0){
		self.image_xscale = -1;
	} else {
		self.image_xscale = 1;
	}
}
