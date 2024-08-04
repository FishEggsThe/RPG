function RemoveFromRoomState(rsID, rm = room) {
	var reduceIDs = false; var index = -1
	var entityList = global.roomStates[? rm]
	for(var i = 0; i < array_length(entityList); i++) {
		//show_message(pickup.roomStateID)
		//show_message(entityList[j][0])
		if rsID == entityList[i][0] {
			index = i
			reduceIDs = true
		}
		if reduceIDs {global.roomStates[? rm][i][0]--}
	}
	if index == -1 {
		PrintErrorDebug("There's nothing to remove from global.roomStates ya dinky shminky")
		return
	}
	array_delete(global.roomStates[? rm], index, 1)
}

function PrintErrorDebug(error) {
	var errorMessage = ""
	errorMessage += "***************************************************************************************************************************"
	errorMessage += "\n\nWhuh oh!!!\n" + error + "\n\n"
	errorMessage += "***************************************************************************************************************************"
	show_debug_message(errorMessage)
}