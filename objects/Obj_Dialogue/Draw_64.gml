if onDialogue {
	var width = display_get_gui_width()
	var height = display_get_gui_height()
	var acceptInput = input_check_pressed(["action", "accept"]) - startAcceptBuffer
	if startAcceptBuffer > 0 {startAcceptBuffer--}
	
	var dialogueLength = array_length(dialogue)
	Obj_Player.canMove = false
	
	draw_set_color(c_black)
	draw_rectangle(5, height*2/3, width-5, height-5, false)
	
	draw_set_color(c_white)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	
	if letterIndex <= string_length(dialogue[dialogueIndex]) {letterIndex++}
	var lineToDraw = string_copy(dialogue[dialogueIndex], 1, letterIndex)
	
	draw_text_transformed(10, (height*2/3)+10, lineToDraw, 2, 2, 0)
	
	if acceptInput {
		dialogueIndex++
		letterIndex = 0
	}
	
	if dialogueIndex >= dialogueLength {
		onDialogue = false
		if enemyCheck != noone
			StartBattle(enemyCheck, enemyCheck.enemyInfo)
		else
			Obj_Player.canMove = true
	}
}