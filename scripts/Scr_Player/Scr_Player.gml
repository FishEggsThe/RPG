function MovePlayer(){
	if (canMove && keyboard_check_pressed(vk_anykey)) {
		var xDirection = input_check_pressed("right")-input_check_pressed("left")
		var yDirection = input_check_pressed("down")-input_check_pressed("up")
		
		x += xDirection*64;	y += yDirection*64

		
		//TileCollision(xDirection, yDirection)
	}
}