///@description Stop moving

self.prev_x = self.x;
self.prev_y = self.y;

if(self.state == 1) {
	alarm[0] = 2 * game_get_speed(gamespeed_fps);
}

if(self.hdirection == 90) {
	self.sprite_index = spr_human_back_s;
	
} else if(self.hdirection == 270) {
	self.sprite_index = spr_human_front_s;
	
} else if(self.hdirection == 0) {
	self.sprite_index = spr_human_side_s;
} else {
	self.sprite_index = spr_human_left_s
}