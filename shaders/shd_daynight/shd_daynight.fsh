//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 col;

void main()
{
	vec3 out_col = texture2D( gm_BaseTexture, v_vTexcoord ).rgb;
    gl_FragColor = vec4(out_col * col, 1.0);
}
