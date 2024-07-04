if instance_number(Obj_PlayerManager) > 1 {instance_destroy()}


inventoryUp = false
inventoryIndex = 0
inventorySpot = 0
selectedItem = noone
lastSpot = 0
lastIndex = 0

menuOptions = ["Inventory", "Key Items"]
useOptions = ["Use", "Don't Use"]
emptyPockets = ["1",
				"2",
				"3",
				"4",
				"5",
				"6",
				"7",
				"8",
				]

inventory = array_create(8, noone)
inventory[0] = new Consumable(5, array_create(3, false), array_create(3, false), 2, 1, chives, "Tuna Sandwich", "Its okay")
inventory[1] = new Weapon(5, 0.1, 3, 2, chives, "Dinky Sword", "If you swing this too hard, it might fall apart")
inventory[2] = new Armor(3, 3, 2, chives, "Dinky Armor", "You can feel the weldings coming undone")

keyItems = array_create(8, noone)
keyItems[0] = new Item(0, -4, chives, "The Bible", "The whole thing")