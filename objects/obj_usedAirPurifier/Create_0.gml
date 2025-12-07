var hitbox = instance_create_layer(self.x, self.y, self.layer, obj_hitbox_circle);
hitbox.gluedTo = self;
hitbox.collisionId = -62;
hitbox.affectsHuman = true;
hitbox.affectsSnail = false;
hitbox.radius = 800;