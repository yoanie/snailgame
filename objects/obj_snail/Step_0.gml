///@description move player
draw_set_alpha(1);

var xVelocity = moveSpeed * (keyboard_check(vk_right) - keyboard_check(vk_left));
var yVelocity = moveSpeed * (keyboard_check(vk_down) - keyboard_check(vk_up))

x += xVelocity;
y += yVelocity;

//look left/right
//may cause hitbox issue? idk havent looked into yet
if(xVelocity != 0){
	if(xVelocity > 0){
		self.image_xscale = -1;
	} else {
		self.image_xscale = 1;
	}
}