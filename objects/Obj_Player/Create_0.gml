//if instance_number(Obj_PlayerManager) <= 0
//{instance_create_layer(0, 0, "Instances", Obj_PlayerManager)}
//show_message("Player")

leaderSprites = Obj_PlayerManager.characters[0].walkSprites

xMove = 0; yMove = 0
moveTime = 0
moveTimeSet = 20

drawXFace = 0; drawYFace = 0

canMove = true
facing = 0

partyPos = [[0,0], [0,0], [0,0]]
partyGoto = partyPos