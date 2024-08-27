var spriteWidth = sprite_get_width(background)
var spriteHeight = sprite_get_height(background)
var xCenter = room_width/2
var yCenter = room_height/2
var spritesPerRow = room_width/spriteWidth
var spritesPerColumn = room_height/spriteHeight

// Background 1
shader_set(Sdr_BattleBackground)
var uv = sprite_get_uvs(background, 0)
var uv_width = uv[2]-uv[0]; var uv_height = uv[3]-uv[1]


shader_set_uniform_f(shader_progress, current_time/5000);
shader_set_uniform_f(shader_wave_length, 1.5);
shader_set_uniform_f(shader_wave_freq, 2);
shader_set_uniform_f(shader_dimensions, uv_width, uv_height);
shader_set_uniform_f(shader_center, uv_width/2, uv_height/2);

shader_set_uniform_i(shader_split, 0);
shader_set_uniform_i(shader_ripple, 0);
shader_set_uniform_i(shader_horizontal, 0);
shader_set_uniform_i(shader_sub, 0);

draw_sprite(background, 0, xCenter, yCenter)


// Background 2
if !enableSubBackground {exit}
uv = sprite_get_uvs(subBackground, 0)
uv_width = uv[2]-uv[0]; uv_height = uv[3]-uv[1]

shader_set_uniform_f(shader_progress, current_time/6000);
shader_set_uniform_f(shader_wave_length, 2.0);
shader_set_uniform_f(shader_wave_freq, 1);
shader_set_uniform_f(shader_dimensions, uv_width, uv_height);
shader_set_uniform_f(shader_center, uv_width/2, uv_height/2);

shader_set_uniform_i(shader_split, 0);
shader_set_uniform_i(shader_ripple, 0);
shader_set_uniform_i(shader_horizontal, 0);
shader_set_uniform_i(shader_sub, 1);

draw_sprite(subBackground, 0, xCenter, yCenter)

shader_reset()