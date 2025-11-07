if(instance_exists(self.allegiantTo) && !(self.allegiantTo.menuIsUp)){
	instance_destroy(self);
} else if (!instance_exists(self.allegiantTo)){
	instance_destroy(self);
}