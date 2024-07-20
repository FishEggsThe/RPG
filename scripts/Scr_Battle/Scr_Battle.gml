function StartBattle(enemy, encounter){
	if instance_exists(Obj_Battle) {return}
	with instance_create_layer(0, 0, "Instances", Obj_Battle) {
		xFade = 32+enemy.x; yFade = 32+enemy.y
		enemyList = encounter
		curves = array_create(array_length(enemyList), noone)
		for(var i = 0; i < array_length(curves); i++) {
			curves[i] = animcurve_get_channel(enemyList[i].animCurve, "yCurve")
		}
	}
}

function LeaveBattle(roomIndex){
	room_goto(roomIndex)
}

function Spell(_damage) constructor{
	damage = _damage
}

function Enemy(_health, _sprite, _attacks, _speed, _def, _name, _curve) constructor {
	name = _name
	//description = LayerText(30, _desc) //, _desc
	battleSprite = _sprite
	animCurve = _curve
	
	attackList = _attacks
	
	maxHealth = _health
	currHealth = maxHealth
	baseSpeed = _speed
	baseDefense = _def
	
}