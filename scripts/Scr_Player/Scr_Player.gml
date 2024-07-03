#macro tileSize 64

function MovePlayer(){
	if canMove {
		if moveTime <= 0 {
			var xDirection = input_check("right")-input_check("left")
			var yDirection = input_check("down")-input_check("up")
		
			if (xDirection != 0 || yDirection != 0) {
				xGoto = x+xDirection*tileSize; yGoto = y+yDirection*tileSize
				var last_input = input_check_press_most_recent(["right", "left", "up", "down"])
				
				if (last_input == "right" || last_input == "left")
				{xMove = xDirection; yMove = 0}
				
				else if (last_input == "up" || last_input == "down")
				{yMove = yDirection; xMove = 0}
				
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

		
		//TileCollision(xDirection, yDirection)
	}
}