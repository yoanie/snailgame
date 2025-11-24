if (self.canSwingItemHere){
	
	show_debug_message("swinging "+inventory[self.selectedItemPointer].name+"!!\n"+string(selectedItemId));
	
	switch(self.inventory[self.selectedItemPointer].internal_id){
		case 28: //knife
			//show_debug_message("knoife");
			var dtheta = darctan2(mouse_y-obj_snail.y, mouse_x-obj_snail.x);
			/*/show_debug_message(dtheta);
			show_debug_message("dcos:"+string(dcos(dtheta)));
			show_debug_message("dsin:"+string(dsin(dtheta)));*/
			
			var duration = 0.06;
			var knifesprite = instance_create_layer(obj_snail.x, obj_snail.y, 
				findLayerNameOfElevationLevel(obj_snail.elevationLevel), obj_weaponGraphic);
			with(knifesprite){
				gluedTo = obj_snail;
				spriteToDisplay = spr_knife_swing;
				spriteToDisplay_size = 0.65;
				self.image_angle = -dtheta;
				theta_offset = 135; //based on art
				self.duration = duration;
				event_user(0);
			}
			
			var hitbox = instance_create_layer(obj_snail.x, obj_snail.y, 
				findLayerNameOfElevationLevel(obj_snail.elevationLevel), obj_hitbox_circle);
			with(hitbox){
				gluedTo = obj_snail;
				collisionId = -28;
				affectsHuman = true;
				affectsSnail = false;
				radius = 36;
				self.duration = duration;
				event_user(0);
			}
			
			var hitbox2 = instance_create_layer(obj_snail.x, obj_snail.y, 
				findLayerNameOfElevationLevel(obj_snail.elevationLevel), obj_hitbox_circle);
			with(hitbox2){
				x_offset = 60*dcos(dtheta);
				y_offset = 60*dsin(dtheta);
				gluedTo = obj_snail;
				collisionId = -28;
				affectsHuman = true;
				affectsSnail = false;
				radius = 24;
				self.duration = duration;
				event_user(0);
			}
			break;
	}
}

//juuust mkaing sure
self.canDropItemHere = false;
self.canCombineItemHere = false;
self.canSwingItemHere = false;