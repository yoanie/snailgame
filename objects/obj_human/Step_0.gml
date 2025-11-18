// Checks if the human is actually moving
if(self.prev_x == self.x && self.prev_y == self.y) {
	return;
}

// Determines the angle the human is moving at
var current_direction = point_direction(self.prev_x, self.prev_y, self.x, self.y);

// Moving right
if(current_direction > 315 || current_direction <= 45) {
	self.sprite_index = spr_human_sideStatic;
	self.image_xscale = 1;
	self.direction = 0;

// Moving up
} else if(current_direction > 45 && current_direction <= 135) {
	self.sprite_index = spr_human_backStatic;
	self.image_xscale = 1;
	self.direction = 90;

// Moving left
} else if(current_direction > 135 && current_direction <= 225) {
	self.sprite_index = spr_human_sideStatic;
	self.image_xscale = -1;
	self.direction = 180;
	
// Moving down
} else {
	self.sprite_index = spr_human_frontStatic;
	self.image_xscale = 1;
	self.direction = 270;
}

//Walking sound with human movement
//movement since last step check
var is_moving = (x != x_prev) || (y != y_prev);

// 2. Sound logic
if (is_moving) {
    // If moving, make sure walking sound is playing
    if (walk_sound_inst == noone || !audio_is_playing(walk_sound_inst)) {
        walk_sound_inst = audio_play_sound(walk_sound, 0, true); // loop
    }
} else {
    // If not moving, stop the walking sound
    if (walk_sound_inst != noone && audio_is_playing(walk_sound_inst)) {
        audio_stop_sound(walk_sound_inst);
        walk_sound_inst = noone;
    }
}

//Update previous position for next frame
x_prev = x;
y_prev = y;
// Update prev_x and prev_y for next step
self.prev_x = self.x;
self.prev_y = self.y;
