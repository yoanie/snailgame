draw_set_alpha(a);
draw_sprite(spr_shadething, -1, self.x, self.y);

if(self.showHitboxes){
	draw_set_alpha(1);
	draw_set_colour(c_aqua);
	for(var i = 0; i < array_length(allX1); i++){
		draw_rectangle(
			//x, y, x+100, y+100, 2
			allX1[i], allY1[i], allX2[i], allY2[i], 1
		)
	}
}
