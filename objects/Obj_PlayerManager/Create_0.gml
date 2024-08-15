if instance_number(Obj_PlayerManager) > 1 {instance_destroy()}
else {
	depth = -10
	alarm[0] = 2
	width = display_get_gui_width(); height = display_get_gui_height()
	boxX1 = width/8; boxY1 = height/6; boxX2 = width*7/8; boxY2 = height*5/6;
	boxWidth = boxX2-boxX1; boxHeight = boxY2-boxY1

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

	// Playable Characters
	characters = array_create(4, noone)
	var walkSprites = [Spr_PersonWalk0, Spr_PersonWalk1, Spr_PersonWalk2, Spr_PersonWalk3]
	var knightSprites = [Spr_Knight0, Spr_Knight1, Spr_Knight2, Spr_Knight3]
	var slimeSprites = [Spr_Slime0, Spr_Slime1, Spr_Slime2, Spr_Slime3]
	var spells = [new OffenseSpell(5, [], 5, 1, "Skull Bash", "Do big damage"),
				  new OffenseSpell(12, [], 15, 1, "Skull Bash II", "Do BIGGER damage")]
	characters[0] = new PlayerStats(25, 15, knightSprites[3], knightSprites, 0, noone, noone, spells, 5, 4, 5, 5, 
									"Knight", "A mysterious warrior from an era long gone")
	characters[1] = new PlayerStats(15, 25, slimeSprites[3], slimeSprites, 1, noone, noone, [], 5, 5, 5, 5, 
									"Slime", "Tired of working the grueling 9-5, this slime is looking for a more meaningful purpose")
	//characters[2] = new PlayerStats(15, 25, walkSprites[3], walkSprites, 2, noone, noone, [], 5, 4, 5, 5, 
	//								"Dinosaur", "Has found its calling to life, which involves a lot of biting")
	//characters[3] = new PlayerStats(1, 1, chives, [chives, chives, chives, chives], 3, noone, noone, [], 0, 0, 0, 0, 
									//"Pet Rock", "Does nothing for the team")
								
	characters[0].weapon = new Weapon(0, 100, 0.00000000001, 1, 0, chives2, "Stick", "At least's it's a neat stick")
	characters[0].armor = new Armor(0, 1, 1, 0, chives2, "Stick Armor", "The unworthy sticks get sewn into armor")
	//characters[2].weapon = new Weapon(2, 5, 0.05, 1, 1, chives2, "Dino Pincher Toy", "Bought on clearance")
	//characters[2].armor = new Weapon(2, 5, 0.05, 1, 1, chives2, "Green Dino Onesie", "Bought on clearance")

	// Inventory Stuff
	inventory = array_create(16, noone)
	inventory[0] = new Consumable(15, 0, array_create(3, false), array_create(3, false), 2, 1, chives2, "Tuna Sandwich", "Its okay")
	inventory[1] = new Weapon(0, 5, 0.1, 3, 2, chives2, "Dinky Sword", "If you swing this too hard, it might fall apart")
	inventory[2] = new Armor(0, 3, 3, 2, chives2, "Dinky Armor", "You can feel the weldings coming undone")
	
	inventory[3] = new Consumable(0, 3, [], [], 0, 0, chives2, "Dirt", "Dirt")
	inventory[4] = new Consumable(0, 3, [], [], 0, 0, chives2, "Dirt", "Dirt")

	keyItems = array_create(8, noone)
	keyItems[0] = new Item(0, -4, chives, "The Bible", "The whole thing")
	//characters[1] = noone
	//characters[2] = noone
	
	inventoryLength = array_length(inventory)
	pageSize = 8; pages = inventoryLength/pageSize
	
	//for(var i = 0; i < NumOfCharacters(); i++){show_debug_message(characters[i].index)}
}