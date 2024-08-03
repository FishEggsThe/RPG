function BeginDialogue(dialogueList, enemy = noone){
	with Obj_Dialogue {
		startAcceptBuffer = 1
		dialogue = dialogueList
		dialogueIndex = 0
		letterIndex = 0
		onDialogue = true
		enemyCheck = enemy
	}
	Obj_PlayerManager.inventoryUp = false
}