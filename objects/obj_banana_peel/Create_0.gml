event_inherited();

hitbox = instance_create_layer(self.x, self.y, self.layer, obj_hitbox_circle);
hitbox.gluedTo = self;
hitbox.collisionId = 25;
hitbox.affectsHuman = true;
hitbox.affectsSnail = false;
hitbox.radius = 32;