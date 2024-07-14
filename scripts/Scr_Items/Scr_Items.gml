function Item(_buy, _sell, _image, _name, _desc) constructor {
	// Key Item = 0;
	// Consumable = 1;
	// Weapon = 2;
	// Armor = 3;
	itemType = 0
	name = _name
	description = _desc
	buyPrice = _buy
	sellPrice = _sell
	itemImage = _image
	description = LayerText(30, _desc)
}

function Consumable(_heal, _cure, _buff, _buy, _sell, _image, _name, _desc) : Item(_buy, _sell, _image, _name, _desc) constructor {
	itemType = 1
	healing = _heal
	cureStatus = _cure // e.g. [true, false, false], I'll figure out status effects later
	buffStats = _buff // same as _cure but with numbers
}

function Weapon(_type, _attack, _crit, _buy, _sell, _image, _name, _desc) : Item(_buy, _sell, _image, _name, _desc) constructor {
	itemType = 2
	wepType = _type
	damage = _attack
	critChance = _crit
}

function Armor(_type, _def, _buy, _sell, _image, _name, _desc) : Item(_buy, _sell, _image, _name, _desc) constructor {
	itemType = 3
	armorType = _type
	protection = _def
	
}

function PickupItem(pickup) {
	with Obj_PlayerManager {
		if pickup.item.itemType == 0 {
			for(var i = 0; i < array_length(keyItems); i++){
				if keyItems[i] == noone {
					keyItems[i] = pickup.item
					
					var entityList = global.roomStates[? room]
					for(var j = 0; j < array_length(entityList); j++) {
						//show_message(pickup.roomStateID)
						//show_message(entityList[j][0])
						if pickup.roomStateID == entityList[j][0]
							array_delete(global.roomStates[? room], j, 1)
					}					
					
					instance_destroy(pickup)
					return
				}
			}
			show_message("You're holding too many key items!")
		} else {
			for(var i = 0; i < array_length(inventory); i++){
				if inventory[i] == noone {
					inventory[i] = pickup.item
					
					var entityList = global.roomStates[? room]
					for(var j = 0; j < array_length(entityList); j++) {
						//show_message(pickup.roomStateID)
						//show_message(entityList[j][0])
						if pickup.roomStateID == entityList[j][0]
							array_delete(global.roomStates[? room], j, 1)
					}
					
					instance_destroy(pickup)
					return
				}
			}
			show_message("Inventory full!")
		}
	}
}

function UseItem(item, character) {
	if item == noone {show_message("How the hell did you select nothing"); return;}
	
	switch(item.itemType) {
		case 1:
			character.currHealth = clamp(character.currHealth+item.healing, 0, character.maxHealth)
			inventory[lastIndex] = noone
			//show_message("yum!")
			break
		case 2:
			if character.equipmentChoice == item.wepType {
				if character.weapon != noone {inventory[lastIndex] = character.weapon}
				else {inventory[lastIndex] = noone}
				character.weapon = item
				//show_message("cool weapon")
			} else {return}
			break
		case 3:
			if character.equipmentChoice == item.armorType {
				if character.armor != noone {inventory[lastIndex] = character.armor}
				else {inventory[lastIndex] = noone}
				character.armor = item
				//show_message("fancy armor")
			} else {return}
			break
	}
	MoveDownList()
	inventorySpot = lastSpot; inventoryIndex = lastIndex
}