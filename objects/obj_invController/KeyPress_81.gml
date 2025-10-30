///@description drop selected item, if exists

if(inventory[selectedItemPointer] == pointer_null){
	return;
}

var newX = obj_snail.x;
var newY = obj_snail.y;
var lyr = findLayerNameOfElevationLevel(obj_snail.elevationLevel);
instance_create_layer(newX, newY, lyr, inventory[selectedItemPointer].object_index);
inventory[selectedItemPointer] = pointer_null;
