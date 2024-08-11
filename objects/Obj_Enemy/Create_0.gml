event_inherited()
dialogue = "*Spider noise"

enemyInfo = array_create(3, noone)

var spiderSpell = new OffenseSpell(3, [], 1, 0, "Spider Bite", 
"Before you get too exasperated, these spiders are not poisonous")
var spider = new Enemy(30, Spr_SpiderBattle, [spiderSpell], 3, 3, "Spider", 
					   [640/2-200, 640/2], AnCv_Spider, 1/30)
for(var i = 0; i < 3; i++) {
	enemyInfo[i] = spider
}

//enemyInfo = [new Enemy(30, Spr_SpiderBattle, [], 5, 3, "Spider", 
//					   [640/2-200, 640/2], AnCv_Spider, 1/30),
//			 new Enemy(30, Spr_SpiderBattle, [], 5, 3, "Spider", 
//					   [640/2, 640/2+20], AnCv_Spider, 1/30),
//			 new Enemy(30, Spr_SpiderBattle, [], 5, 3, "Spider", 
//					   [640/2+200, 640/2], AnCv_Spider, 1/30)]