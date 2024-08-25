shader_set(Sdr_BattleTest)
var shader_params = shader_get_uniform(Sdr_BattleTest, "time");
shader_set_uniform_f(shader_params, current_time / 3000);

var spriteWidth = sprite_get_width(background)
var spriteHeight = sprite_get_height(background)
var spritesPerRow = room_width/spriteWidth
var spritesPerColumn = room_height/spriteHeight
for(var i = -1; i < spritesPerRow+1; i++) {
	for(var j = -1; j < spritesPerColumn+1; j++) {
		draw_sprite(background, 0, spriteWidth*i, spriteHeight*j)
	}
}

shader_reset()