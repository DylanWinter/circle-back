shader_type canvas_item;

uniform bool use_silhouette = false;

void fragment() {
    if (use_silhouette) {
        COLOR = vec4(0.0, 0.0, 0.0, 1.0);
    } else {
        COLOR = texture(TEXTURE, UV);
    }
}
