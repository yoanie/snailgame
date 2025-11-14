
var center = [110, view_hport-90];

draw_sprite_ext(gui_invWheel, -1, center[0], center[1], 1, 1, self.image_angle, c_white, 1.0);

var angleOfSelectedItem = 215;
//show_debug_message(string(self.image_angle)+" "+string(angleOfSelectedItem));
for(var i = 0; i<4; i++){
	var newAngle = (self.image_angle + i*90 + angleOfSelectedItem)%360;

	var manipulatedAngle = abs(newAngle - angleOfSelectedItem);
	if(i==(1+obj_invController.selectedItemPointer)%4){ manipulatedAngle -= 180; }
	var sizeFactor = 1.5-0.5*abs(manipulatedAngle)/180;
	//show_debug_message("	"+string(newAngle)+" "+string(manipulatedAngle)+" "+string(sizeFactor));
	
	draw_sprite_ext(gui_invSlot, -1, center[0] - 120*dcos(newAngle), center[1] + 120*dsin(newAngle), sizeFactor, sizeFactor, 0, c_white, 1.0);
}