event_inherited()
dialogue = "*Spider noise"

enemyInfo = array_create(3, noone)

var spiderSpells = [
new OffenseSpell(3, [StatusEffect("poison", chives2, function() {hp--})], 1, 0, "Spider Bite", 
"Before you get too exasperated, these spiders are not poisonous"),
new SupportSpell(0, [], [], 3, 0, "Spider Web", 
"Spiders are wonderful artists")]

for(var i = 0; i < 3; i++) {
	var odd = i%2 == 1
	var spider = new Enemy(30, Spr_SpiderBattle, spiderSpells, 3, 3, 3, 3, 3, "Spider", 
						   [640/2+(i-1)*200, 640/2+odd*20], AnCv_Spider, 1/30)
	enemyInfo[i] = spider
}

//enemyInfo = [new Enemy(30, Spr_SpiderBattle, [], 5, 3, "Spider", 
//					   [640/2-200, 640/2], AnCv_Spider, 1/30),
//			 new Enemy(30, Spr_SpiderBattle, [], 5, 3, "Spider", 
//					   [640/2, 640/2+20], AnCv_Spider, 1/30),
//			 new Enemy(30, Spr_SpiderBattle, [], 5, 3, "Spider", 
//					   [640/2+200, 640/2], AnCv_Spider, 1/30)]