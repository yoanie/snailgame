
var center = [110, view_hport-90];

draw_sprite_ext(gui_invWheel, -1, center[0], center[1], 1, 1, self.image_angle, c_white, 1.0);

var angleOfSelectedItem = 215;
//show_debug_message(string(self.image_angle)+" "+string(angleOfSelectedItem));
for(var i = 0; i<4; i++){
	var realAngle = (self.image_angle + i*90 + angleOfSelectedItem)%360;

	var manipulatedAngle = power(0.1, abs(realAngle - angleOfSelectedItem)/180);
	var sizeFactor = 0.75+0.75*(manipulatedAngle);
	
	//var newAngle = realAngle + 100*(1-manipulatedAngle);
	
	///show_debug_message("	"+string(newAngle)+" "+string(manipulatedAngle)+" "+string(sizeFactor));
	
	draw_sprite_ext(gui_invSlot, -1, center[0] - 120*dcos(realAngle), center[1] + 120*dsin(realAngle), sizeFactor, sizeFactor, 0, c_white, 1.0);
	
	var itemObj = obj_invController.inventory[i];
	//show_debug_message(itemObj);
	if(itemObj != pointer_null){
		draw_sprite_ext(itemObj.sprite_index, -1, center[0] - 120*dcos(realAngle), center[1] + 120*dsin(realAngle), sizeFactor, sizeFactor, 0, c_white, 1.0);
	}
}