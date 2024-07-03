#macro tileSize 64

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
					{xMove = xDirection; yMove = 0; break}
					if (!moveOrder[i] && !TileCollision(0, yDirection))
					{yMove = yDirection; xMove = 0; break}
				}
				//else {xMove = 0; yMove = 0}
				
				if TileCollision(xMove, yMove) {xMove = 0; yMove = 0; return}
				moveTime = moveTimeSet
			}
		
		} else if moveTime > 0 {
			var moveSpeed = tileSize/moveTimeSet
			
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
	var xGoto = x+xDir*tileSize; var yGoto = y+yDir*tileSize
	var lay_id = layer_get_id("Tiles");
	var map_id = layer_tilemap_get_id(lay_id);
	var px = tilemap_get_cell_x_at_pixel(map_id, xGoto, yGoto);
	var py = tilemap_get_cell_y_at_pixel(map_id, xGoto, yGoto);
	var data = tilemap_get(map_id, px, py);
	
	if data >= 2 {return true}
	return false
}