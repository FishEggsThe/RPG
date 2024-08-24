//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 sampleColor = texture2D( gm_BaseTexture, v_vTexcoord );
	//sampleColor.rgb = vec3(30, 20, 10)
	sampleColor.b = 0;
	
    gl_FragColor = sampleColor;
}
