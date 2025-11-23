function shouldICheckSidesFirst(xVelocity, yVelocity, cornersX, cornersY, inst){
	show_debug_message("hi");
	
	var topsPermeance = findTopsPermeance(self, xVelocity, yVelocity, inst);
	var sidesPermeance = findSidePermeance(self, xVelocity, yVelocity, inst);
				
	show_debug_message(string(self.x)+" "+string(self.bbox_left)+" "+string(self.bbox_right) );
	show_debug_message(string(inst.x)+" "+string(inst.bbox_left)+" "+string(inst.bbox_right) );
	
	if(sidesPermeance==0){
		return true;
	} else if(topsPermeance==0){
		return false;
	}
	
	if(sidesPermeance<0){
		return true;
	} else if(topsPermeance<0){
		return false;
	}
	//uhhhhhhhh
	return sidesPermeance < topsPermeance;
}

//unused
function findWallThatsTouching(plyr, xVelocity, yVelocity, cornersX, cornersY, list){
	var insts = ds_list_create();
	for(var t = 0; t < 4; t++){
		instance_position_list(cornersX[t]+xVelocity, cornersY[t]+yVelocity, list, insts, true);	
		
		for(var i = 0; i < ds_list_size(insts); i++){
			var wall = insts[| i];
			if(object_is_ancestor(wall.object_index, obj_wall_parent)){
				
				ds_list_destroy(insts);
				return wall;
			}
		}
		ds_list_clear(insts);
	}
	
	ds_list_destroy(insts); //must have this line, otherwise memory issues
	
	//ehhhhhhh
	//show_debug_message("findWallThatsTouching messed up");
	return pointer_null;
}

function findWallsThatsTouching(plyr, xVelocity, yVelocity, cornersX, cornersY, list){
	var wallsList = [];
	var insts = ds_list_create();
	
	for(var t = 0; t < 4; t++){
		instance_position_list(cornersX[t]+xVelocity, cornersY[t]+yVelocity, list, insts, true);	
		
		for(var i = 0; i < ds_list_size(insts); i++){
			var wall = insts[| i];
			if(object_is_ancestor(wall.object_index, obj_wall_parent)){
				
				//search array for copies
				var isCopy = false;
				for(var w = 0; w < array_length(wallsList); w++){
					if(wall == wallsList[w]){ isCopy = true; }
				}
				
				if(!isCopy){
					array_insert(wallsList, array_length(wallsList)-1, wall);
				}
			}
		}
		ds_list_clear(insts);
	}
	ds_list_destroy(insts); //must have this line, otherwise memory issues
	
	return wallsList;
}

function findSidePermeance(plyr, xVelocity, yVelocity, inst){
	var sidesPermeance = -xVelocity;
	if(xVelocity > 0){
		//sidesPermeance = plyr.sprite_xoffset + plyr.bbox_right - (inst.sprite_xoffset - inst.bbox_left);
		sidesPermeance += plyr.bbox_right - inst.bbox_left;
	} else if(xVelocity < 0){
		//sidesPermeance = inst.sprite_xoffset + inst.bbox_right - (plyr.sprite_xoffset - plyr.bbox_left);
		sidesPermeance += inst.bbox_right - plyr.bbox_left;
	} else {
		sidesPermeance += min(plyr.bbox_right - inst.bbox_left, inst.bbox_right - plyr.bbox_left);
	}
	show_debug_message("	sidePer: "+string(sidesPermeance));
	return sidesPermeance;
}

function findTopsPermeance(plyr, xVelocity, yVelocity, inst){
	var topsPermeance = -yVelocity;
	if(yVelocity > 0){
		//topsPermeance = plyr.sprite_yoffset + plyr.bbox_bottom - (inst.sprite_yoffset - inst.bbox_top);
		topsPermeance += plyr.bbox_bottom - inst.bbox_top;
	} else if(yVelocity < 0){
		//topsPermeance = inst.sprite_yoffset + inst.bbox_bottom - (plyr.sprite_yoffset - plyr.bbox_top);
		topsPermeance += inst.bbox_bottom - plyr.bbox_top;
	} else {
		topsPermeance += min(plyr.bbox_bottom - inst.bbox_top, inst.bbox_bottom - plyr.bbox_top);
	}
	show_debug_message("	topsPer: "+string(topsPermeance));
	return topsPermeance;
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
			if(object_is_ancestor(inst.object_index, obj_wall_parent)){
				
				temp = true;
			}
		}
		ds_list_clear(insts);
			
		result = temp || result;
	}
	ds_list_destroy(insts); //must have this line, otherwise memory issues
	
	return result;
}