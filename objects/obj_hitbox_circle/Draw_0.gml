if(self.showDebug){
	draw_set_alpha(0.3);
	draw_set_colour(c_red);
	draw_circle(self.x+x_offset, self.y+y_offset, self.radius, false);
	draw_set_alpha(1);
}