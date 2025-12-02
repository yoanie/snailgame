depth = -y;

if(obj_snail.elevationLevel > self.elevationLevel){
	//always display snail "on top" of this object
	self.depth = obj_snail.depth + 1;
}