function Item(buy, sell, desc) constructor {
	// Key Item = 0;
	// Consumable = 1;
	// Weapon = 2;
	// Armor = 3;
	itemType = 0
	description = desc
	buyPrice = buy
	sellPrice = sell
}

function Consumable(heal, cure, buff, buy, sell, desc) : Item(buy, sell, desc) constructor {
	itemType = 1
	healing = heal
	cureStatus = cure // e.g. [true, false, false], I'll figure out status effects later
	buffStats = buff // same as cure but with numbers
}

function Weapon(attack, buy, sell, desc) : Item(buy, sell, desc) constructor {
	itemType = 2
	damage = attack
	
}

function Armor(def, buy, sell, desc) : Item(buy, sell, desc) constructor {
	itemType = 3
	protection = def
	
}