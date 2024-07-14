if !ds_map_exists(roomStates, room) {
	var numOfEntities = instance_number(Obj_Interactable)
	var listOfEntities = array_create(numOfEntities, noone)
	
	for(var i = 0; i < numOfEntities; i++) {
		var entity = instance_find(Obj_Interactable, i)
		var entityData = [entity.object_index, entity.x, entity.y, entity.dialogue, noone]
		switch(entityData[0]) {
			case Obj_Pickup: 
				entityData[4] = entity.item; break
			//case Obj_Enemy: 
			//	entityData[4] = entity.item; break
		}
		
		
		listOfEntities[i] = entityData
	}
		
	ds_map_add(roomStates, room, listOfEntities)
} else {
	with Obj_Interactable {instance_destroy()}
	
	var entityList = roomStates[? room]
	for(var i = 0; i < ds_map_size(roomStates); i++) {
		var entity = entityList[i]
		instance_create_layer(entity[1], entity[2], "Instances", entity[0])
	}
}

//show_message(roomStates[? Room1][0].x)

var tempKey = []; var tempVal = []; var dsmap = []
tempKey = ds_map_keys_to_array(roomStates)
tempVal = ds_map_values_to_array(roomStates)

for(var i = 0; i < array_length(tempKey); i++)
	show_debug_message(string(tempKey[i]) + ": " + string(tempVal[i]))