function DrawItemsText(){
	// idk
}

function DrawChoiceText(){
	// i'll do it later maybe
}

function DrawCharactersLineup(textSize){
	for(var i = 0; i < array_length(characters); i++) {
		var xPos = boxX1+(boxWidth/8)+(i*boxWidth/4)
		var boxWidthQuarter = boxWidth/8
		var charName = (characters[i] != noone ? characters[i].name : "-")
		var charPort = (characters[i] != noone ? characters[i].walkSprites[3] : Spr_Nothing)

				
		draw_text_transformed(xPos, height*7/16, charName, textSize, textSize, 0)
		draw_sprite_ext(charPort, image_index, xPos-64, height/2-32, 2, 2, 0, c_white, 1)
		if inventoryIndex == i {
			draw_rectangle(xPos-boxWidthQuarter+2, boxY1+2, xPos+boxWidthQuarter-2, boxY2-2, true)
		}
	}
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