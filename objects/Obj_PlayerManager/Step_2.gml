var playerCheck = false
if instance_exists(Obj_Player) {playerCheck = Obj_Player.moveTime <= 0}

if (input_check_pressed("inventory") && playerCheck) {
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
		case 0: // Start
			if horiInput != 0 {inventoryIndex = (inventoryIndex == 1 ? 0 : 1)}
			if acceptInput {inventorySpot = inventoryIndex+1; inventoryIndex = 0}
			if cancelInput {inventoryUp = false; Obj_Player.canMove = true}
			break
			
		case 1: // Inventory
			if horiInput != 0 {inventoryIndex += 4*horiInput}
			if vertInput != 0 {inventoryIndex += vertInput}
			
			if inventoryIndex >= array_length(inventory) {inventoryIndex-=array_length(inventory)}
			else if inventoryIndex < 0 {inventoryIndex+=array_length(inventory)}
			
			if acceptInput {
				selectedItem = inventory[inventoryIndex]
				lastSpot = 1; lastIndex = inventoryIndex
				inventorySpot = 3; inventoryIndex = 1}
			if cancelInput {inventorySpot = 0; inventoryIndex = 0}
			break
			
		case 2: // Key Items
			if horiInput != 0 {inventoryIndex += 4*horiInput}
			if vertInput != 0 {inventoryIndex += vertInput}
			
			if inventoryIndex >= array_length(keyItems) {inventoryIndex-=array_length(keyItems)}
			else if inventoryIndex < 0 {inventoryIndex+=array_length(keyItems)}
			
			if acceptInput {
				selectedItem = keyItems[inventoryIndex]
				lastSpot = 2; lastIndex = inventoryIndex
				inventorySpot = 3; inventoryIndex = 1}
			if cancelInput {inventorySpot = 0; inventoryIndex = 1}
			break
			
		case 3: // Selected Item
			if horiInput != 0 {inventoryIndex = (inventoryIndex == 1 ? 0 : 1)}
			
			if acceptInput {
				if (inventoryIndex == 1 || selectedItem == noone) {inventorySpot = lastSpot; inventoryIndex = lastIndex}
				else if inventoryIndex == 0 {show_message("Imagine actually doing the thing\n\ncouldn't be me")} // Do thing
				
			}
			if cancelInput {inventorySpot = lastSpot; inventoryIndex = lastIndex}
			break
	}
}