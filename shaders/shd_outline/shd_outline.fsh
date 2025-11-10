//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 borderColour;
uniform float borderSize;

void main()
{
	vec2 offsetx;
	offsetx.x = borderSize;
	vec2 offsety;
	offsety.y = borderSize;
	
	float alpha = texture2D( gm_BaseTexture, v_vTexcoord ).a;
	alpha = max(alpha, texture2D( gm_BaseTexture, v_vTexcoord + offsetx).a);
	alpha = max(alpha, texture2D( gm_BaseTexture, v_vTexcoord - offsetx).a);
	alpha = max(alpha, texture2D( gm_BaseTexture, v_vTexcoord + offsety).a);
	alpha = max(alpha, texture2D( gm_BaseTexture, v_vTexcoord - offsety).a);
	
    gl_FragColor = v_vColour * borderColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor.a = alpha;
	//gl_FragColor = dot(gl_FragColor, borderColour);
}