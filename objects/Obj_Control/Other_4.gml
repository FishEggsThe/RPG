if !ds_map_exists(roomStates, room) {
	var numOfEntities = instance_number(Obj_Interactable)
	var listOfEntities = array_create(numOfEntities, noone)
	for(var i = 0; i < numOfEntities; i++)
		listOfEntities[i] = instance_find(Obj_Interactable, i)
	ds_map_add(roomStates, room, listOfEntities)
}

var tempKey = []; var tempVal = []; var dsmap = []
tempKey = ds_map_keys_to_array(roomStates)
tempVal = ds_map_values_to_array(roomStates)

for(var i = 0; i < array_length(tempKey); i++)
	show_debug_message(string(tempKey[i]) + ": " + string(tempVal[i]))