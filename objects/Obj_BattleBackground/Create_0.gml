background = Spr_Lines2
subBackground = background
enableSubBackground = false
shader = Sdr_BattleBackground

shader_progress = shader_get_uniform(shader, "progress");
shader_wave_length = shader_get_uniform(shader, "wave_length");
shader_wave_freq = shader_get_uniform(shader, "wave_freq");

shader_dimensions = shader_get_uniform(shader, "uv_dimensions");
shader_center = shader_get_uniform(shader, "uv_center");

shader_split = shader_get_uniform(shader, "split_wave");
shader_ripple = shader_get_uniform(shader, "ripple_effect");
shader_horizontal = shader_get_uniform(shader, "sway_horizontal");

shader_sub = shader_get_uniform(shader, "sub_layer");