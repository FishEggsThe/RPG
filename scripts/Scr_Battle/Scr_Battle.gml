function StartBattle(enemy, encounter){
	if instance_exists(Obj_Battle) {return}
	with instance_create_layer(0, 0, "Instances", Obj_Battle) {
		xFade = 32+enemy.x; yFade = 32+enemy.y
		enemyList = encounter
		
		RemoveFromRoomState(enemy.roomStateID)
		//var entityList = global.roomStates[? room]
		//for(var i = 0; i < array_length(entityList); i++) {
		//	var entityData = entityList[i]
		//	if enemy.roomStateID == entityData[0] {
		//		array_delete(global.roomStates[? room], i, 1)
		//		break
		//	}
		//}
		
		SetPlayerState()
		//curves = array_create(array_length(enemyList), noone)
		//for(var i = 0; i < array_length(curves); i++) {
		//	curves[i] = animcurve_get_channel(enemyList[i].animCurve, "yCurve")
		//}
	}
}

function EndBattle(roomIndex){
	room_goto(roomIndex)
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

function Enemy(_health, _sprite, _attacks, _speed, _def, _name, _curve, _percent = 1/60) constructor {
	name = _name
	//description = LayerText(30, _desc) //, _desc
	battleSprite = _sprite
	//animCurve = _curve
	animCurve = [animcurve_get_channel(_curve, "xCurve"),
				 animcurve_get_channel(_curve, "yCurve")]
	curvePercent = 0
	curvePercentIncrease = _percent
	
	attackList = _attacks
	
	maxHealth = _health
	currHealth = maxHealth
	baseSpeed = _speed
	baseDefense = _def
	
	static DrawEnemy = function() {
		curvePercent += curvePercentIncrease
		if curvePercent >= 1 {curvePercent--}
		//for(var i = 0; i < array_length(enemyList); i++) {
		var xPos = (room_width/2)+animcurve_channel_evaluate(animCurve[0], curvePercent)
		var yPos = (room_height/2)-animcurve_channel_evaluate(animCurve[1], curvePercent)
		draw_sprite(battleSprite, 0, xPos, yPos)
	}
}