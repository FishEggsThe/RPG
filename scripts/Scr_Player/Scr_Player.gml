#macro tileSize 64

function MovePlayer(){
	if canMove {
		if !moving {
			var xDirection = input_check("right")-input_check("left")
			var yDirection = input_check("down")-input_check("up")
		
			if (xDirection != 0 || yDirection != 0) {
				xGoto = x+xDirection*tileSize; yGoto = y+yDirection*tileSize
				xMove = xDirection; yMove = yDirection
				moving = true
			}
		
		} else if moving {
			var moveSpeed = tileSize/(tileSize/4)
			
			x += moveSpeed*xMove
			y += moveSpeed*yMove
			
			if ((xMove != 0 && x == xGoto) || (yMove != 0 && y == yGoto)) {
				moving = false
				x = round(x); y = round(y)
			}

		}

		
		//TileCollision(xDirection, yDirection)
	}
}