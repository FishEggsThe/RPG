if keyboard_check_pressed(vk_anykey) {
	for(var i = 0; i < ds_list_size(backgroundStorage); i++) {
		if keyboard_check_pressed(ord(string(i+1))) {
			backgroundID = i; break
		}
	}
	
	backgroundList = backgroundStorage[| backgroundID]
	backgroundListSize = array_length(backgroundList)
}