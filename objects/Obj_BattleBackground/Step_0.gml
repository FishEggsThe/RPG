if keyboard_check_pressed(vk_anykey) {
	if keyboard_check_pressed(ord("1"))
		backgroundID = 0
	else if keyboard_check_pressed(ord("2"))
		backgroundID = 1
	else if keyboard_check_pressed(ord("3"))
		backgroundID = 2
	else if keyboard_check_pressed(ord("4"))
		backgroundID = 3
	else if keyboard_check_pressed(ord("5"))
		backgroundID = 4

	backgroundList = backgroundStorage[| backgroundID]
	backgroundListSize = array_length(backgroundList)
}