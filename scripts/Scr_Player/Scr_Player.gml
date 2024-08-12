#macro tile (global.tileSize)

function PlayerStats(_health, _mana, _port, _walk, _equip, _wep, _armor, _spells, _attack, _speed, _def, _magic, _name, _desc) constructor {
	name = _name
	description = LayerText(30, _desc)
	portraitSprites = _port
	walkSprites = _walk
	
	// 0 = Swords & Shields
	// 1 = idk
	// 2 = Fake Teeth and Shinguards
	// 3 = something
	equipmentChoice = _equip
	weapon = _wep
	armor = _armor
	spellList = _spells
	
	maxHealth = _health
	currHealth = maxHealth
	maxMana = _mana
	currMana = maxMana
	baseAttack = _attack
	baseSpeed = _speed
	baseDefense = _def
	baseMagic = _magic
	
}

function MovePlayer() {
	if canMove {
		if moveTime <= 0 {
			var xDirection = input_check("right")-input_check("left")
			var yDirection = input_check("down")-input_check("up")
		
			if (xDirection != 0 || yDirection != 0) {
				var last_input = input_check_press_most_recent(["right", "left", "up", "down"])
				var hOrV = (last_input == "right" || last_input == "left")
				var moveOrder = [hOrV, !hOrV]
				
				for(var i = 0; i < array_length(moveOrder); i++) {
					if (moveOrder[i] && !TileCollision(xDirection, 0))
					{xMove = xDirection; yMove = 0; facing = 1-xDirection; break}
					if (!moveOrder[i] && !TileCollision(0, yDirection))
					{yMove = yDirection; xMove = 0; facing = 2+yDirection; break}
				}
				
				
				
				if TileCollision(xMove, yMove) {
					xMove = 0; yMove = 0
				} else if (xMove == 0 && yMove == 0) {
					facing = (moveOrder[0] ? 1-xDirection : 2+yDirection)
				} else {
					moveTime = moveTimeSet
				}
			}
		
		} if moveTime > 0 {
			var moveSpeed = tile/moveTimeSet
			
			x += moveSpeed*xMove
			y += moveSpeed*yMove
			moveTime--
			
			if moveTime <= 0 {
				x = round(x); y = round(y)
				if instance_exists(Obj_Enemy) {
					var enemyNear = instance_nearest(x, y, Obj_Enemy)
					var enemyDistance = point_distance(x, y, enemyNear.x, enemyNear.y)
					if enemyDistance <= sqrt(tile*tile*2) {
						//show_message("Balls")
						depth = -1000
						enemyNear.depth = -1000
						BeginDialogue(enemyNear.dialogue, enemyNear)
						//StartBattle(enemyNear, enemyNear.enemyInfo)
					}
				}
				
				if instance_exists(Obj_RoomEntrance) {
					var entrance = instance_nearest(x, y, Obj_RoomEntrance)
					if(x == entrance.x && y == entrance.y) {
						EnterRoom(entrance.connecting)
					}
					//ReplaceArray(array)
				}
			}
		}
	}
}
function EnterRoom(entrance) {
	var goto = instance_create_depth(0, 0, 0, entrance)
	SetPlayerState(goto.playerPosition)
	room_goto(goto.roomIn)
}

function TileCollision(xDir, yDir) {
	var xGoto = x+xDir*tile; var yGoto = y+yDir*tile
	var lay_id = layer_get_id("Tiles");
	var map_id = layer_tilemap_get_id(lay_id);
	var px = tilemap_get_cell_x_at_pixel(map_id, xGoto, yGoto);
	var py = tilemap_get_cell_y_at_pixel(map_id, xGoto, yGoto);
	var data = tilemap_get(map_id, px, py);
	if data >= 2 {return true}
	
	if instance_position(xGoto+tile/2, yGoto+tile/2, Obj_Interactable) != noone {return true}
	
	return false
}

function InteractWithOverworld() {
	if (canMove && input_check_pressed("action")) {
		var facingAngle = degtorad(facing*90)
		show_debug_message(facingAngle)
		var facingDir = [cos(facingAngle), -sin(facingAngle)]
		show_debug_message(facingDir)
		var xPos = x+facingDir[0]*tile+(tile/2); var yPos = y+facingDir[1]*tile+(tile/2)
		drawXFace = xPos; drawYFace = yPos
		
		var interactable = instance_position(xPos, yPos, Obj_Interactable)
		
		if interactable != noone {
			var layeredDialogue = array_create(array_length(interactable.dialogue), "")
			for(var i = 0; i < array_length(layeredDialogue); i++)
				LayerText(display_get_gui_width()-15, interactable.dialogue[i])
			BeginDialogue(interactable.dialogue)
			
			//switch(interactable.object_index){
			//	case Obj_NPC: 
			//		interactable.facing = facing+2
			//		if interactable.facing >= 4 {interactable.facing -= 4}
			//		break
			//	case Obj_Pickup:
			//		PickupItem(interactable)
			//		break
			//}
			if object_is_ancestor(interactable.object_index, Obj_NPC){ 
				interactable.facing = facing+2
				if interactable.facing >= 4 {interactable.facing -= 4}
			} else if object_is_ancestor(interactable.object_index, Obj_Pickup){ 
				PickupItem(interactable)
			}
			//if interactable == Obj_NPC { 
			//	interactable.facing = facing
			//} else if interactable == Obj_Pickup {
			//	show_message("Yes this is happening")
			//	PickupItem(interactable)
			//}
		}
	}
}

function SetPlayerState(position = [Obj_Player.x, Obj_Player.y, Obj_Player.facing]) {
	Obj_Control.playerStateSave = [position[0], position[1], position[2]]
}