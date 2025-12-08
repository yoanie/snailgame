if(self.showDebug){
	_alpha = obj_snail.globalShowDebug ? 0.3 : 0;
	draw_set_alpha(_alpha);
	draw_set_colour(c_red);
	draw_circle(self.x+x_offset, self.y+y_offset, self.radius, false);
	draw_set_alpha(1);
}