///@description debug

if(!showDebug){
    return;
}

show_debug_message(string(array_length(self.inventory))+":");
for(var i = 0; i < array_length(self.inventory); i++){
	show_debug_message("	"+string(self.inventory[i]));
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
    
    var indicator = (self.selectedItemPointer==i ? "> " : "  ");
    
    draw_text(0,view_hport-(15*(1+array_length(inventory) - i)), indicator + "Item "+string(i)+": " + name );
}
draw_text(0,view_hport-15, "Right-click an item to pick up. Press [1-4] to select item. Press 'Q' to drop selected item.");