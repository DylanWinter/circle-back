shader_type canvas_item;

uniform sampler2D noise_tex;
uniform sampler2D noise_tex2;

void vertex() {
	// Called for every vertex the material is visible on.
	//VERTEX.x += TIME;
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec4 noise1_texture = texture(noise_tex,UV);
	vec4 noise2_texture = texture(noise_tex2,UV);
	
	vec2 noise_uv = UV;
	
	float noise_val = noise1_texture.r;
	
	noise_uv += noise2_texture.rg*0.1;
	
	
	
	float noise_val2 = noise2_texture.r/2.0;
	
	
	COLOR.b = noise_val/2.0;
	COLOR.g = noise_val;
	
	COLOR.r+=noise_val2;
	COLOR.g+=noise_val2;
	COLOR.b+=noise_val2;
	

}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
