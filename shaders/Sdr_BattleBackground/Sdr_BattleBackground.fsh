// credit to the link below for being very helpful to this whole shebang
// https://forum.gamemaker.io/index.php?threads/wavy-shader-help.112715/

// Texture variables idk it's important or something
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// Sprite stuff
uniform vec2 uv_center;
uniform vec2 uv_dimensions;

// General wave info
uniform float progress;
uniform float wave_length;
uniform float wave_freq;

// Checks for specific wave types and stuff
uniform int sway_horizontal;
uniform int split_wave;
uniform int ripple_effect;
uniform int sub_layer;

void main()
{
	// Setting up local variables
	float tau = 2.0 * 3.14;
	vec2 coord = vec2(
        v_vTexcoord.x,
        v_vTexcoord.y
    );
	
	// Horizontal
	if (sway_horizontal == 1) {
		// Calculate wavy distortion using sine wave function
	    float pos_y = v_vTexcoord.y*70;
	    float x_adj = wave_length * 0.05 * uv_dimensions.x * sin(progress * tau * wave_freq + pos_y);
	
		// Checking if the wave should be split into layers
		if (split_wave == 1) {
			if(mod(coord.y, uv_center.y/50) >= uv_center.y/100) {
				x_adj = -x_adj;
			}
		}
		
		if (ripple_effect == 1) {
			coord.y += x_adj;
		} else {
			coord.x += x_adj;
		}

	    // Check if the current texture coordinate is outside the specified range (Lame)
	    //if (coord.x > uv_center.x + uv_dimensions.x || coord.x < uv_center.x - uv_dimensions.x) {
	    //    gl_FragColor = vec4(v_vColour.rgb, 0.0); // Set alpha to 0
	    //} else {
	        gl_FragColor = v_vColour * texture2D(gm_BaseTexture, coord);
	    //}
	}
	// Vertical
	else {
		// Calculate wavy distortion using sine wave function
	    float pos_x = v_vTexcoord.x*70;
	    float y_adj = wave_length * 0.05 * uv_dimensions.y * sin(progress * tau + pos_x);
	
		// Checking if the wave should be split into layers
		if (split_wave == 1) {
			if(mod(coord.x, uv_center.x/50) >= uv_center.x/100) {
				y_adj = -y_adj;
			}
		}
		
		if (ripple_effect == 1) {
			coord.x += y_adj;
		} else {
			coord.y += y_adj;
		}

	    // Check if the current texture coordinate is outside the specified range (Lame and stupid)
	    //if (coord.y > uv_center.y + uv_dimensions.y || coord.y < uv_center.y - uv_dimensions.y) {
	    //    gl_FragColor = vec4(v_vColour.rgb, 0.0); // Set alpha to 0
	    //} else {
	        gl_FragColor = v_vColour * texture2D(gm_BaseTexture, coord);
	    //}
		// Uncomment this code it you want some sick static
		//if (coord.y > uv_center.y + uv_dimensions.y) {
	    //    coord.y -= uv_dimensions.y;
	    //} else if (coord.y < uv_center.y - uv_dimensions.y) {
	    //    coord.y += uv_dimensions.y;
	    //}
	}
	
	// Checking if this is the second layer
	if (sub_layer == 1) {
		gl_FragColor.a = 0.5;
	}
}