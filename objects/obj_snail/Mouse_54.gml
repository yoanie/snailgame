///@description climb up or climb down

if(self.elevationCandidateLevel != self.elevationLevel){
	self.elevationLevel = self.elevationCandidateLevel;
	self.x = elevationCandidateX;
	self.y = elevationCandidateY;
	event_user(0);
}