function BeginDialogue(dialogueList){
	with Obj_Dialogue {
		dialogue = dialogueList
		dialogueIndex = 0
		letterIndex = 0
		onDialogue = true
	}
	Obj_PlayerManager.inventoryUp = false
}