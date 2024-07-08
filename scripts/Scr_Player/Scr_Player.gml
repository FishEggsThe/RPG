#macro tile (global.tileSize)

function PlayerStats(_port, _walk, _wep, _spells, _health, _attack, _speed, _def, _mana, _magic, _name, _desc) constructor {
	name = _name
	description = LayerDescription(_desc)
	portraitSprites = _port
	walkSprites = _walk
	weaponChoice = _wep
	spellList = _spells
	
	baseHealth = _health
	maxHealth = baseHealth
	baseAttack = _attack
	baseSpeed = _speed
	baseDefense = _def
	baseMana = _mana
	maxMana = baseMana
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
					{yMove = yDirection; xMove = 0; facing = 2 + yDirection; break}
				}
				
				if TileCollision(xMove, yMove) {xMove = 0; yMove = 0; return}
				moveTime = moveTimeSet
			}
		
		} if moveTime > 0 {
			var moveSpeed = tile/moveTimeSet
			
			x += moveSpeed*xMove
			y += moveSpeed*yMove
			moveTime--
			
			if moveTime <= 0 {
				x = round(x); y = round(y)
			}

		}
	}
}

function TileCollision(xDir, yDir) {
	var xGoto = x+xDir*tile; var yGoto = y+yDir*tile
	var lay_id = layer_get_id("Tiles");
	var map_id = layer_tilemap_get_id(lay_id);
	var px = tilemap_get_cell_x_at_pixel(map_id, xGoto, yGoto);
	var py = tilemap_get_cell_y_at_pixel(map_id, xGoto, yGoto);
	var data = tilemap_get(map_id, px, py);
	
	if data >= 2 {return true}
	return false
}