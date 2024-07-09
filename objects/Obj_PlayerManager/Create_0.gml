if instance_number(Obj_PlayerManager) > 1 {instance_destroy()}


inventoryUp = false
inventoryIndex = 0
inventorySpot = 0
selectedItem = noone
selectedCharacter = noone

lastSpot = 0
lastIndex = 0
menuOptions = ["Inventory", "Key Items", "Characters"]
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


characters = array_create(4, noone)
characters[0] = new PlayerStats(25, 15, chives2, chives, 0, noone, noone, [], 5, 5, 5, 5, 
								"You", "I have literally never met you before in my life")
characters[0].weapon = new Weapon(0, 1, 0.00000000001, 1, 0, chives2, "Stick", "At least's it's a neat stick")
characters[0].armor = new Armor(0, 1, 1, 0, chives2, "Stick Armor", "The unworthy sticks get sewn into armor")


characters[1] = new PlayerStats(15, 25, chives2, chives, 1, noone, noone, [], 5, 5, 5, 5, 
								"Slime", "Tired of working the grueling 9-5, this slime is looking for a more meaningful purpose")


characters[2] = new PlayerStats(15, 25, chives2, chives, 2, noone, noone, [], 5, 5, 5, 5, 
								"Dinosaur", "Has found its calling to life, which involves a lot of biting")
characters[2].weapon = new Weapon(2, 5, 0.05, 1, 1, chives2, "Dino Pincher Toy", "Bought on clearance")
characters[2].armor = new Weapon(2, 5, 0.05, 1, 1, chives2, "Green Dino Onesie", "Bought on clearance")
								
inventory = array_create(8, noone)
inventory[0] = new Consumable(5, array_create(3, false), array_create(3, false), 2, 1, chives2, "Tuna Sandwich", "Its okay")
inventory[1] = new Weapon(0, 5, 0.1, 3, 2, chives2, "Dinky Sword", "If you swing this too hard, it might fall apart")
inventory[2] = new Armor(0, 3, 3, 2, chives2, "Dinky Armor", "You can feel the weldings coming undone")

keyItems = array_create(8, noone)
keyItems[0] = new Item(0, -4, chives, "The Bible", "The whole thing")