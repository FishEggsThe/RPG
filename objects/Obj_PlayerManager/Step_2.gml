if input_check_pressed("inventory") {
	inventoryUp = !inventoryUp
	Obj_Player.canMove = !inventoryUp
	inventorySpot = 0; inventoryIndex = 0; selectedItem = false
}

if inventoryUp {
	var acceptInput = input_check_pressed("accept")
	var cancelInput = input_check_pressed("cancel")
	
	var horiInput = input_check_pressed("right") - input_check_pressed("left")
	var vertInput = input_check_pressed("down") - input_check_pressed("up")
	
	switch(inventorySpot) {
		case 0:
			if horiInput != 0 {inventoryIndex = (inventoryIndex == 1 ? 0 : 1)}
			if acceptInput {inventorySpot = inventoryIndex+1}
			break
			
		case 1:
			if horiInput != 0 {
				inventoryIndex += 4*horiInput
			}
			if vertInput != 0 {
				inventoryIndex += vertInput
			}
			
			if inventoryIndex >= array_length(inventory) {inventoryIndex-=array_length(inventory)}
			if inventoryIndex < 0 {inventoryIndex+=array_length(inventory)}
			if cancelInput {inventorySpot = 0}
			break
			
		case 2:
			if cancelInput {inventorySpot = 0}
			break
	}
}