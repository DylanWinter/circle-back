shader_type canvas_item;


uniform bool isInteractable;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {

	if (isInteractable == true && COLOR.a>0.1)
	{
		COLOR.r =0.0;
		COLOR.g =0.0;
		COLOR.b = 1.0;
		COLOR.a = 0.2;
	}
}
