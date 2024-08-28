backgroundID = 0
backgroundStorage = ds_list_create()
FillBackgroundStorage()

backgroundList = []
backgroundList = backgroundStorage[| backgroundID]
backgroundListSize = array_length(backgroundList)

shader = Sdr_BattleBackground
progress = 0

// Uniform variable stuff
shader_progress = shader_get_uniform(shader, "progress");
shader_wave_length = shader_get_uniform(shader, "wave_length");
shader_wave_freq = shader_get_uniform(shader, "wave_freq");

shader_dimensions = shader_get_uniform(shader, "uv_dimensions");
shader_center = shader_get_uniform(shader, "uv_center");

shader_split = shader_get_uniform(shader, "split_wave");
shader_ripple = shader_get_uniform(shader, "ripple_effect");
shader_horizontal = shader_get_uniform(shader, "sway_horizontal");

shader_sub = shader_get_uniform(shader, "sub_layer");