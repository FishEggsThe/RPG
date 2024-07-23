#macro finalSpot 7

var playerCheck = false
if instance_exists(Obj_Player) {playerCheck = Obj_Player.moveTime <= 0}
var dialogueCheck = false
if instance_exists(Obj_Dialogue) {dialogueCheck = !Obj_Dialogue.onDialogue}
var battleCheck = !instance_exists(Obj_Battle)
//if instance_exists(Obj_Battle) {dialogueCheck = !Obj_Battle.onDialogue}

if (input_check_pressed("inventory") && playerCheck && dialogueCheck && battleCheck) {
	inventoryUp = !inventoryUp
	Obj_Player.canMove = !inventoryUp
	inventorySpot = 0; inventoryIndex = 0; selectedItem = false
}

if inventoryUp {
	width = display_get_gui_width(); height = display_get_gui_height()
	boxX1 = width/8; boxY1 = height/6; boxX2 = width*7/8; boxY2 = height*5/6;
	boxWidth = boxX2-boxX1; boxHeight = boxY2-boxY1
	
	var acceptInput = input_check_pressed("accept")
	var cancelInput = input_check_pressed("cancel")
	
	var horiInput = input_check_pressed("right") - input_check_pressed("left")
	var vertInput = input_check_pressed("down") - input_check_pressed("up")
	
	switch(inventorySpot) {
		case 0: // Start
			if vertInput != 0 {inventoryIndex += vertInput}
			
			if inventoryIndex >= array_length(menuOptions) {inventoryIndex-=array_length(menuOptions)}
			else if inventoryIndex < 0 {inventoryIndex+=array_length(menuOptions)}
			
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
				inventorySpot = 4; inventoryIndex = 1}
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
				inventorySpot = 4; inventoryIndex = 1}
			if cancelInput {inventorySpot = 0; inventoryIndex = 1}
			break
			
		case 3: // Characters
			if horiInput != 0 {inventoryIndex += horiInput}
			
			if inventoryIndex >= array_length(characters) {inventoryIndex-=array_length(characters)}
			else if inventoryIndex < 0 {inventoryIndex+=array_length(characters)}
			
			if acceptInput {selectedCharacter = characters[inventoryIndex]; inventorySpot = 5}
			
			if cancelInput {inventorySpot = 0; inventoryIndex = 2}
			break
			
		case 4: // Selected Item
			if horiInput != 0 {inventoryIndex = (inventoryIndex == 1 ? 0 : 1)}
			
			if acceptInput {
				if (inventoryIndex == 1 || lastSpot = 2 ||selectedItem == noone)
				{inventorySpot = lastSpot; inventoryIndex = lastIndex}
				else if inventoryIndex == 0 {inventorySpot = finalSpot; inventoryIndex = 0} // Do thingshow_message("Imagine actually doing the thing\n\ncouldn't be me")
			}
			
			if cancelInput {inventorySpot = lastSpot; inventoryIndex = lastIndex}
			break
			
		case 5: // Character Selected
			if acceptInput {inventorySpot = 6; inventoryIndex = 0}
			if cancelInput {inventorySpot = 3; inventoryIndex = 0}
			break
			
		case 6: // Character Spells
			if vertInput != 0 {inventoryIndex = (inventoryIndex == 1 ? 0 : 1)}
			
			if inventoryIndex >= array_length(selectedCharacter.spellList) 
			{inventoryIndex-=array_length(selectedCharacter.spellList)}
			else if inventoryIndex < 0 
			{inventoryIndex+=array_length(selectedCharacter.spellList)}
			
			if cancelInput {inventorySpot = 5; inventoryIndex = 0}
			break
		
		case 7: // Use Selected Item
			if horiInput != 0 {inventoryIndex += horiInput}
			
			if inventoryIndex >= array_length(characters) {inventoryIndex-=array_length(characters)}
			else if inventoryIndex < 0 {inventoryIndex+=array_length(characters)}
			
			if acceptInput {
				if characters[inventoryIndex] != noone {
					UseItem(selectedItem, characters[inventoryIndex])
				}
			}
			
			if cancelInput {inventorySpot = lastSpot; inventoryIndex = lastIndex}
			break
	}
}