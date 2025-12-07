self.depth = 0;

self.poisonProgression = 0;

hitbox = instance_create_layer(self.x, self.y, self.layer, obj_hitbox_circle);
hitbox.gluedTo = self;
hitbox.collisionId = -10;
hitbox.affectsHuman = false;
hitbox.affectsSnail = true;
hitbox.radius = 21;

// Sound setup
walk_sound = sfx_humanWalking
walk_sound_inst = noone;
