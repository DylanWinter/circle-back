shader_type canvas_item;
render_mode blend_mix;

uniform int color_deficiency_type : hint_enum(
    "NormalVision", "Protanopia", "Protonomaly",
    "Deuteranopia", "Deuteranomaly", "Tritanopia",
    "Tritanomaly", "Achromatopsia", "Achromatomaly") = 0;

uniform sampler2D screen_texture : hint_screen_texture;

void fragment() {
    vec2 uv = SCREEN_UV;
    vec3 original = texture(screen_texture, uv).rgb;

    // Матрицы для симуляции различных форм цветовой слепоты
    mat3 color_matrices[9] = mat3[](
        mat3( // 0: Normal vision
            vec3(1.0, 0.0, 0.0),
            vec3(0.0, 1.0, 0.0),
            vec3(0.0, 0.0, 1.0)
        ),
        mat3( // 1: Protanopia
            vec3(0.152, 1.053, -0.205),
            vec3(0.115, 0.786, 0.099),
            vec3(-0.004, -0.048, 1.052)
        ),
        mat3( // 2: Protonomaly
            vec3(0.817, 0.333, -0.150),
            vec3(0.333, 0.667,  0.000),
            vec3(-0.017, 0.000, 1.017)
        ),
        mat3( // 3: Deuteranopia
            vec3(0.367, 0.861, -0.228),
            vec3(0.280, 0.673,  0.047),
            vec3(-0.012, 0.043, 0.969)
        ),
        mat3( // 4: Deuteranomaly
            vec3(0.800, 0.200, 0.000),
            vec3(0.258, 0.742, 0.000),
            vec3(0.000, 0.142, 0.858)
        ),
        mat3( // 5: Tritanopia
            vec3(1.256, -0.077, -0.179),
            vec3(-0.078, 0.931, 0.148),
            vec3(0.005, 0.691, 0.304)
        ),
        mat3( // 6: Tritanomaly
            vec3(0.967, 0.033, 0.000),
            vec3(0.000, 0.733, 0.267),
            vec3(0.000, 0.183, 0.817)
        ),
        mat3( // 7: Achromatopsia
            vec3(0.299, 0.299, 0.299),
            vec3(0.587, 0.587, 0.587),
            vec3(0.114, 0.114, 0.114)
        ),
        mat3( // 8: Achromatomaly
            vec3(0.618, 0.320, 0.062),
            vec3(0.163, 0.775, 0.062),
            vec3(0.163, 0.320, 0.516)
        )
    );

    // Применяем нужную матрицу
    mat3 selected_matrix = color_matrices[clamp(color_deficiency_type, 0, 8)];
    COLOR.rgb = selected_matrix * original;
}


//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
