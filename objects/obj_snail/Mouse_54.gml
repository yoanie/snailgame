///@description climb up or climb down

if(self.elevationCandidate != pointer_null){
	self.elevationLevel = self.elevationCandidate.elevationLevel;
	self.x = mouse_x; //elevationCandidate.x;
	self.y = mouse_y; //elevationCandidate.y;
	event_user(0);
}