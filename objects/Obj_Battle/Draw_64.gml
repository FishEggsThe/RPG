if room == Rm_Battle {
	var pm = Obj_PlayerManager
	
	draw_set_color(c_maroon)
	//show_message(boxY2)
	if menuSpot != 3
		draw_rectangle(boxX1, boxY1, boxX2, boxY2, false)
	var textSize = 3
	
	draw_set_color(c_white)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	if global.debug {
		var horiInput = input_check("right") - input_check("left")
		
		draw_text(5, 5, string(input_check("right")) + " - " + string(input_check("left")) + " = " + string(horiInput))
	}
	
	DrawCharactersBoxes(characterIndex)
	
	draw_set_color(c_white)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	switch(menuSpot) {
		case 0: // Start
			for(var i = 0; i < array_length(battleOptions); i++) {
				var offset = boxX1+((i+1)*(boxWidth/5))
				draw_text_transformed(offset, boxY1 + boxHeight/2, battleOptions[i], textSize, textSize, 0)
				if menuIndex == i {
					var lineWidthHalf = textSize*string_width(battleOptions[i])/2
					var lineFloor = (boxY1+boxHeight/2+(textSize*string_height(battleOptions[i]))/2)
					draw_line(offset-lineWidthHalf, lineFloor, offset+lineWidthHalf, lineFloor)
				}
			}
			break
		case 3:
			for(var i = 0; i < array_length(enemyList); i++) {
				var enemy = enemyList[i]; var scale = Obj_Camera.window_scale
				var drawHealth = string(enemy.currHealth) + "/" + string(enemy.maxHealth)
				var healthBar = string_length(drawHealth)*0.75*10
				var yOffset = 30; var yNewPos = enemy.yPos + 70
				
				draw_set_color(c_red)
				draw_rectangle(scale*(enemy.xPos-healthBar), scale*(yNewPos+yOffset), 
							   scale*(enemy.xPos+healthBar), scale*(yNewPos+yOffset*2), false)
				draw_set_color(c_black)
				draw_set_halign(fa_center)
				draw_set_valign(fa_middle)
				draw_text_transformed(scale*enemy.xPos, scale*(yNewPos+yOffset*1.5), drawHealth, 2, 2, 0)
				
				if i == menuIndex {
					var yPosTop = scale*(enemy.yPos-sprite_get_yoffset(enemy.battleSprite)-50)
					draw_set_color(c_green)
					//var yPosTop = scale*(enemy.yPos-sprite_get_yoffset(enemy.battleSprite)-50)
					draw_sprite(Spr_ArrowDown, 0, scale*enemy.xPos, yPosTop)
				}
			}
	}
}