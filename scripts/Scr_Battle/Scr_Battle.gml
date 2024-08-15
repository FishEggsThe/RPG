#region // Beginning and Ending a Battle
function StartBattle(enemy, encounter){
	if instance_exists(Obj_Battle) {return}
	with instance_create_layer(0, 0, "Instances", Obj_Battle) {
		xFade = 32+enemy.x; yFade = 32+enemy.y
		enemyIDSave = enemy.roomStateID
		enemyList = encounter
		lastRoom = room
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

function EndBattle(roomIndex){
	wonBattle = false
	actionTime = false
	RemoveFromRoomState(enemyIDSave, roomIndex)
	enemyIDSave = -1
	//BeginDialogue("Good jon bruv")
	room_goto(roomIndex)
}
#endregion

#region // Decision Phase
function StartTurn() {
	MoveDownList()
	
	var chars = NumOfCharacters(); var enems = array_length(enemyList)
	var numOfTurns = chars + enems; var orderTemp = array_create(numOfTurns, noone)
	
	for(var i = 0; i < chars; i++) {orderTemp[i] = [Obj_PlayerManager.characters[i], "player"]}
	for(var i = 0; i < enems; i++) {orderTemp[chars+i] = [enemyList[i], "enemy"]}
	
	turnOrder = array_create(numOfTurns, noone)
	for(var i = 0; i < numOfTurns; i++) {
		var maxSpeed = orderTemp[0][0].baseSpeed; var maxSpeedI = 0
		
		for(var j = 0; j < numOfTurns-i; j++) {
			if orderTemp[j][0].baseSpeed > maxSpeed {
				maxSpeed = orderTemp[j][0].baseSpeed
				maxSpeedI = j
				
			}
		}
		turnOrder[i] = orderTemp[maxSpeedI]
		array_delete(orderTemp, maxSpeedI, 1)
	}
	
	for(var i = 0; i < numOfTurns; i++) {
		show_debug_message(string(turnOrder[i][0].baseSpeed) + " - " + turnOrder[i][0].name + " " + turnOrder[i][1])
	}
	
	actionTime = false
	characterIndex = -1
	inventorySave = array_create(4, noone)
	for(var i = 0; i < 4; i++) {inventorySave[i] = [[], "", []]}
	
	NextCharacter()
}

function NextCharacter() {
	menuSpot = 0
	characterIndex++
	if characterIndex >= NumOfCharacters() {
		// Actually do the thing later
		actionTime = true
		StartAction()
		
		//StartTurn()
	}
	
	inventorySave[characterIndex][0] = ReplaceArray(Obj_PlayerManager.inventory)
	
	// Debugging
	DebugShowInventorySaves()
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
#endregion

#region // Action Phase
function StartAction() {
	turnIndex = -1
	
	NextAction()
}

function NextAction() {
	// Checks if all of one part has been vanquished
	var allDead = true
	for(var i = 0; i < array_length(enemyList); i++) {
		if !enemyList[i].dead {allDead = false; break}
	}
	if allDead {
		wonBattle = true
		for(var i = 0; i < NumOfCharacters(); i++)
			Obj_PlayerManager.characters[i].experience += expReward
		
		BeginDialogue(["Battle won!!!", string(expReward) + " EXP gained"])
		return
	}
	
	do {turnIndex++}
	until(turnIndex >= array_length(turnOrder) || 
		  !turnOrder[turnIndex][0].dead);
	
	if turnIndex >= array_length(turnOrder) {
		EndAction()
	} else {
		switch(turnOrder[turnIndex][1]) {
			case "player":
				PlayerAction()
				break
			case "enemy":
				EnemyAction()
				break
		}
	}
}

function PlayerAction() {
	var player = turnOrder[turnIndex][0]
	var action = inventorySave[player.index][1]
	var actionList = inventorySave[player.index][2]
	var actionDialogue = ""
	
	switch(action) {
		case "attack":
			var enemy = enemyList[actionList[0]]
			
			// Damage calculation
			var damageTotal = player.baseAttack
			if player.weapon != noone {damageTotal += player.weapon.damage}
			damageTotal -= enemy.baseDefense
			if damageTotal < 1 {damageTotal = 1}
			
			// Damage application
			enemy.currHealth -= damageTotal 
			if enemy.currHealth <= 0 {enemy.dead = true}
			enemy.SetHitFlash()
			
			actionDialogue = [player.name + " swung at " + enemy.name,
							  "Dealt " + string(damageTotal) + " damage!!"]
			break
			
		case "spell":
			var enemy = enemyList[actionList[0]]
			var spell = player.spellList[actionList[1]]

			
			// Damage calculation
			var magicDamageTotal = spell.damage + player.baseMagic
			if magicDamageTotal < 1 {magicDamageTotal = 1}
			
			// Damage application
			enemy.currHealth -= magicDamageTotal 
			if enemy.currHealth <= 0 {enemy.dead = true}
			enemy.SetHitFlash()
			
			// Spell taking Mana because obviously
			player.currMana -= spell.cost
			if player.currMana <= 0 {player.currMana = 0}
			
			actionDialogue = [player.name + " cast " + spell.name + " upon " + enemy.name,
							  "Dealt " + string(magicDamageTotal) + " damage!!"]
			break
			
		case "item":
			with Obj_PlayerManager
			{UseItem(actionList[0], actionList[1], actionList[2])}
			
			actionDialogue = []
			break
			
		case "nada":
			actionDialogue = ["nada"]
			break
	}
	if array_length(actionDialogue) > 0 {BeginDialogue(actionDialogue)}
}

function EnemyAction() {
	var enemy = turnOrder[turnIndex][0]
	var player = Obj_PlayerManager.characters[irandom(NumOfCharacters()-1)]
	var actionDialogue = ""
	if irandom(1) == 0 { // Attack
			
		// Damage calculation
		var damageTotal = enemy.baseAttack
		damageTotal -= player.baseDefense
		if player.armor != noone {damageTotal -= player.armor.defense}
		if damageTotal < 1 {damageTotal = 1}
			
		// Damage application
		player.currHealth -= damageTotal 
		if player.currHealth <= 0 {player.dead = true}
		//enemy.SetHitFlash()
			
		actionDialogue = [enemy.name + " attacked " + player.name,
							"Dealt " + string(damageTotal) + " damage!!"]
	} else { // Spell
		var spellIndex = 0//irandom(array_length(enemy.spellList) - 1)
		var spell = enemy.spellList[spellIndex]

			
		// Damage calculation
		var magicDamageTotal = spell.damage + enemy.baseMagic
		if magicDamageTotal < 1 {magicDamageTotal = 1}
			
		// Damage application
		player.currHealth -= magicDamageTotal 
		if player.currHealth <= 0 {player.dead = true}
		//enemy.SetHitFlash()
			
		// Spell taking Mana because obviously
		player.currMana -= spell.cost
		if player.currMana <= 0 {player.currMana = 0}
			
		actionDialogue = [enemy.name + " hexxed " + player.name + " with " + spell.name,
							  "Dealt " + string(magicDamageTotal) + " damage!!"]
	}
	BeginDialogue(actionDialogue)
}

function EndAction() {
	actionTime = false
	
	for(var i = 0; i < array_length(enemyList); i++) {
		if enemyList[i].dead {
			array_delete(enemyList, i, 1)
			i--
		}
	}
	
	StartTurn()
}
#endregion

#region // Debug Stuff
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
#endregion

#region // Constructors for Spells and an Enemy
function Spell(_cost, _range, _name, _desc) constructor{
	cost = _cost
	name = _name
	description = _desc
	
	// 0 = Ally | 1 = Enemy
	target = 1
	// 0 = Single | 1 = All
	range = _range
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

function Enemy(_health, _sprite, _spells, _attack, _speed, _def, _magic, _exp, _name, _pos, _curve, _percent = 1/60) constructor {
	name = _name
	//description = LayerText(30, _desc) //, _desc
	battleSprite = _sprite
	//animCurve = _curve
	animCurve = [animcurve_get_channel(_curve, "xCurve"),
				 animcurve_get_channel(_curve, "yCurve")]
	curvePercent = 0
	curvePercentIncrease = _percent
	flashTime = 0
	setFlashTime = 40
	xPos = _pos[0]
	yPos = _pos[1]
	
	spellList = _spells
	
	maxHealth = _health
	currHealth = maxHealth
	baseAttack = _attack
	baseSpeed = _speed
	baseDefense = _def
	baseMagic = _magic
	expPoints = _exp
	
	dead = false
	deathTime = 1
	
	static SetHitFlash = function() {
		flashTime = setFlashTime
	}
	
	static DrawEnemy = function() {
		curvePercent += curvePercentIncrease
		if curvePercent >= 1 {curvePercent--}
		
		var xPosNew = (xPos)+animcurve_channel_evaluate(animCurve[0], curvePercent)
		var yPosNew = (yPos)-animcurve_channel_evaluate(animCurve[1], curvePercent)
		
		var arbitraryNumber = (setFlashTime/10)
		var setFlash = flashTime%arbitraryNumber > arbitraryNumber/2
		gpu_set_fog(setFlash, c_white, 0, 1000)
		draw_sprite_ext(battleSprite, 0, xPosNew, yPosNew, 1, 1, 0, c_white, deathTime)
		gpu_set_fog(false, c_white, 0, 1000)
		
		if flashTime > 0
			flashTime--
		else if dead
			deathTime -= 1/setFlashTime
	}
}
#endregion