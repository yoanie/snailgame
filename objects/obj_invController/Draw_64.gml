
if(!showDebug){
	return;
}

draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_font(fnt_debug);
draw_set_colour(c_white);
for(var i = 0; i<array_length(self.inventory); i++){
	var name = "null";
	if(self.inventory[i] != pointer_null){
		name = self.inventory[i].name;
	}
	draw_text(0,view_hport-(15*(1+array_length(inventory) - i)), "Item "+string(i)+": " + name );
}	