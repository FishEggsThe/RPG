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
			
			var numOfMenuOptions = array_length(menuOptions)
			if inventoryIndex >= numOfMenuOptions {inventoryIndex-=numOfMenuOptions}
			else if inventoryIndex < 0 {inventoryIndex+=numOfMenuOptions}
			
			if acceptInput {inventorySpot = inventoryIndex+1; inventoryIndex = 0}
			if cancelInput {inventoryUp = false; Obj_Player.canMove = true}
			break
			
		case 1: // Inventory
			if horiInput != 0 {inventoryIndex += 4*horiInput}
			if vertInput != 0 {inventoryIndex += vertInput}
			
			if inventoryIndex >= inventoryLength {inventoryIndex-=inventoryLength}
			else if inventoryIndex < 0 {inventoryIndex+=inventoryLength}
			
			if acceptInput {
				selectedItem = inventory[inventoryIndex]
				lastSpot = 1; lastIndex = inventoryIndex
				inventorySpot = 4; inventoryIndex = 1}
			if cancelInput {inventorySpot = 0; inventoryIndex = 0}
			break
			
		case 2: // Key Items
			if horiInput != 0 {inventoryIndex += 4*horiInput}
			if vertInput != 0 {inventoryIndex += vertInput}
			
			var numOfKeyItems = array_length(keyItems)
			if inventoryIndex >= numOfKeyItems {inventoryIndex-=numOfKeyItems}
			else if inventoryIndex < 0 {inventoryIndex+=numOfKeyItems}
			
			if acceptInput {
				selectedItem = keyItems[inventoryIndex]
				lastSpot = 2; lastIndex = inventoryIndex
				inventorySpot = 4; inventoryIndex = 1}
			if cancelInput {inventorySpot = 0; inventoryIndex = 1}
			break
			
		case 3: // Characters
			if horiInput != 0 {inventoryIndex += horiInput}
			
			var numOfCharactersSlots = array_length(characters)
			if inventoryIndex >= numOfCharactersSlots {inventoryIndex-=numOfCharactersSlots}
			else if inventoryIndex < 0 {inventoryIndex+=numOfCharactersSlots}
			
			if acceptInput {selectedCharacter = characters[inventoryIndex]; inventorySpot = 5}
			
			if cancelInput {inventorySpot = 0; inventoryIndex = 2}
			break
			
		case 4: // Selected Item
			if horiInput != 0 {inventoryIndex = (inventoryIndex == 1 ? 0 : 1)}
			
			if acceptInput {
				if (inventoryIndex == 1 || lastSpot = 2 || selectedItem == noone)
				{inventorySpot = lastSpot; inventoryIndex = lastIndex}
				else if inventoryIndex == 0 {inventorySpot = finalSpot; inventoryIndex = 0}
			}
			
			if cancelInput {inventorySpot = lastSpot; inventoryIndex = lastIndex}
			break
			
		case 5: // Character Selected
			if (acceptInput && selectedCharacter != noone) {inventorySpot = 6; inventoryIndex = 0}
			if cancelInput {inventorySpot = 3; inventoryIndex = 0}
			break
			
		case 6: // Character Spells
			if vertInput != 0 {inventoryIndex = (inventoryIndex == 1 ? 0 : 1)}
			
			var numOfSpells = array_length(selectedCharacter.spellList)
			if inventoryIndex >= numOfSpells {inventoryIndex-=numOfSpells}
			else if inventoryIndex < 0 {inventoryIndex+=numOfSpells}
			
			if cancelInput {inventorySpot = 5; inventoryIndex = 0}
			break
		
		case 7: // Use Selected Item
			if horiInput != 0 {inventoryIndex += horiInput}
			
			numOfCharactersSlots = array_length(characters)
			if inventoryIndex >= numOfCharactersSlots {inventoryIndex-=numOfCharactersSlots}
			else if inventoryIndex < 0 {inventoryIndex+=numOfCharactersSlots}
			
			if acceptInput {
				if characters[inventoryIndex] != noone {
					//if room == Rm_Battle {Obj_Battle.inventorySave[characterIndex][0] = inventory}
					//else {UseItem(selectedItem, characters[inventoryIndex])}
					InventoryFigureItem(selectedItem, characters[inventoryIndex])
				}
			}
			
			if cancelInput {inventorySpot = lastSpot; inventoryIndex = lastIndex}
			break
	}
}