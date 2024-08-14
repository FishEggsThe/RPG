function StartBattle(enemy, encounter){
	if instance_exists(Obj_Battle) {return}
	with instance_create_layer(0, 0, "Instances", Obj_Battle) {
		xFade = 32+enemy.x; yFade = 32+enemy.y
		enemyIDSave = enemy.roomStateID
		enemyList = encounter
		for(var i = 0; i < array_length(enemyList); i++)
			expReward += enemyList[i].expPoints
		
		SetPlayerState()
		StartTurn()
		//curves = array_create(array_length(enemyList), noone)
		//for(var i = 0; i < array_length(curves); i++) {
		//	curves[i] = animcurve_get_channel(enemyList[i].animCurve, "yCurve")
		//}
	}
}

function NextCharacter() {
	menuSpot = 0
	characterIndex++
	if characterIndex >= NumOfCharacters() {
		// Actually do the thing later
		actionTime = true
		
		//StartTurn()
	}
	
	inventorySave[characterIndex][0] = ReplaceArray(Obj_PlayerManager.inventory)
	
	// Debugging
	DebugShowInventorySaves()
}

function StartTurn() {
	var chars = NumOfCharacters(); var enems = array_length(enemyList)
	var numOfTurns = chars + enems; var orderTemp = array_create(numOfTurns, noone)
	
	for(var i = 0; i < chars; i++) {orderTemp[i] = Obj_PlayerManager.characters[i]}
	for(var i = 0; i < enems; i++) {orderTemp[chars+i] = enemyList[i]}
	
	turnOrder = array_create(numOfTurns, noone)
	for(var i = 0; i < numOfTurns; i++) {
		var maxSpeed = orderTemp[0].baseSpeed; var maxSpeedI = 0
		
		for(var j = 0; j < numOfTurns-i; j++) {
			if orderTemp[j].baseSpeed > maxSpeed {
				maxSpeed = orderTemp[j].baseSpeed
				maxSpeedI = j
				
			}
		}
		turnOrder[i] = orderTemp[maxSpeedI]
		array_delete(orderTemp, maxSpeedI, 1)
	}
	
	for(var i = 0; i < numOfTurns; i++)
		show_debug_message(string(turnOrder[i].baseSpeed) + " - " + turnOrder[i].name)
	
	actionTime = false
	characterIndex = -1
	inventorySave = array_create(4, noone)
	for(var i = 0; i < 4; i++) {inventorySave[i] = [[], "", []]}
	
	NextCharacter()
}

function LastCharacter() {
	if characterIndex <= 0 {show_message("bruh")}
	else {
		inventorySave[characterIndex][0] = []
		characterIndex--
		inventorySave[characterIndex][1] = ""
		inventorySave[characterIndex][2] = []
		Obj_PlayerManager.inventory = ReplaceArray(inventorySave[characterIndex][0])
	}
	DebugShowInventorySaves()
}

function EndBattle(roomIndex){
	RemoveFromRoomState(enemyIDSave, roomIndex)
	enemyIDSave = -1
	BeginDialogue("Good jon bruv")
	room_goto(roomIndex)
}

function DebugShowInventorySaves() {
	for(var i = 0; i < array_length(inventorySave); i++) {
		var names = ""
		for(var j = 0; j < array_length(inventorySave[i][0]); j++){
			var name = "none"
			if inventorySave[i][0][j] != noone
				name = inventorySave[i][0][j].name
			names+=(name + ", ")
			
		}
		if names == "" {names = " -"}
		show_debug_message(string(i) + ": " + names)
		
		//var action = ""
		//if inventorySave[i][1] != "" {
		//	action = string(inventorySave[i][1]) + " "
		//	if inventorySave[i][1] == "item"
		//		action += string(inventorySave[i][2][0].name) + " " + string(inventorySave[i][2][1].name)
		//}
		//show_debug_message(string(i) + ": " + action)
	}
	show_debug_message("")
}

function Spell(_cost, _range, _name, _desc) constructor{
	cost = _cost
	// 0 = Ally | 1 = Enemy
	target = 1
	// 0 = Single | 1 = All
	range = _range
	
	name = _name
	description = _desc
}

function OffenseSpell(_damage, _status, _cost, _range, _name, _desc) : Spell(_cost, _range, _name, _desc) constructor{
	target = 1
	damage = _damage
	statuses = _status
}

function SupportSpell(_heal, _cure, _boost, _cost, _range, _name, _desc) : Spell(_cost, _range, _name, _desc) constructor{
	target = 0
	heal = _heal
	cures = _cure
	boosts = _boost
}

function Enemy(_health, _sprite, _attacks, _speed, _def, _exp, _name, _pos, _curve, _percent = 1/60) constructor {
	name = _name
	//description = LayerText(30, _desc) //, _desc
	battleSprite = _sprite
	//animCurve = _curve
	animCurve = [animcurve_get_channel(_curve, "xCurve"),
				 animcurve_get_channel(_curve, "yCurve")]
	curvePercent = 0
	curvePercentIncrease = _percent
	xPos = _pos[0]
	yPos = _pos[1]
	
	attackList = _attacks
	
	maxHealth = _health
	currHealth = maxHealth
	baseSpeed = _speed
	baseDefense = _def
	expPoints = _exp
	
	static DrawEnemy = function() {
		curvePercent += curvePercentIncrease
		if curvePercent >= 1 {curvePercent--}
		//for(var i = 0; i < array_length(enemyList); i++) {
		var xPosNew = (xPos)+animcurve_channel_evaluate(animCurve[0], curvePercent)
		var yPosNew = (yPos)-animcurve_channel_evaluate(animCurve[1], curvePercent)
		draw_sprite(battleSprite, 0, xPosNew, yPosNew)
	}
}