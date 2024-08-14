//if instance_number(Obj_PlayerManager) <= 0
//{instance_create_layer(0, 0, "Instances", Obj_PlayerManager)}
//show_message("Player")

leaderSprites = Obj_PlayerManager.characters[0].walkSprites

xMove = 0; yMove = 0
moveTime = 0
moveTimeSet = 20

drawXFace = 0; drawYFace = 0

canMove = true
facing = 3

partySize = NumOfCharacters()-1
partySprites = array_create(partySize, [])
partyGoto = array_create(partySize, [])
partyPos = array_create(partySize, [])
for(var i = 0; i < partySize; i++) {
	partySprites[i] = Obj_PlayerManager.characters[i+1].walkSprites
	partyGoto[i] = [x, y, facing]
	partyPos[i] = [x, y, facing]
}


if Obj_Control.playerStateSave != noone {
	var c = Obj_Control
	x = c.playerStateSave[0]
	y = c.playerStateSave[1]
	facing = c.playerStateSave[2]
	
	for(var i = 0; i < partySize; i++) {
		partyGoto[i][0] = c.partyStateSave[i][0] + x
		partyGoto[i][1] = c.partyStateSave[i][1] + y
		partyGoto[i][2] = c.partyStateSave[i][2]
		for(var j = 0; j < 3; j++) {
			partyPos[i][j] = partyGoto[i][j]
		}
	}
	show_debug_message(c.playerStateSave)
	show_debug_message(c.partyStateSave)
	
	c.playerStateSave = noone
}