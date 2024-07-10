function DrawItemsText(){
	// idk
}

function DrawChoiceText(){
	// i'll do it later maybe
}

function MoveDownList(){
	with Obj_PlayerManager {
		var tempInv = array_create(array_length(inventory), noone)
		var tempI = 0
		for(var i = 0; i < array_length(inventory); i++) {
			if inventory[i] != noone {
				tempInv[tempI] = inventory[i]
				tempI++
			}
		}
		//show_message(string(inventory) + "\n\n" + string(tempInv))
		//for(var i = 0; i < array_length(inventory); i++)
		//	inventory[i] = tempInv[i]
		inventory = tempInv
	}
}

function LayerText(layerWidth, desc){
	var layeredDesc = desc
	if string_length(desc) > layerWidth {
		layeredDesc = ""; var stringPos = 1
		var splitDesc = string_split(desc, " ")
		
		for(var i = 0; i < array_length(splitDesc); i++) {
			//show_message(string_copy(layeredDesc, stringPos, 33))
			if string_length(string_copy(layeredDesc, stringPos, layerWidth)+splitDesc[i]) > layerWidth {
				layeredDesc += "\n"
				stringPos += layerWidth+2
			}
			layeredDesc += (splitDesc[i]+" ")
		}
	}
	return string_trim(layeredDesc)
}