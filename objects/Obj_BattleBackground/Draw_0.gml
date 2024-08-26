var spriteWidth = sprite_get_width(background)
var spriteHeight = sprite_get_height(background)
var xCenter = sprite_get_xoffset(background)
var yCenter = sprite_get_yoffset(background)
var spritesPerRow = room_width/spriteWidth
var spritesPerColumn = room_height/spriteHeight

//shader_set(Sdr_BattleTest)
//var shader_size = shader_get_uniform(Sdr_BattleTest, "size");
//shader_set_uniform_f(shader_size, spriteWidth);
//var shader_time = shader_get_uniform(Sdr_BattleTest, "time");
//shader_set_uniform_f(shader_time, current_time / 4000);

shader_set(Sdr_BattleTest2)
var shader_progress = shader_get_uniform(Sdr_BattleTest2, "progress");
var shader_dimensions = shader_get_uniform(Sdr_BattleTest2, "uv_dimensions");
var shader_center = shader_get_uniform(Sdr_BattleTest2, "uv_center");
shader_set_uniform_f(shader_progress, current_time);
shader_set_uniform_f(shader_dimensions, spriteWidth, spriteHeight);
shader_set_uniform_f(shader_center, 0, 0);



for(var i = -1; i < spritesPerRow+1; i++) {
	for(var j = -1; j < spritesPerColumn+1; j++) {
		draw_sprite(background, 0, xCenter + spriteWidth*i, yCenter + spriteHeight*j)
	}
}

shader_reset()