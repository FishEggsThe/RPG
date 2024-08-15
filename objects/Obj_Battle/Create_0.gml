if instance_number(Obj_Battle) > 1 {instance_destroy()}
else {
	encounterText = "Oh Shit!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	
	enemyIDSave = -1
	lastRoom = room
	characterSave = array_create(array_length(Obj_PlayerManager.characters), noone)
	for(var i = 0; i < NumOfCharacters(); i++)
		characterSave[i] = Obj_PlayerManager.characters[i]

	depth = -999
	setTransitionTime = 120
	alarm[0] = setTransitionTime
	xFade = 0; yFade = 0

	numOfCharacters = NumOfCharacters()
	characterIndex = -1
	menuIndex = 0
	menuSpot = 0
	battleOptions =  ["Attack", "Spells", "Items", "Nada"]
	lastMenuIndex = 0
	spellIndex = 0
	//inventorySave = array_create_ext(4, function(){array_create(3, noone)})
	inventorySave = array_create(4, noone)
	for(var i = 0; i < 4; i++) {inventorySave[i] = [[], "", []]}
	willAttack = false

	actionTime = false
	enemyList = []
	turnOrder = []
	turnIndex = 0
	
	wonBattle = false
	lostBattle = false
	expReward = 0

	width = display_get_gui_width(); height = display_get_gui_height()
	boxX1 = width/8; boxY1 = height*4/6; boxX2 = width*7/8; boxY2 = height*5/6;
	boxWidth = boxX2-boxX1; boxHeight = boxY2-boxY1
}