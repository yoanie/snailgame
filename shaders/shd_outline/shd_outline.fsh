//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 borderColour;
uniform float borderSize;

void main()
{
	vec2 offset = vec2(borderSize, borderSize);
	
	float alpha = texture2D( gm_BaseTexture, v_vTexcoord ).a;
	alpha = max(alpha, texture2D( gm_BaseTexture, v_vTexcoord + offset.x).a);
	alpha = max(alpha, texture2D( gm_BaseTexture, v_vTexcoord - offset.x).a);
	alpha = max(alpha, texture2D( gm_BaseTexture, v_vTexcoord + offset.y).a);
	alpha = max(alpha, texture2D( gm_BaseTexture, v_vTexcoord - offset.y).a);
	
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor.a = alpha;
}