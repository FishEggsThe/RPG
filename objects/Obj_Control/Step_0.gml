if keyboard_check_pressed(ord("I")) {
	global.debug = !global.debug
	show_debug_message("Debug mode: " + string(global.debug))
}