if(inventory[selectedItemPointer] == pointer_null) {
	return;
}

var newX = obj_snail.x;
var newY = obj_snail.y;
var lyr = layer_get_name(obj_snail.layer);
instance_create_layer(newX, newY, lyr, inventory[selectedItemPointer].object_index);
inventory[selectedItemPointer] = pointer_null;