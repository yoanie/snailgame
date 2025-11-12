
var center = [110, view_hport-90];

draw_sprite_ext(gui_invWheel, -1, center[0], center[1], 1, 1, self.image_angle, c_white, 1.0);

var angleOfSelectedItem = 55;
for(var i = 0; i<4; i++){
	var newAngle = (self.image_angle)- 90*i + angleOfSelectedItem;
	draw_sprite_ext(gui_invSlot, -1, center[0] + 120*dcos(newAngle), center[1] - 120*dsin(newAngle), 2, 2, 0, c_white, 1.0);
}