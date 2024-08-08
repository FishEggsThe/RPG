var acceptInput = input_check_pressed("accept")
var cancelInput = input_check_pressed("cancel")
	
var horiInput = input_check_pressed("right") - input_check_pressed("left")
var vertInput = input_check_pressed("down") - input_check_pressed("up")

var pm = Obj_PlayerManager

if room == Rm_Battle {
	switch(menuSpot) {
		case 0: // Start
			if horiInput != 0 {menuIndex += horiInput}
			var options = array_length(battleOptions)
			if menuIndex >= options {menuIndex-=options}
			else if menuIndex < 0 {menuIndex+=options}
			
			if acceptInput {
				switch(menuIndex) {
					case 0:
						break
					case 1:
						menuSpot = 1
						Obj_PlayerManager.selectedCharacter = pm.characters[characterIndex]
						Obj_PlayerManager.inventoryUp = true
						Obj_PlayerManager.inventoryIndex = 0
						Obj_PlayerManager.inventorySpot = 6
						break
					case 2:
						menuSpot = 1
						break
					case 3:
						break
				}
			}
			if cancelInput {show_message("bruh")}
			break
		case 1: // Spell Menu
			//if acceptInput {show_message(pm.selectedCharacter.spellList[pm.inventoryIndex])}
			if cancelInput {menuSpot = 0; Obj_PlayerManager.inventoryUp = false}
			break
		case 2: // Item Menu
			//if acceptInput {show_message(pm.selectedCharacter.spellList[pm.inventoryIndex])}
			if cancelInput {menuSpot = 0; Obj_PlayerManager.inventoryUp = false}
			break
	}
}