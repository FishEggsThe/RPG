if instance_number(Obj_Battle) > 1 {instance_destroy()}

enemyIDSave = -1
encounterText = "Oh Shit!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"

depth = -999
setTransitionTime = 120
alarm[0] = setTransitionTime
xFade = 0; yFade = 0

characterIndex = -1
menuIndex = 0
menuSpot = 0
battleOptions =  ["Attack", "Spells", "Items", "Nada"]
lastMenuIndex = 0
inventorySave = array_create_ext(4, function() {
	return array_create(3, noone)
})

enemyList = []
turnOrder = []
turnIndex = 0

width = display_get_gui_width(); height = display_get_gui_height()
boxX1 = width/8; boxY1 = height*4/6; boxX2 = width*7/8; boxY2 = height*5/6;
boxWidth = boxX2-boxX1; boxHeight = boxY2-boxY1

NextCharacter()