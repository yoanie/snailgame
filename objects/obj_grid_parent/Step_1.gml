//depth = -y;
depth = obj_human.depth+1;

if(obj_snail.elevationLevel != 0){//> self.elevationLevel){
	//always display snail "on top" of this object
	self.depth = obj_snail.depth + 1;
}
