///@description move player

var xVelocity = moveSpeed * (keyboard_check(vk_right) - keyboard_check(vk_left));
var yVelocity = moveSpeed * (keyboard_check(vk_down) - keyboard_check(vk_up))

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