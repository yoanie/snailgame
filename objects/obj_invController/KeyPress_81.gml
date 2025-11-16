if(inventory[selectedItemPointer] == pointer_null) {
	return;
}
audio_play_sound(sfx_dropItem, 0, false);
var newX = obj_snail.x;
var newY = obj_snail.y;
var lyr = findLayerNameOfElevationLevel(obj_snail.elevationLevel);
instance_create_layer(newX, newY, lyr, inventory[selectedItemPointer].object_index);
inventory[selectedItemPointer] = pointer_null;