//var spriteWidth = sprite_get_width(background)
//var spriteHeight = sprite_get_height(background)
//var spritesPerRow = room_width/spriteWidth
//var spritesPerColumn = room_height/spriteHeight


var xCenter = room_width/2
var yCenter = room_height/2

shader_set(shader)
for(var i = 0; i < backgroundListSize; i++) {
	var bg = backgroundList[i]
	var uv = sprite_get_uvs(bg.battleBackground, 0)
	var uv_width = uv[2]-uv[0]; var uv_height = uv[3]-uv[1]

	shader_set_uniform_f(shader_dimensions, uv_width, uv_height);
	shader_set_uniform_f(shader_center, uv_width/2, uv_height/2);

	shader_set_uniform_f(shader_progress, bg.progress*current_time);
	shader_set_uniform_f(shader_wave_length, bg.length);
	shader_set_uniform_f(shader_wave_freq, bg.frequency);

	shader_set_uniform_i(shader_split, bg.split);
	shader_set_uniform_i(shader_ripple, bg.ripple);
	shader_set_uniform_i(shader_horizontal, bg.horizontal);
	shader_set_uniform_i(shader_sub, i > 0);

	draw_sprite(bg.battleBackground, 0, xCenter, yCenter)
}


// Background 2
//if !enableSubBackground {exit}
//uv = sprite_get_uvs(subBackground, 0)
//uv_width = uv[2]-uv[0]; uv_height = uv[3]-uv[1]

//shader_set_uniform_f(shader_progress, current_time/6000);
//shader_set_uniform_f(shader_wave_length, 2.0);
//shader_set_uniform_f(shader_wave_freq, 1);
//shader_set_uniform_f(shader_dimensions, uv_width, uv_height);
//shader_set_uniform_f(shader_center, uv_width/2, uv_height/2);

//shader_set_uniform_i(shader_split, 0);
//shader_set_uniform_i(shader_ripple, 0);
//shader_set_uniform_i(shader_horizontal, 0);
//shader_set_uniform_i(shader_sub, 1);

//draw_sprite(subBackground, 0, xCenter, yCenter)

shader_reset()