if keyboard_check_pressed(ord("I")) {
	global.debug = !global.debug
	show_debug_message("Debug mode: " + string(global.debug))
}

if global.debug {
	if keyboard_check_pressed(vk_enter) {
		if instance_exists(Obj_Battle)
			with Obj_Battle {EndBattle(0)}
	}
}