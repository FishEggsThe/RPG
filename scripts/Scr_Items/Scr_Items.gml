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
	
	var layeredDesc = _desc
	if string_length(_desc) > 33 {
		layeredDesc = ""; var currDesc = ""; var splitDesc = string_split(_desc, " ")
		
		for(var i = 0; i < array_length(splitDesc); i++) {
			if string_length(currDesc+splitDesc[i]) > 33 {
				layeredDesc += (string_trim(currDesc) + "\n")
				currDesc = ""
			}
			currDesc += (splitDesc[i]+" ")
		}
	}
	description = string_trim(layeredDesc)
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