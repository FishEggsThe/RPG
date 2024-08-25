//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 sampleColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	//sampleColor.rgb = vec3(30, 20, 10)
	sampleColor.rgb += vec3(0.5);
	
    gl_FragColor = sampleColor;
}
