if(self.state == 1 ) {
	return;
}

if (self.state == -1 || self.state == 2) {
	if(path_index != -1) {
		path_end();
	}
	
	return;
}

checkTime();