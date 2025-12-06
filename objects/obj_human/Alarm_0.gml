///@description Recover from dazed state

if(self.state == 2) {
	self.sprite_index = spr_human_front_s;
	self.hitbox.affectsSnail = true;
}

self.state = 0;