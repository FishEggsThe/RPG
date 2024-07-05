if instance_number(Obj_PlayerManager) > 1 {instance_destroy()}


inventoryUp = false
inventoryIndex = 0
inventorySpot = 0
selectedItem = noone
lastSpot = 0
lastIndex = 0

menuOptions = ["Inventory", "Key Items"]
useOptions = ["Use", "Don't Use"]
emptyPockets = ["Barely enough space for a gasp of air",
				"Could probably fit some change in here",
				"You could stuff a lot of dirt in here",
				"Pretty roomy in here",
				"5",
				"6",
				"I'm starting to get lost in here",
				"See how far you can stick your hand in here",
				"You wouldn't hear the screams"]

inventory = array_create(8, noone)
inventory[0] = new Consumable(5, array_create(3, false), array_create(3, false), 2, 1, chives2, "Tuna Sandwich", "Its okay")
inventory[1] = new Weapon(5, 0.1, 3, 2, chives2, "Dinky Sword", "If you swing this too hard, it might fall apart")
inventory[2] = new Armor(3, 3, 2, chives2, "Dinky Armor", "You can feel the weldings coming undone")

keyItems = array_create(8, noone)
keyItems[0] = new Item(0, -4, chives, "The Bible", "The whole thing")