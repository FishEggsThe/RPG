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
	description = LayerDescription(_desc)
}

function Consumable(_heal, _cure, _buff, _buy, _sell, _image, _name, _desc) : Item(_buy, _sell, _image, _name, _desc) constructor {
	itemType = 1
	healing = _heal
	cureStatus = _cure // e.g. [true, false, false], I'll figure out status effects later
	buffStats = _buff // same as _cure but with numbers
}

function Weapon(_attack, _crit, _buy, _sell, _image, _name, _desc) : Item(_buy, _sell, _image, _name, _desc) constructor {
	itemType = 2
	damage = _attack
	critChance = _crit
}

function Armor(_def, _buy, _sell, _image, _name, _desc) : Item(_buy, _sell, _image, _name, _desc) constructor {
	itemType = 3
	protection = _def
	
}

function UseItem(item, character) {
	if item == noone {show_message("How the hell did you select nothing"); return;}
	
	switch(item.itemType) {
		case 1:
			character.currHealth += item.healing
			inventory[lastIndex] = noone
			show_message("yum!")
			break
		case 2:
			if character.weapon != noone {inventory[lastIndex] = character.weapon}
			else {inventory[lastIndex] = noone}
			character.weapon = item
			show_message("cool weapon")
			break
		case 3:
			if character.armor != noone {inventory[lastIndex] = character.armor}
			else {inventory[lastIndex] = noone}
			character.armor = item
			show_message("fancy armor")
			break
	}
}