function snugLedges(xVelocity, yVelocity, cornersX, cornersY, elevation){
	if(elevation == 0){
		var result = [xVelocity, yVelocity];
		return result;
	}
	
	var cornersOffLedge = [false, false, false, false];

	for(var t = 0; t < 4; t++){
		//test if off ledge if player moves by xVelocity and yVelocity
		cornersOffLedge[t] = isTouchingNothing(cornersX[t]+xVelocity, cornersY[t]+yVelocity, eyelevel);
	}

	//show_debug_message(cornersOffLedge);
	
	//check up/down
	while(cornersOffLedge[0] && cornersOffLedge[1] || cornersOffLedge[2] && cornersOffLedge[3]){
		//show_debug_message("a");
		yVelocity += (cornersOffLedge[0] && cornersOffLedge[1] ? 1 :
					(cornersOffLedge[2] && cornersOffLedge[3] ? -1 : 0));
		for(var t = 0; t < 4; t++){
			//test if off ledge if player moves by xVelocity and yVelocity
			cornersOffLedge[t] = isTouchingNothing(cornersX[t]+xVelocity, cornersY[t]+yVelocity, eyelevel);
		}
	}
	
	//check left/right
	while(cornersOffLedge[0] && cornersOffLedge[3] || cornersOffLedge[1] && cornersOffLedge[2]){
		//show_debug_message("b");
		xVelocity += (cornersOffLedge[0] && cornersOffLedge[3] ? 1 :
					(cornersOffLedge[1] && cornersOffLedge[2] ? -1 : 0));
		for(var t = 0; t < 4; t++){
			//test if off ledge if player moves by xVelocity and yVelocity
			cornersOffLedge[t] = isTouchingNothing(cornersX[t]+xVelocity, cornersY[t]+yVelocity, eyelevel);
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
			cornersOffLedge[t] = isTouchingNothing(cornersX[t]+xVelocity, cornersY[t]+yVelocity, eyelevel);
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

function isTouchingNothing(xVal, yVal, list){
	var insts = ds_list_create();
	instance_position_list(xVal, yVal, list, insts, false);	
	var result = ds_list_size(insts);
	ds_list_destroy(insts); //must have this line, otherwise memory issues
	
	if(result == 0){
		return true;
	}
	return false;
}