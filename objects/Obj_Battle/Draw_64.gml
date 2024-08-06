if room == Rm_Battle {
	var pm = Obj_PlayerManager
	
	draw_set_color(c_maroon)
	//show_message(boxY2)
	draw_rectangle(boxX1, boxY1, boxX2, boxY2, false)
	
	var acceptInput = input_check_pressed("accept")
	var cancelInput = input_check_pressed("cancel")
	
	var horiInput = input_check_pressed("right") - input_check_pressed("left")
	var vertInput = input_check_pressed("down") - input_check_pressed("up")
	var textSize = 3
	
	//draw_set_color(c_white)
	//draw_set_halign(fa_center)
	//draw_set_valign(fa_middle)
	//if global.debug {
		
	//}
	
	// Character boxes on bottom
	var numOfCharacters = 0
	for(var i = 0; i < array_length(pm.characters); i++) {
		if pm.characters[i] == noone {break}
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
		draw_text_transformed(charBoxOffset+height/12, height*7.2/8, pm.characters[i].name, 2, 2, 0)
		// Health / Mana
		var drawHealth = "H: " + string(pm.characters[i].currHealth) + "/" + string(pm.characters[i].maxHealth)
		var drawMana = "M: " + string(pm.characters[i].currMana) + "/" + string(pm.characters[i].maxMana)
		draw_set_color(c_red)
		draw_text_transformed(charBoxOffset+height/12, height*7.5/8, drawHealth, 2, 2, 0)
		draw_set_color(c_teal)
		draw_text_transformed(charBoxOffset+height/12, height*7.8/8, drawMana, 2, 2, 0)
	}
}