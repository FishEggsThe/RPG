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
				menuSpot = menuIndex+1; menuIndex = 0
				if menuIndex == 1 {
					Obj_PlayerManager.selectedCharacter = pm.characters[characterIndex]
					Obj_PlayerManager.inventoryUp = true
					Obj_PlayerManager.inventoryIndex = 0
					Obj_PlayerManager.inventorySpot = 6
				}
			}
			if cancelInput {show_message("bruh")}
			break
		case 1: // Spell Menu
			if acceptInput {show_message(pm.selectedCharacter.spellList[pm.inventoryIndex])}
			if cancelInput {menuSpot = 0}
	}
}