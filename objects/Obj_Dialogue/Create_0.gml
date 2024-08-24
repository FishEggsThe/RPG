if instance_number(Obj_Dialogue) > 1 {instance_destroy()}
else {
	dialogue = ["Who are you"]
	onDialogue = false
	dialogueIndex = 0

	enemyCheck = noone
	holdDialogue = 0

	letterIndex = 0
	startAcceptBuffer = 1
}