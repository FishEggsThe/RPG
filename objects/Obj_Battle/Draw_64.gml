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
	
	DrawCharactersBoxes()
	
	draw_set_color(c_white)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	for(var i = 0; i < array_length(battleOptions); i++) {
		var offset = boxX1+((i+2)*boxWidth/5)
		draw_text_transformed(offset, boxY1 + boxHeight/2, battleOptions[i], textSize, textSize, 0)
		if menuIndex == i {
			var lineWidthHalf = textSize*string_width(battleOptions[i])/2
			var lineFloor = (boxY1+boxHeight/2+(textSize*string_height(battleOptions[i]))/2)
			draw_line(offset-lineWidthHalf, lineFloor, offset+lineWidthHalf, lineFloor)
		}
	}
}