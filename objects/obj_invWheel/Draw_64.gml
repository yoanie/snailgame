///@description Draw Inventory Wheel and Slots and Description

if(obj_menu_pause.menuIsUp || obj_menu_end.menuIsUp) {
	return;
}

var center = [110, view_hport-90];

draw_sprite_ext(gui_invWheel, -1, center[0], center[1], 1, 1, self.image_angle, c_white, 1.0);

var angleOfSelectedItem = 215;
//show_debug_message(string(self.image_angle)+" "+string(angleOfSelectedItem));
for(var i = 0; i<4; i++){
	var realAngle = (self.image_angle + i*90 + angleOfSelectedItem)%360;
	var normalizedAngle = abs(realAngle - angleOfSelectedItem)/180;
	
	var sizeFactor = 0.75+0.75*(power(0.1, normalizedAngle));
	
	var adjustForSpace = 36*normalizedAngle*(1-normalizedAngle);
	var newAngle = realAngle + (angleOfSelectedItem < realAngle ? adjustForSpace : -adjustForSpace);
	
	//show_debug_message("	"+string(realAngle)+" "+string(normalizedAngle)+" "+string(newAngle));
	
	draw_sprite_ext(gui_invSlot, -1, center[0] - 120*dcos(newAngle), center[1] + 120*dsin(newAngle), sizeFactor, sizeFactor, 0, c_white, 1.0);
	
	var itemObj = obj_invController.inventory[i];
	//show_debug_message(itemObj);
	if(itemObj != pointer_null){
		draw_sprite_ext(itemObj.sprite_index, -1, center[0] - 120*dcos(newAngle), center[1] + 120*dsin(newAngle), sizeFactor, sizeFactor, 0, c_white, 1.0);
	}
}

//item description
var itemObj = obj_invController.inventory[obj_invController.selectedItemPointer];
if(itemObj != pointer_null){
	draw_set_halign(fa_left);
	draw_set_valign(fa_bottom);
	draw_set_font(fnt_itemDesc);
	draw_set_colour(c_black);
	
	var itemDesc = "It's a(n) "+itemObj.name+".";
	if(itemObj.description != ""){
		itemDesc = "\"" + itemObj.description + "\"";
	}
	
	text_drop_shadow(220, view_hport-10, c_white, c_black, 
		itemObj.name + "\n" + itemDesc,
	-1, -1);
}