function DrawItemsText(){
	// idk
}

function DrawChoiceText(){
	// i'll do it later maybe
}

function ReplaceArray(array){
	var replace = array_create(array_length(array), noone)
	for(var i = 0; i < array_length(replace); i++)
		replace[i] = array[i]
	return replace
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

function NumOfCharacters() {
	var num = 0
	for(var i = 0; i < array_length(Obj_PlayerManager.characters); i++) {
		if Obj_PlayerManager.characters[i] == noone {break}
		num++
	}
	return num
}

function DrawCharactersBoxes(chosen = -1){
	var numOfCharacters = 0; var pm = Obj_PlayerManager
	numOfCharacters = NumOfCharacters()
	
	for(var i = 0; i < numOfCharacters; i++) {
		var charBoxOffset = ((width*(i+1))/(numOfCharacters+1)) - (width/12)
		var yOffset = (i == chosen ? 30 : 0)
		
		// Character
		if room = Rm_Battle && i == chosen {
			draw_sprite(pm.characters[i].walkSprites[3], pm.image_index, 
						charBoxOffset+6+width/18, height*7/8-yOffset-52)
		}
		// Box
		draw_set_color(c_maroon)
		draw_rectangle(charBoxOffset+2, height*7/8-yOffset, charBoxOffset-2+width/6, height*2, false)
		// Name
		draw_set_color(c_black)
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		draw_text_transformed(charBoxOffset+height/12, height*7.2/8-yOffset, pm.characters[i].name, 2, 2, 0)
		// Health / Mana
		var drawHealth = "H: " + string(pm.characters[i].currHealth) + "/" + string(pm.characters[i].maxHealth)
		var drawMana = "M: " + string(pm.characters[i].currMana) + "/" + string(pm.characters[i].maxMana)
		draw_set_color(c_red)
		draw_text_transformed(charBoxOffset+height/12, height*7.5/8-yOffset, drawHealth, 2, 2, 0)
		draw_set_color(c_teal)
		draw_text_transformed(charBoxOffset+height/12, height*7.8/8-yOffset, drawMana, 2, 2, 0)
		// Status Effects
		if array_length(pm.characters[i].statuses) <= 0 {continue}
		for(var j = 0; j < array_length(pm.characters[i].statuses); j++)
			draw_text(charBoxOffset+height/12, height*7.5/8-yOffset, pm.characters[i].statuses[j])
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