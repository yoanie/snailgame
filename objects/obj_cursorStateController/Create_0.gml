//so we can add our own custom cursor
window_set_cursor(cr_none);

//reset tooltip for next frame
self.tooltip_left = "";
self.tooltip_right = "";
self.currentTooltipMessage = "";

instance_create_layer(0, 0, "Cursor", obj_cursor);