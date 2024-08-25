//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

varying float v_vLine;

uniform float time;

void main()
{
	float tau = 3.14*2.0;
	float offset = 60.0 * sin(tau * time);
	v_vLine = floor(in_Position.y);
	//float trueOffset = offset * mod(floor(v_vLine),2.0);
	float trueOffset = offset * mod(floor(v_vLine)/64, 2.0);
	
	
    vec4 object_space_pos = vec4( in_Position.x+trueOffset, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}
