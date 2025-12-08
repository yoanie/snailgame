
if(self.state != -1){
	self.poisonProgression -= 1/game_get_speed(gamespeed_fps)/2;
}
if(self.poisonProgression < 0){ self.poisonProgression = 0; }

_color = make_colour_rgb(255-255*self.poisonProgression/10/2, 
						 255, 
						 255-255*self.poisonProgression/10/2);
draw_sprite_ext(self.sprite_index, -1, self.x, self.y, 1, 1, 0, _color, 1);