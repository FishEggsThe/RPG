if room == Rm_Battle {exit}

if !ds_map_exists(global.roomStates, room) {
	var numOfEntities = instance_number(Obj_Interactable)
	var listOfEntities = array_create(numOfEntities, noone)
	
	for(var i = 0; i < numOfEntities; i++) {
		var entity = instance_find(Obj_Interactable, i)
		entity.roomStateID = i
		var entityData = [i, entity.object_index, entity.x, entity.y, entity.dialogue, noone]
		switch(entityData[1]) {
			case Obj_Pickup: 
				entityData[5] = entity.item; break
			//case Obj_Enemy: 
			//	entityData[4] = entity.item; break
		}
		
		
		listOfEntities[i] = entityData
	}
		
	ds_map_add(global.roomStates, room, listOfEntities)
} else {
	with Obj_Interactable {instance_destroy()}
	
	var entityList = global.roomStates[? room]
	for(var i = 0; i < array_length(entityList); i++) {
		var entityData = entityList[i]
		with instance_create_layer(entityData[2], entityData[3], "Instances", entityData[1]) {
			roomStateID = entityData[0]
			if entityData[1] == Obj_Pickup
				item = entityData[5]
		}
	}
}

//show_message(global.roomStates[? Room1][0].x)

var tempKey = []; var tempVal = []; var dsmap = []
tempKey = ds_map_keys_to_array(global.roomStates)
tempVal = ds_map_values_to_array(global.roomStates)

for(var i = 0; i < array_length(tempKey); i++)
	show_debug_message(string(tempKey[i]) + ": " + string(tempVal[i]))