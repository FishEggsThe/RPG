var spriteWidth = sprite_get_width(background)
var spriteHeight = sprite_get_height(background)
var xCenter = room_width/2
var yCenter = room_height/2
var spritesPerRow = room_width/spriteWidth
var spritesPerColumn = room_height/spriteHeight


shader_set(Sdr_BattleTest2)
var uv = sprite_get_uvs(background, 0)
var uv_width = uv[2]-uv[0]; var uv_height = uv[3]-uv[1]

var shader_progress = shader_get_uniform(Sdr_BattleTest2, "progress");
var shader_dimensions = shader_get_uniform(Sdr_BattleTest2, "uv_dimensions");
var shader_center = shader_get_uniform(Sdr_BattleTest2, "uv_center");

shader_set_uniform_f(shader_progress, current_time/1000);
shader_set_uniform_f(shader_dimensions, uv_width, uv_height);
shader_set_uniform_f(shader_center, uv_width/2, uv_height/2);


draw_sprite(background, 0, xCenter, yCenter)
//draw_sprite(background, 0, xCenter, yCenter)

shader_reset()