//
// NOT SIMPLE passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float progress;                      // Progress of the fizzle effect (in [0, 1])
uniform float wave_length;     
uniform int sub_layer;
uniform vec2 uv_center;
uniform vec2 uv_dimensions;     // Frequency of the sine wave for the fizzle effect


void main()
{
	//if(sub_layer == 1) {
	//	v_vColour.a = 0.5;
	//}
    
    // Calculate wavy distortion using sine wave function
    float pos_y = v_vTexcoord.y;
    float x_adj = wave_length * 0.05 * uv_dimensions.x * sin(progress * 2.0 * 3.14 + pos_y*70);
	

    vec2 coord = vec2(
        uv_center.x + (v_vTexcoord.x - uv_center.x),
        v_vTexcoord.y
    );
	
	if(mod(coord.y, uv_center.y/50) >= uv_center.y/100) {
		coord.x -= x_adj;
	} else {
		coord.x += x_adj;
	}

    // Check if the current texture coordinate is outside the specified range
    if (coord.x > uv_center.x + uv_dimensions.x || coord.x < uv_center.x - uv_dimensions.x) {
        gl_FragColor = vec4(v_vColour.rgb, 0.0); // Set alpha to 0
    } else {
        gl_FragColor = v_vColour * texture2D(gm_BaseTexture, coord);
    }
}