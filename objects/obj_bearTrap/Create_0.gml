// Inherit the parent event
event_inherited();

var hitbox = instance_create_layer(self.x, self.y, self.layer, obj_hitbox_circle);
hitbox.gluedTo = self;
hitbox.collisionId = 29;
hitbox.affectsHuman = true;
hitbox.affectsSnail = false;

//show_debug_message("AAA: "+string(self));
