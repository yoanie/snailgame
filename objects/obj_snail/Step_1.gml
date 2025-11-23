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
	//var isTouchingWall = elevationBasedWallDetectionPreliminary(velocityVector[0], velocityVector[1], cornersX, cornersY, eyelevel);
	
	var wall = findWallThatsTouching(self, velocityVector[0], velocityVector[1], cornersX, cornersY, eyelevel);
	if(wall==pointer_null){
		var wallLayerElements = layer_get_all_elements("Walls");
		show_debug_message(wallLayerElements);
		wall = findWallThatsTouching(self, velocityVector[0], velocityVector[1], cornersX, cornersY, wallLayerElements);
	}
	show_debug_message(wall);
	
	var isTouchingWall = false;
	if(wall!=pointer_null){
		isTouchingWall = findTopsPermeance(self, velocityVector[0], velocityVector[1], wall) >= 0;
		isTouchingWall = isTouchingWall && findSidePermeance(self, velocityVector[0], velocityVector[1], wall) >= 0;
	}
	//show_debug_message("touchingwall: "+string(isTouchingWall));
	
	if(isTouchingWall){
		

		var order;
		var checkSidesFirst = shouldICheckSidesFirst(velocityVector[0], velocityVector[1], cornersX, cornersY, wall);
		show_debug_message(checkSidesFirst);
		
		/*
		if(checkSidesFirst){
			order = ["left", "right", "top", "bottom"];
		} else {
			order = ["top", "bottom", "left", "right"];
		}
		*/
		
		if(checkSidesFirst){
			var moveFactor = findSidePermeance(self, velocityVector[0], velocityVector[1], wall);
			show_debug_message("side moveF bef: "+string(moveFactor)); 
			
			//moveFactor += self.sprite_width;
			moveFactor *= sign(velocityVector[0]);
			
			show_debug_message("side moveF aft: "+string(moveFactor));
			if(wall.isPushable){
				wall.x += moveFactor;
			} else {
				velocityVector[0] -= moveFactor//sign(velocityVector[0])*self.moveSpeed;
			}
		} else {
			var moveFactor = findTopsPermeance(self, velocityVector[0], velocityVector[1], wall);
			show_debug_message("tops moveF bef: "+string(moveFactor))
			
			//moveFactor += self.sprite_height;
			moveFactor *= sign(velocityVector[1]);
			
			show_debug_message("tops moveF aft: "+string(moveFactor))
			if(wall.isPushable){
				wall.y += moveFactor;
			} else {
				velocityVector[1] -= moveFactor//sign(velocityVector[1])*self.moveSpeed
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
