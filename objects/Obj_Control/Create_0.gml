if instance_number(Obj_Control) > 1 {instance_destroy()}

global.debug = false
global.tileSize = 64
global.paused = false

roomStates = ds_map_create();