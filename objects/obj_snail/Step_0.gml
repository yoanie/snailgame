///@description move player
draw_set_alpha(1);

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
