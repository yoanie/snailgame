
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float params;

void main()
{
	vec4 dimBy = vec4(params, params, params, 1.);
    gl_FragColor = dimBy * v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}
