if instance_number(Obj_Battle) > 1 {instance_destroy()}

enemyIDSave = -1

depth = -999
setTransitionTime = 120
alarm[0] = setTransitionTime
xFade = 0; yFade = 0

enemyList = []
turnOrder = []
turnIndex = 0

curves = []
percent = 0