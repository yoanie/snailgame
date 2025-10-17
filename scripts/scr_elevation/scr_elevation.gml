function elevationSet(lyr){
	temp = string_copy(layer_get_name(lyr), 11, 10);
	if(string_copy(temp, 1, 3) == "sub"){
		temp = "-" + string_copy(temp, 4, 2);
	}
	return real(temp);
}

function findLayerNameOfElevationLevel(newElevationInt){
	var newElevation = "Instances_";
	if(newElevationInt >= 0){
		newElevation += string(newElevationInt);
	} else {
		newElevation += "sub" + string(abs(newElevationInt));
	}
	
	if(layer_exists(newElevation)){
		return newElevation;
	}
	return "oob";
}