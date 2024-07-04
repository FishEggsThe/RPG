if instance_number(Obj_Inventory) > 1 {instance_destroy()}

inventoryUp = false

inventory = array_create(8, noone)

inventory[0] = new Weapon(5, 0.1, "Dinky Sword", 3, 2, "If you swing this too hard, it might fall apart")
inventory[1] = new Armor(3, "Dinky Armor", 3, 2, "You can feel the weldings coming apart")