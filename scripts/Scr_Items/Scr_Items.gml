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

function Consumable(_heal, _mana, _cure, _buff, _buy, _sell, _image, _name, _desc) : Item(_buy, _sell, _image, _name, _desc) constructor {
	itemType = 1
	healing = _heal
	mana = _mana
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
	defense = _def
	
}

function PickupItem(pickup) {
	with Obj_PlayerManager {
		if pickup.item == noone {
			PrintErrorDebug("Who let you make a pickup with no pickup?")
			return
		}
		
		if pickup.item.itemType == 0 {
			for(var i = 0; i < array_length(keyItems); i++){
				if keyItems[i] == noone {
					keyItems[i] = pickup.item
					
					RemoveFromRoomState(pickup.roomStateID)
					
					instance_destroy(pickup)
					return
				}
			}
			show_message("You're holding too many key items!")
		} else {
			for(var i = 0; i < array_length(inventory); i++){
				if inventory[i] == noone {
					inventory[i] = pickup.item
					
					RemoveFromRoomState(pickup.roomStateID)
					
					instance_destroy(pickup)
					return
				}
			}
			show_message("Inventory full!")
		}
	}
}

function InventoryFigureItem(item, character, index = lastIndex) {
	//if room == Rm_Battle {
	//	var invSave = array_create(4, noone)
	//	for(var i = 0; i < array_length(inventory); i++)
	//		invSave[i] = inventory[i]
	//	Obj_Battle.inventorySave[Obj_Battle.characterIndex][0] = invSave
	//}
	
	switch(item.itemType) {
		case 1:
			//inventory[index] = noone
			break
		case 2:
			if character.equipmentChoice == item.wepType {
				if character.weapon != noone {inventory[index] = character.weapon}
				else {inventory[index] = noone}
			} else {return}
			break
		case 3:
			if character.equipmentChoice == item.armorType {
				if character.armor != noone {inventory[index] = character.armor}
				else {inventory[index] = noone}
			} else {return}
			break
	}
	inventory[index] = noone
	
	if room == Rm_Battle {
		inventoryUp = false; var battle = Obj_Battle
		
		battle.inventorySave[battle.characterIndex][1] = "item"
		battle.inventorySave[battle.characterIndex][2] = [item, character, lastIndex]
		
		with Obj_Battle {NextCharacter()}
		
	} else {
		inventoryUp = false//inventorySpot = lastSpot; inventoryIndex = index
		UseItem(item, character); MoveDownList()
	}
}

function UseItem(item, character, index = lastIndex) {
	if item == noone {show_message("How the hell did you select nothing"); return;}
	var itemDialogue = ""
	
	switch(item.itemType) {
		case 1:
			character.currHealth = clamp(character.currHealth+item.healing, 0, character.maxHealth)
			character.currMana = clamp(character.currMana+item.mana, 0, character.maxMana)
			itemDialogue = character.name + " took a swig of " + item.name
			break
		case 2:
			if character.weapon != noone {inventory[index] = character.weapon}
			itemDialogue = character.name + " equipped the " + item.name
			character.weapon = item
			break
		case 3:
			if character.armor != noone {inventory[index] = character.armor}
			itemDialogue = character.name + " equipped the " + item.name
			character.armor = item
			break
	}
	BeginDialogue(itemDialogue)
}