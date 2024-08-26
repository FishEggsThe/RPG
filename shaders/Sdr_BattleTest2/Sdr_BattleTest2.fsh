//
// NOT SIMPLE passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float progress;                      // Progress of the fizzle effect (in [0, 1])
uniform vec2 uv_center;
uniform vec2 uv_dimensions;

const float max_scale = 3.0;      // Maximum displacement ratio for the fizzle effect
const float wave_freq = 2.0;          // Frequency of the sine wave for the fizzle effect


void main()
{
    
    // Calculate wavy distortion using sine wave function
    float pos_y = v_vTexcoord.y;
    float x_adj = progress * 0.75 * uv_dimensions.x * sin((v_vTexcoord.y - uv_center.y)/uv_dimensions.y * wave_freq * 2.0 * 3.14);


    vec2 coord = vec2(
        uv_center.x + max_scale*(v_vTexcoord.x - uv_center.x) + x_adj,
        v_vTexcoord.y
    );

    // Check if the current texture coordinate is outside the specified range
    if (coord.x > uv_center.x + uv_dimensions.x/max_scale || coord.x < uv_center.x - uv_dimensions.x/max_scale) {
        gl_FragColor = vec4(v_vColour.rgb, 0.0); // Set alpha to 0
    } else {
        gl_FragColor = v_vColour * texture2D(gm_BaseTexture, coord);
    }
}