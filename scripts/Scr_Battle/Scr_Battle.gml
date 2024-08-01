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

function Spell(_cost, _name, _desc) constructor{
	cost = _cost
	// 0 = Ally | 1 = Enemy
	target = 1
	
	name = _name
	description = _desc
}

function OffenseSpell(_damage, _status, _cost, _name, _desc) : Spell(_cost, _name, _desc) constructor{
	target = 1
	damage = _damage
	statuses = _status
}

function SupportSpell(_heal, _cure, _boost, _cost, _name, _desc) : Spell(_cost, _name, _desc) constructor{
	target = 0
	heal = _heal
	cures = _cure
	boosts = _boost
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