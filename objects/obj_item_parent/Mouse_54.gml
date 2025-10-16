if(distance_to_object(obj_snail) <= 32) {
	grabState *= -1
	
	if(grabState == -1) {
		alarm[0] = 1
	}
}