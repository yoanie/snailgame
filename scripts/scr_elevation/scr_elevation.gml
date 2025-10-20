

function elevationSet(currentLayer){
	temp = string_copy(layer_get_name(currentLayer), 11, 10);
	
	//dashes can't be used in a layer name
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

function reidentifyElevationObjects(currentElevation){
	layerName = findLayerNameOfElevationLevel(currentElevation);
	if(layerName != "oob"){
		return reidentifyElevationObjectsByLayerName(layerName);
	}
	blankArray = [];
	return blankArray;
}

function reidentifyElevationObjectsByLayerName(layerName){
	var temp = layer_get_all_elements(layerName);
	var result;
	for (var i = 0; i < array_length(temp); i++) {
    if (layer_get_element_type(temp[i]) == layerelementtype_instance) {
        var element = layer_instance_get_instance(temp[i]);
        result[i] = element;
    }
}
	return result;
}