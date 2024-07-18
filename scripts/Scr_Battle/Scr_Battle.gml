function StartBattle(enemy, encounter){
	if instance_exists(Obj_Battle) {return}
	with instance_create_layer(0, 0, "Instances", Obj_Battle) {
		xFade = 32+enemy.x; yFade = 32+enemy.y

	}
}

function LeaveBattle(roomIndex){
	room_goto(roomIndex)
}

function Enemy(_health, _sprite, _attacks, _attack, _speed, _def, _magic, _name) constructor {
	name = _name
	//description = LayerText(30, _desc) //, _desc
	battleSprite = _sprite
	
	attackList = _attacks
	
	maxHealth = _health
	currHealth = maxHealth
	baseAttack = _attack
	baseSpeed = _speed
	baseDefense = _def
	baseMagic = _magic
	
}