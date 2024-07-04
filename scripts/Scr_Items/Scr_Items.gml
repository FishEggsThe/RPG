function Item(d) constructor {
	// Key Item = 0;
	// Consumable = 1;
	// Weapon = 2;
	// Armor = 3;
	itemType = 0
	description = d
}

function Consumable(h, c, d) : Item(d) constructor {
	itemType = 1
	healing = h
	cureStatus = c // e.g. [true, false, false], I'll figure out status effects later
	
}

function Weapon(a, d) : Item(d) constructor {
	itemType = 2
	damage = a
	
}

function Armor(p, d) : Item(d) constructor {
	itemType = 3
	protection = p
	
}