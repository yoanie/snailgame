///@description initialize hitboxes

//please make (x1, y1) the top left corner and (x2, y2) the bottom right corner
allX1 = [ self.x                , self.x       ];
allY1 = [ self.y                , self.y - 100 ];
allX2 = [ self.x + bbox_width   , self.x + 100 ];
allY2 = [ self.y + bbox_height  , self.y       ];

//for debug
/*for(var i = 0; i < array_length(allX1); i++){
	show_debug_message("box coords number " + string(i));
	show_debug_message(string(allX1[i]) + ", " + string(allY1[i]));
	show_debug_message(string(allX2[i]) + ", " + string(allY2[i]));
}*/
