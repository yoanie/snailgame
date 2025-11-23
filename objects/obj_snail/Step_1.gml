depth = -y;

///@description Move player
if(instance_exists(obj_menu_pause) && obj_menu_pause.menuIsUp){
	return;
}
switch (self.state){
	case -1: //he died
		return;
	case 0: //alive and well
		break;
}

var isRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
var isLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
var isUp = keyboard_check(vk_up) || keyboard_check(ord("W"));
var isDown = keyboard_check(vk_down) || keyboard_check(ord("S"));

var xRawVelocity = (isRight - isLeft);
var yRawVelocity = (isDown - isUp);

//normalize vector
var c = sqrt(power(xRawVelocity,2) + power(yRawVelocity,2));
if(c > 1){
	xRawVelocity /= c;
	yRawVelocity /= c;
}

var xVelocity = moveSpeed * xRawVelocity;
var yVelocity = moveSpeed * yRawVelocity;

//when the snail is not on the ground, snail has to be on top of an object, otherwise they fall.
//so, the regular collision script has to be inverted when elevationLevel =/= 0.

//check every corner of obj_snail's bbox 
var cornersX = [self.bbox_left, self.bbox_right, self.bbox_right, self.bbox_left];
var cornersY = [self.bbox_top, self.bbox_top, self.bbox_bottom, self.bbox_bottom];

//Make snail bbox snug against ledge's edge.
//Unless elevationLevel = 0 (for now)
var velocityVector = snugLedges(xVelocity, yVelocity, cornersX, cornersY, elevationLevel);



/*if(elevationLevel == 0){
	while(place_meeting(self.x + velocityVector[0], self.y, obj_wall_parent)) {
		if(isRight) {
			velocityVector[0] -= 1;
		} else if(isLeft) {
			velocityVector[0] += 1;
		}
	}

	while(place_meeting(self.x + velocityVector[0], self.y + velocityVector[1], obj_wall_parent)) {
		if(isUp) {
			velocityVector[1] += 1;
		} else if(isDown) {
			velocityVector[1] -= 1;
		}
	}
} else {*/
	
	var walls1 = findWallsThatsTouching(self, velocityVector[0], velocityVector[1], cornersX, cornersY, eyelevel);
	
	var wallLayerElements = layer_get_all_elements("Walls");
	//show_debug_message(wallLayerElements);
	var walls2 = findWallsThatsTouching(self, velocityVector[0], velocityVector[1], cornersX, cornersY, wallLayerElements);
	
	var walls = array_concat(walls1, walls2);
	//show_debug_message(wall);
	
	var isTouchingWall = false;
	if(array_length(walls) > 0){
		for(var w = 0; w < array_length(walls); w++){
			var wall = walls[w];
			
			isTouchingWall = isTouchingWall || 
				findTopsPermeance(self, velocityVector[0], velocityVector[1], wall) >= 0
				&& findSidePermeance(self, velocityVector[0], velocityVector[1], wall) >= 0;
		}
	}
	//show_debug_message("touchingwall: "+string(isTouchingWall));
	
	if(isTouchingWall){
		show_debug_message("colliding with: "+string(array_length(walls))+" wall(s).");
		var changeInXY = [0, 0];
		
		for(var w = 0; w < 1/*array_length(walls)*/; w++){
			var wall = walls[w];
			show_debug_message("	wall #"+string(w));
		
			var checkSidesFirst = shouldICheckSidesFirst(velocityVector[0]-changeInXY[0], velocityVector[1]-changeInXY[1], cornersX, cornersY, wall);
			show_debug_message("checking sides: "+string(checkSidesFirst));
		
			/*
			if(checkSidesFirst){
				order = ["left", "right", "top", "bottom"];
			} else {
				order = ["top", "bottom", "left", "right"];
			}
			*/
		
			if(checkSidesFirst){
				var moveFactor = findSidePermeance(self, velocityVector[0]-changeInXY[0], velocityVector[1]-changeInXY[1], wall);
				show_debug_message("side moveF bef: "+string(moveFactor)); 
			
				var multVal = sign(velocityVector[0]) == 0 ? 1 : sign(velocityVector[0]);
				moveFactor *= multVal;
			
				show_debug_message("side moveF aft: "+string(moveFactor) + " (xVel was: "+string(velocityVector[0]-changeInXY[0])+ ")");
				if(wall.isPushable){
					wall.x += moveFactor;
				} else {
					if(abs(changeInXY[0]) < abs(moveFactor)){
						changeInXY[0] = moveFactor//sign(velocityVector[0])*self.moveSpeed;
					}
				}
			} else {
				var moveFactor = findTopsPermeance(self, velocityVector[0], velocityVector[1], wall);
				show_debug_message("tops moveF bef: "+string(moveFactor));
			
				var multVal = sign(velocityVector[1]) == 0 ? 1 : sign(velocityVector[1]);
				moveFactor *= multVal;
			
				show_debug_message("tops moveF aft: "+string(moveFactor) + " (yVel was: "+string(velocityVector[1]-changeInXY[1])+ ")");
				if(wall.isPushable){
					wall.y += moveFactor;
				} else {
					if(abs(changeInXY[1]) < abs(moveFactor)){
						changeInXY[1] = moveFactor//sign(velocityVector[1])*self.moveSpeed
					}
				}
				
			}

		
			/* //for refernece
			if(place_meeting(self.bbox_left, y, obj_snail)) {
				self.x += obj_snail.moveSpeed
			} else if(place_meeting(self.bbox_right, y, obj_snail)) {
				self.x -= obj_snail.moveSpeed
			} else if(place_meeting(x, self.bbox_top, obj_snail)) {
				self.y += obj_snail.moveSpeed
			} else if(place_meeting(x, self.bbox_bottom, obj_snail)) {
				self.y -= obj_snail.moveSpeed
			}
			*/
		
			/*
			for(var t = 0; t < 4; t++){
				while(elevationBasedWallDetectionDirection(velocityVector[0], velocityVector[1], cornersX, cornersY, eyelevel
					, order[t])){
			
					if(order[t] == "left"){ velocityVector[0] += 1; }
					else if(order[t] == "right"){ velocityVector[0] -= 1; }
					else if(order[t] == "top"){ velocityVector[1] += 1; }
					else if(order[t] == "bottom"){ velocityVector[1] -= 1; }
				}
			}
			*/
		}
		
		velocityVector[0] -= changeInXY[0];
		velocityVector[1] -= changeInXY[1];
		
		show_debug_message(velocityVector);
		show_debug_message("end");
	}		
//}

//do snug ledges again
velocityVector = snugLedges(velocityVector[0], velocityVector[1], cornersX, cornersY, elevationLevel);


self.x += velocityVector[0];
self.y += velocityVector[1];

//look left/right
//may cause hitbox issue? idk havent looked into yet
if(xVelocity != 0){
	if(xVelocity > 0){
		self.image_xscale = -1;
	} else {
		self.image_xscale = 1;
	}
}
