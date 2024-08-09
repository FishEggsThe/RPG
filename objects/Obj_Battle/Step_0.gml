var acceptInput = input_check_pressed("accept")
var cancelInput = input_check_pressed("cancel")
	
var horiInput = input_check_pressed("right") - input_check_pressed("left")
var vertInput = input_check_pressed("down") - input_check_pressed("up")

var pm = Obj_PlayerManager

if room == Rm_Battle && !Obj_Dialogue.onDialogue {
	switch(menuSpot) {
		case 0: // Start
			if horiInput != 0 {menuIndex += horiInput}
			var options = array_length(battleOptions)
			if menuIndex >= options {menuIndex-=options}
			else if menuIndex < 0 {menuIndex+=options}
			
			if acceptInput {
				lastMenuIndex = menuIndex
				switch(menuIndex) {
					case 0:
						menuIndex = 0; menuSpot = 3 //NextCharacter()
						break
					case 1:
						menuSpot = 1
						pm.selectedCharacter = pm.characters[characterIndex]
						pm.inventoryUp = true
						pm.inventoryIndex = characterIndex
						pm.inventorySpot = 5 // Don't worry it works out
						break
					case 2:
						menuSpot = 2
						pm.inventoryUp = true
						pm.inventoryIndex = 0
						pm.inventorySpot = 0
						break
					case 3:
						NextCharacter()
						break
				}
			}
			if cancelInput {
				if characterIndex <= 0 {show_message("bruh")}
				else {
					characterIndex--
					if inventorySave[characterIndex][0] != noone
						pm.inventory = inventorySave[characterIndex][0]
				}
			}
			break
		case 1: // Spell Menu
			if acceptInput {
				if array_length(pm.selectedCharacter.spellList) > 0 {
					show_message(pm.selectedCharacter.spellList[pm.inventoryIndex])
					pm.inventoryUp = false
					menuIndex = 0; menuSpot = 3 //NextCharacter()
				}
			}
			if cancelInput {menuSpot = 0; menuIndex = lastMenuIndex
							Obj_PlayerManager.inventoryUp = false}
			break
		case 2: // Item Menu
			//if acceptInput {show_message(pm.selectedCharacter.spellList[pm.inventoryIndex])}
			if cancelInput {menuSpot = 0; menuIndex = lastMenuIndex
							Obj_PlayerManager.inventoryUp = false}
			break
		case 3: // Enemy Select
			if horiInput != 0 {menuIndex += horiInput}
			var enemies = array_length(enemyList)
			if menuIndex >= enemies {menuIndex-=enemies}
			else if menuIndex < 0 {menuIndex+=enemies}
			
			if acceptInput {
				//show_message(enemyList[menuIndex])
				menuIndex = 0
				NextCharacter()
			}
			if cancelInput {menuSpot = 0; menuIndex = lastMenuIndex
							Obj_PlayerManager.inventoryUp = false}
			break
	}
}