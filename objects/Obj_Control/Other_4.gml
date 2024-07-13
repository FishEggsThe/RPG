if !ds_map_exists(roomStates, room) {
	ds_map_add(roomStates, room, 1)
}

var tempKey = []; var tempVal = []; var dsmap = []
ds_map_keys_to_array(roomStates, tempKey)
ds_map_values_to_array(roomStates, tempVal)

for(var i = 0; i < array_length(tempKey); i++)
	show_debug_message(string(tempKey[i]) + ": " + string(tempVal[i]))