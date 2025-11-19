///@description climb up or climb down

if(self.elevationCandidateLevel != self.elevationLevel){
	self.elevationLevel = self.elevationCandidateLevel;
	self.x = mouse_x; //elevationCandidate.x;
	self.y = mouse_y; //elevationCandidate.y;
	event_user(0);
}