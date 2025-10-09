///@description is player touching any of hitboxes?

var dimmingFactor = 1

for(var i = 0; i < array_length(self.allX1); i++){
	if(obj_snail.bbox_bottom >= self.allY1[i] &&
		obj_snail.bbox_top <= self.allY2[i] &&
		obj_snail.bbox_left <= self.allX2[i] &&
		obj_snail.bbox_right >= self.allX1[i]){
		dimmingFactor = -1;
		//show_debug_message("dimming!");
	}
}

a += dimmingFactor * 0.05;
a = clamp(a, minObfuscating, maxObfuscating);

