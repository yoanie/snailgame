///@description Stop moving

self.prev_x = self.x;
self.prev_y = self.y;

if(self.state == 1) {
	alarm[0] = 2 * game_get_speed(gamespeed_fps);
}

if(self.sprite_index == spr_human_back_a) {
	self.sprite_index = spr_human_back_s;
	
} else if(self.sprite_index == spr_human_front_a) {
	self.sprite_index = spr_human_front_s;
	
} else {
	self.sprite_index = spr_human_side_s;
}