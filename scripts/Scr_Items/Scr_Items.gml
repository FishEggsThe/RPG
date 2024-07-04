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