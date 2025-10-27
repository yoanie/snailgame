function findNextEmptyIndexInInventory(list){
	for(var i = 0; i < array_length(list); i++){
		if(list[i] != pointer_null){
			return i;
		}
	}
	return -1;
}