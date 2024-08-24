function BeginDialogue(dialogueList, delay = -1, enemy = noone){
	with Obj_Dialogue {
		startAcceptBuffer = 1
		if typeof(dialogueList) == "string" {dialogue = [dialogueList]}
		else {dialogue = dialogueList}
		
		dialogueIndex = 0
		letterIndex = 0
		onDialogue = true
		holdDialogue = delay
		enemyCheck = enemy
	}
	Obj_PlayerManager.inventoryUp = false
}