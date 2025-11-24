if (self.canSwingItemHere){
	
	show_debug_message("swinging "+inventory[self.selectedItemPointer].name+"!!\n"+string(selectedItemId));
	
	var collId = self.inventory[self.selectedItemPointer].internal_id
	
	if(collId = 8){
		//show_debug_message("flamethr");
		var dtheta = darctan2(mouse_y-obj_snail.y, mouse_x-obj_snail.x);
			
		var duration = 0.3;
		var knifesprite = instance_create_layer(obj_snail.x, obj_snail.y, 
			findLayerNameOfElevationLevel(obj_snail.elevationLevel), obj_weaponGraphic);
		with(knifesprite){
			gluedTo = obj_snail;
			spriteToDisplay = spr_makeshiftFlamethrower_flame;
			spriteToDisplay_size = 1.35;
			self.image_angle = -dtheta;
			theta_offset = 0; //based on art
			self.duration = duration;
			event_user(0);
		}
			
		var hitbox = instance_create_layer(obj_snail.x, obj_snail.y, 
			findLayerNameOfElevationLevel(obj_snail.elevationLevel), obj_hitbox_circle);
		with(hitbox){
			gluedTo = obj_snail;
			collisionId = -8;
			affectsHuman = true;
			affectsSnail = false;
			radius = 36;
			self.duration = duration;
			event_user(0);
		}
			
		var hitbox2 = instance_create_layer(obj_snail.x, obj_snail.y, 
			findLayerNameOfElevationLevel(obj_snail.elevationLevel), obj_hitbox_circle);
		with(hitbox2){
			x_offset = 150*dcos(dtheta);
			y_offset = 150*dsin(dtheta);
			gluedTo = obj_snail;
			collisionId = -8;
			affectsHuman = true;
			affectsSnail = false;
			radius = 68;
			self.duration = duration;
			event_user(0);
		}
	} //makeshift flamethrower object
	
	if(collId == 28){ //knife object
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
			x_offset = 80*dcos(dtheta);
			y_offset = 80*dsin(dtheta);
			gluedTo = obj_snail;
			collisionId = -28;
			affectsHuman = true;
			affectsSnail = false;
			radius = 24;
			self.duration = duration;
			event_user(0);
		}
			
	}
}

//juuust mkaing sure
self.canDropItemHere = false;
self.canCombineItemHere = false;
self.canSwingItemHere = false;