event_inherited();

var hitbox = instance_create_layer(self.x, self.y, self.layer, obj_hitbox_circle);
hitbox.gluedTo = self;
hitbox.collisionId = -10;
hitbox.affectsHuman = false;
hitbox.affectsSnail = true;
hitbox.radius = 10;