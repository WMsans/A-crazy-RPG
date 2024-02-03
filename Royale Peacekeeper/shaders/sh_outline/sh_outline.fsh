//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float PixelH;
uniform float PixelW;

void main()
{
	vec2 offset_x;
	offset_x.x = PixelW;
	vec2 offset_y;
	offset_y.y = PixelH;
	
	float alpha = texture2D( gm_BaseTexture, v_vTexcoord ).a;
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord + offset_x ).a);
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord - offset_x ).a);
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord + offset_y ).a);
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord - offset_y ).a);
	
	
	gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	gl_FragColor.a = alpha;
	
}
