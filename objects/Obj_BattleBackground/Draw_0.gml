//var spriteWidth = sprite_get_width(background)
//var spriteHeight = sprite_get_height(background)
//var spritesPerRow = room_width/spriteWidth
//var spritesPerColumn = room_height/spriteHeight

var xCenter = room_width/2
var yCenter = room_height/2

shader_set(shader)
for(var i = 0; i < backgroundListSize; i++) {
	var bg = backgroundList[i]

	shader_set_uniform_f(shader_dimensions, bg.uv_width, bg.uv_height);
	shader_set_uniform_f(shader_center, bg.uv_width/2, bg.uv_height/2);

	shader_set_uniform_f(shader_progress, bg.progress*current_time);
	shader_set_uniform_f(shader_wave_length, bg.length);
	shader_set_uniform_f(shader_wave_freq, bg.frequency);

	shader_set_uniform_i(shader_split, bg.split);
	shader_set_uniform_i(shader_ripple, bg.ripple);
	shader_set_uniform_i(shader_horizontal, bg.horizontal);
	shader_set_uniform_i(shader_sub, i > 0);

	draw_sprite(bg.battleBackground, 0, xCenter, yCenter)
}

shader_reset()