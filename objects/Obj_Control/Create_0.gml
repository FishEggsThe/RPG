if instance_number(Obj_Control) > 1 {instance_destroy()}
else {
	playerStateSave = noone

	global.debug = false
	global.tileSize = 64
	global.paused = false
	
	global.levelRequirements = [0, 10, 30, 60, 100]

	global.roomStates = ds_map_create()
}