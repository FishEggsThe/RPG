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
}