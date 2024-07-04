if instance_number(Obj_Inventory) > 1 {instance_destroy()}

inventoryUp = false

inventory = array_create(8, noone)

inventory[0] = new Consumable(5, array_create(3, false), array_create(3, false), "Tuna Sandwich", 2, 1, "Its okay")
inventory[1] = new Weapon(5, 0.1, "Dinky Sword", 3, 2, "If you swing this too hard, it might fall apart")
inventory[2] = new Armor(3, "Dinky Armor", 3, 2, "You can feel the weldings coming undone")