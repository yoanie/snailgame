
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float params;

void main()
{
	vec4 ghostBy = vec4(1., 1., 1., params);
    gl_FragColor = ghostBy * v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}
