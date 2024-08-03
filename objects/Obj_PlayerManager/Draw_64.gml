if inventoryUp {
	draw_set_color(c_maroon)
	//show_message(boxY2)
	draw_rectangle(boxX1, boxY1, boxX2, boxY2, false)
	
	var acceptInput = input_check_pressed("accept")
	var cancelInput = input_check_pressed("cancel")
	
	var horiInput = input_check_pressed("right") - input_check_pressed("left")
	var vertInput = input_check_pressed("down") - input_check_pressed("up")
	var textSize = 3
	
	draw_set_color(c_white)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	if global.debug {
		draw_text(20+width/8, 20+height/6, string(inventorySpot) + " " + string(inventoryIndex))
		//if acceptInput {show_message(acceptInput)}
		
		//draw_text(boxX1, boxY1, "+"); draw_text(boxX2, boxY1, "+")
		//draw_text(boxX1, boxY2, "+"); draw_text(boxX2, boxY2, "+")
		
		draw_set_halign(fa_left)
		for(var i = 0; i <= boxWidth; i+=boxWidth/8)
			draw_text(boxX1+i-5, height*2/3, "|")
		
	}
	
	// Character boxes on bottom
	var numOfCharacters = 0
	for(var i = 0; i < array_length(characters); i++) {
		if characters[i] == noone {break}
		numOfCharacters++
	}
	
	for(var i = 0; i < numOfCharacters; i++) {
		var charBoxOffset = (width/6) + width*(i)/6
		//var charBoxOffset = (width/(2*numOfCharacters)) + (width*i)/(numOfCharacters) - width/12
		//var charBoxOffset = (width/2) + ((width*i)/(numOfCharacters*2)) - (width/12)

		// Box
		draw_set_color(c_maroon)
		draw_rectangle(charBoxOffset+2, height*7/8, charBoxOffset-2+width/6, height*2, false)
		// Name
		draw_set_color(c_black)
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		draw_text_transformed(charBoxOffset+height/12, height*7.2/8, characters[i].name, 2, 2, 0)
		// Health / Mana
		var drawHealth = "H: " + string(characters[i].currHealth) + "/" + string(characters[i].maxHealth)
		var drawMana = "M: " + string(characters[i].currMana) + "/" + string(characters[i].maxMana)
		draw_set_color(c_red)
		draw_text_transformed(charBoxOffset+height/12, height*7.5/8, drawHealth, 2, 2, 0)
		draw_set_color(c_teal)
		draw_text_transformed(charBoxOffset+height/12, height*7.8/8, drawMana, 2, 2, 0)
	}
	
	draw_set_color(c_black)
	switch(inventorySpot) {
		case 0:
			for(var i = 0; i < array_length(menuOptions); i++) {
				var offset = boxX1+((i+1)*boxHeight*2/7)
				draw_text_transformed(width/2, offset, menuOptions[i], textSize, textSize, 0)
				if inventoryIndex == i {
					var lineWidthHalf = textSize*string_width(menuOptions[i])/2
					var lineFloor = (offset+(textSize*string_height(menuOptions[i]))/2)
					draw_line((width/2)-lineWidthHalf, lineFloor, (width/2)+lineWidthHalf, lineFloor)
				}
			}
			break
			
		case 1:
			for(var i = 0; i < array_length(inventory); i++) {
				var xPos = boxX1+(boxWidth/4)+(floor(i/4))*(boxWidth*1/2)
				var yPos = boxY1+((i%4)+1)*(boxHeight/5)
				
				var invName = (inventory[i] == noone ? "-" : inventory[i].name)
				draw_text_transformed(xPos, yPos, invName, textSize, textSize, 0)
				if inventoryIndex == i {
					var lineWidthHalf = textSize*string_width(invName)/2
					var lineFloor = (yPos+(textSize*string_height(invName))/2)
					draw_line(xPos-lineWidthHalf, lineFloor, xPos+lineWidthHalf, lineFloor)
				}
			}
			break
			
		case 2:
			for(var i = 0; i < array_length(keyItems); i++) {
				var xPos = boxX1+(boxWidth/4)+(floor(i/4))*(boxWidth*1/2)
				var yPos = boxY1+((i%4)+1)*(boxHeight/5)
				
				var invName = (keyItems[i] == noone ? "-" : keyItems[i].name)
				draw_text_transformed(xPos, yPos, invName, textSize, textSize, 0)
				if inventoryIndex == i {
					var lineWidthHalf = textSize*string_width(invName)/2
					var lineFloor = (yPos+(textSize*string_height(invName))/2)
					draw_line(xPos-lineWidthHalf, lineFloor, xPos+lineWidthHalf, lineFloor)
				}
			}
			break
		
		case 3:
			DrawCharactersLineup(textSize)
			break
		
		case 4:
			if selectedItem == noone {
				var array = (lastSpot == 1 ? inventory : keyItems)
				var arraySize = array_length(array); var emptySlots = 0
				for(var i = 0; i < arraySize; i++) {if array[i] == noone {emptySlots++}}
				var textScale = ((arraySize+1-emptySlots)/arraySize)*textSize
				draw_text_transformed(width/2, height/2, emptyPockets[emptySlots], textScale, textScale, 0)
			}
			else {
				draw_text_transformed(width/2, boxY1+boxHeight/8, selectedItem.name, textSize, textSize, 0)
				draw_sprite(selectedItem.itemImage, 0, width/2, boxY1+boxHeight*3/8)
				draw_text_transformed(width/2, boxY1+boxHeight*5/8, selectedItem.description, textSize, textSize, 0)
				
				if selectedItem.itemType != 0 {
					for(var i = 0; i < array_length(useOptions); i++) {
						var offset = boxX1+(i+1)*(boxWidth*1/3)
						draw_text_transformed(offset, boxY1+boxHeight*7/8, useOptions[i], textSize, textSize, 0)
						if inventoryIndex == i {
							var lineWidthHalf = textSize*string_width(useOptions[i])/2
							var lineFloor = ((boxY1+boxHeight*7/8)+(textSize*string_height(useOptions[i]))/2)
							draw_line(offset-lineWidthHalf, lineFloor, offset+lineWidthHalf, lineFloor)
						}
					}
				}
			}
			break
			
		case 5:
			if selectedCharacter == noone {
				draw_text_transformed(width/2, height/2, "Its a ghost!\n\noOOooOOoOoOOO", textSize, textSize, 0)
			}
			else {
				draw_text_transformed(width/2, boxY1+boxHeight*5/8, selectedCharacter.description, textSize, textSize, 0)
				
				draw_set_halign(fa_left)
				draw_set_valign(fa_top)
				draw_text_transformed(boxX1 + 10, boxY1+10, selectedCharacter.name, textSize, textSize, 0)
				draw_sprite(selectedCharacter.portraitSprites, 0, boxX1 + 10, boxY1+20*textSize)
				
				draw_set_halign(fa_right)
				draw_text_transformed(boxX2-10, boxY1+10, selectedCharacter.name, textSize, textSize, 0)
				var charWep = (selectedCharacter.weapon != noone ? selectedCharacter.weapon.name : "-")
				draw_text_transformed(boxX2-10, boxY1+80, charWep, textSize, textSize, 0)
				var charArmor = (selectedCharacter.armor != noone ? selectedCharacter.armor.name : "-")
				draw_text_transformed(boxX2-10, boxY1+150, charArmor, textSize, textSize, 0)
				//draw_sprite(selectedCharacter.portraitSprites, 0, boxX2-10, boxY1-20*textSize)
				
				draw_set_valign(fa_bottom)
				var spellsText = "Spells"
				draw_text_transformed(boxX2-10, boxY2-10, spellsText, textSize, textSize, 0)
				var lineWidth = textSize*string_width(spellsText)
				//var lineFloor = boxY2//((boxY2)+(textSize*string_height(spellsText)))
				//draw_line(boxX2-10, boxY2, boxX2-10-lineWidth, boxY2)
			}
			break
			
		case 6:
			if array_length(selectedCharacter.spellList) <= 0 {
				draw_text_transformed(width/2, height/2, "Nothing yet", textSize, textSize, 0)
			}
			else {
				var selectedSpell = selectedCharacter.spellList[inventoryIndex]
				draw_set_halign(fa_left)
				draw_set_valign(fa_top)
				for(var i = 0; i < array_length(selectedCharacter.spellList); i++) {
					var xPos = boxX1 + 10; var yPos = (i*70)+(boxY1+10)
					draw_text_transformed(boxX1 + 10, yPos, selectedCharacter.spellList[i].name, textSize, textSize, 0)
					if i == inventoryIndex {
						var lineWidth = textSize*string_width(selectedSpell.name)
						var lineFloor = (yPos+(textSize*string_height(selectedSpell.name)))
						draw_line(xPos, lineFloor, xPos+lineWidth, lineFloor)
					}
				}
				
				draw_set_halign(fa_center)
				draw_set_valign(fa_middle)
				draw_text_transformed(boxX1+(boxX2-boxX1)*3/4, boxY1+(boxY2-boxY1)/4, selectedSpell.name, textSize, textSize, 0)
				draw_text_transformed(boxX1+(boxX2-boxX1)*3/4, boxY1+(boxY2-boxY1)/2, selectedSpell.description, textSize, textSize, 0)
			}
			break
			
		case 7:
			DrawCharactersLineup(textSize)
			break
	}
}