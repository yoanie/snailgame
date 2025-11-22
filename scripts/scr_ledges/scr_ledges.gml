function snugLedges(xVelocity, yVelocity, cornersX, cornersY, elevation){
	if(elevation == 0){
		var result = [xVelocity, yVelocity];
		return result;
	}
	
	var cornersOffLedge = [false, false, false, false];

	for(var t = 0; t < 4; t++){
		//test if off ledge if player moves by xVelocity and yVelocity
		cornersOffLedge[t] = isOnLedgeAndNotInWall(cornersX[t]+xVelocity, cornersY[t]+yVelocity, eyelevel);
	}

	//show_debug_message(cornersOffLedge);
	
	//check up/down
	while(cornersOffLedge[0] && cornersOffLedge[1] || cornersOffLedge[2] && cornersOffLedge[3]){
		//show_debug_message("a");
		yVelocity += (cornersOffLedge[0] && cornersOffLedge[1] ? 1 :
					(cornersOffLedge[2] && cornersOffLedge[3] ? -1 : 0));
		for(var t = 0; t < 4; t++){
			//test if off ledge if player moves by xVelocity and yVelocity
			cornersOffLedge[t] = isOnLedgeAndNotInWall(cornersX[t]+xVelocity, cornersY[t]+yVelocity, eyelevel);
		}
	}
	
	//check left/right
	while(cornersOffLedge[0] && cornersOffLedge[3] || cornersOffLedge[1] && cornersOffLedge[2]){
		//show_debug_message("b");
		xVelocity += (cornersOffLedge[0] && cornersOffLedge[3] ? 1 :
					(cornersOffLedge[1] && cornersOffLedge[2] ? -1 : 0));
		for(var t = 0; t < 4; t++){
			//test if off ledge if player moves by xVelocity and yVelocity
			cornersOffLedge[t] = isOnLedgeAndNotInWall(cornersX[t]+xVelocity, cornersY[t]+yVelocity, eyelevel);
		}
	}
	
	var hasEdgeCase = cornersOffLedge[0];
	for(var t = 1; t < 4; t++){
		hasEdgeCase ^= cornersOffLedge[t];
	}
	//show_debug_message(hasEdgeCase);
	
	if(hasEdgeCase){
		if(cornersOffLedge[0]){
			//above, so y must be going down.
			//or, could be x must be going right. 
			if(yVelocity>0){
				//y is going down.
				xVelocity = 0;
			} else {
				//x is going right.
				yVelocity = 0;
			}
		} else if(cornersOffLedge[1]){
			//above, so y must be going down.
			//or, could be x must be going left. 
			if(yVelocity>0){
				//y is going down.
				xVelocity = 0;
			} else if (xVelocity<0){
				//x is going left.
				yVelocity = 0;
			}
		}else if(cornersOffLedge[2]){
			//below, so y must be going up.
			//or, could be x must be going left. 
			if(yVelocity<0){
				//y is going up.
				xVelocity = 0;
			} else if (xVelocity<0){
				//x is going left.
				yVelocity = 0;
			}
		} else {
			//below, so y must be going up.
			//or, could be x must be going right. 
			if(yVelocity<0){
				//y is going up.
				xVelocity = 0;
			} else if (xVelocity>0){
				//x is going left.
				yVelocity = 0;
			}
		}
		
		for(var t = 0; t < 4; t++){
			//test if off ledge if player moves by xVelocity and yVelocity
			cornersOffLedge[t] = isOnLedgeAndNotInWall(cornersX[t]+xVelocity, cornersY[t]+yVelocity, eyelevel);
		}
	}
	
	
	//catch all if undetected ledge shape
	if(cornersOffLedge[0] || cornersOffLedge[1] || cornersOffLedge[2] || cornersOffLedge[3]){
		xVelocity = 0;
		yVelocity = 0;
	}

	var result = [xVelocity, yVelocity];
	return result;
}

function isOnLedgeAndNotInWall(xVal, yVal, list){
	var insts = ds_list_create();
	instance_position_list(xVal, yVal, list, insts, false);	
	
	for(var i = 0; i < ds_list_size(insts); i++){
		var object = insts[| i];
		if(object != obj_tile_parent){
			ds_list_destroy(insts); //must have this line, otherwise memory issues
			return false;
		}
	}
	ds_list_destroy(insts); //must have this line, otherwise memory issues
	return true;
	
	/*var insts = ds_list_create();
	instance_position_list(xVal, yVal, list, insts, false);	
	var result = ds_list_size(insts);
	ds_list_destroy(insts); //must have this line, otherwise memory issues
	
	if(result == 0){
		return true;
	}
	return false;*/
}

function isOneOffLedgeOrInWall(xVelocity, yVelocity, cornersX, cornersY, elevation){
	var result = false;

	if(elevation != 0){
		for(var t = 0; t < 4; t++){
			//test if off ledge if player moves by xVelocity and yVelocity
			result = result || !isOnLedgeAndNotInWall(cornersX[t]+xVelocity, cornersY[t]+yVelocity, eyelevel);
		}
	}
	

	
	return result;
}

function shouldICheckSidesFirst(xVelocity, yVelocity, cornersX, cornersY, inst){
	show_debug_message("hi");
	
	var topsPermeance = findTopsPermeance(self, xVelocity, yVelocity, inst);
	var sidesPermeance = findSidePermeance(self, xVelocity, yVelocity, inst);
				
	show_debug_message(string(self.x)+" "+string(self.bbox_left)+" "+string(self.bbox_right) );
	show_debug_message(string(inst.x)+" "+string(inst.bbox_left)+" "+string(inst.bbox_right) );
	
	if(sidesPermeance<0){
		return true;
	} else if(topsPermeance<0){
		return false;
	}
	//uhhhhhhhh
	return sidesPermeance < topsPermeance;
}

function findWallThatsTouching(plyr, xVelocity, yVelocity, cornersX, cornersY, list){
	var insts = ds_list_create();
	for(var t = 0; t < 4; t++){
		instance_position_list(cornersX[t]+xVelocity, cornersY[t]+yVelocity, list, insts, false);	
	
		for(var i = 0; i < ds_list_size(insts); i++){
			var wall = insts[| i];
			if(wall.object_index == obj_invisWall){
				ds_list_destroy(insts);

				return wall;
			}
		}
		ds_list_clear(insts);
	}
	ds_list_destroy(insts); //must have this line, otherwise memory issues
	
	//ehhhhhhh
	return pointer_null;
}

function findSidePermeance(plyr, xVelocity, yVelocity, inst){
	var sidesPermeance = 0;
	if(xVelocity > 0){
		//sidesPermeance = plyr.sprite_xoffset + plyr.bbox_right - (inst.sprite_xoffset - inst.bbox_left);
		sidesPermeance = plyr.bbox_right - (inst.bbox_left);
	} else if(xVelocity < 0){
		//sidesPermeance = inst.sprite_xoffset + inst.bbox_right - (plyr.sprite_xoffset - plyr.bbox_left);
		sidesPermeance = inst.bbox_right - (plyr.bbox_left);
	}
	show_debug_message("	sidePer: "+string(sidesPermeance));
	return sidesPermeance;
}

function findTopsPermeance(plyr, xVelocity, yVelocity, inst){
	var topsPermeance = 0;
	if(yVelocity > 0){
		//topsPermeance = plyr.sprite_yoffset + plyr.bbox_bottom - (inst.sprite_yoffset - inst.bbox_top);
		topsPermeance = plyr.bbox_bottom - (inst.bbox_top);
	} else if(yVelocity < 0){
		//topsPermeance = inst.sprite_yoffset + inst.bbox_bottom - (plyr.sprite_yoffset - plyr.bbox_top);
		topsPermeance = inst.bbox_bottom - (plyr.bbox_top);
	}
	show_debug_message("	topsPer: "+string(topsPermeance));
	return topsPermeance;
}

//for use for snail externally
function elevationBasedWallDetectionDirection(xVelocity, yVelocity, cornersX, cornersY, list, side){
	//show_debug_message(list)
	
	var cornersToCheck = [0,1];
	if(side=="bottom"){ cornersToCheck = [2,3]; }
	else if(side=="left"){ cornersToCheck = [0,3]; }
	else if(side=="right"){ cornersToCheck = [1,2]; }
	
	var result = false;
	var insts = ds_list_create();

	for(var t = 0; t < 2; t++){
		//test if in wall if player moves by xVelocity and yVelocity
		instance_position_list(cornersX[cornersToCheck[t]]+xVelocity, cornersY[cornersToCheck[t]]+yVelocity, list, insts, false);	
		var temp = false;
	
		for(var i = 0; i < ds_list_size(insts); i++){
			var inst = insts[| i];
			if(inst.object_index == obj_invisWall){
				
				temp = true;
			}
		}
		ds_list_clear(insts);
			
		result = temp || result;
	}
	ds_list_destroy(insts); //must have this line, otherwise memory issues
	
	return result;
}

//for use for snail externally
function elevationBasedWallDetectionPreliminary(xVelocity, yVelocity, cornersX, cornersY, list){
	//show_debug_message(list
	
	var result = false;
	var insts = ds_list_create();

	for(var t = 0; t < 4; t++){
		//test if in wall if player moves by xVelocity and yVelocity
		instance_position_list(cornersX[t]+xVelocity, cornersY[t]+yVelocity, list, insts, false);	
		var temp = false;
	
		for(var i = 0; i < ds_list_size(insts); i++){
			var inst = insts[| i];
			if(inst.object_index == obj_invisWall){
				
				temp = true;
			}
		}
		ds_list_clear(insts);
			
		result = temp || result;
	}
	ds_list_destroy(insts); //must have this line, otherwise memory issues
	
	return result;
}