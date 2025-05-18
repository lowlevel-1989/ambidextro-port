/***************************************************************************
 * Optimized and Documented CRT/VHS Shader
 * ---------------------------------------
 * All conditionals (if-statements) have been eliminated and replaced with
 * mathematical functions (e.g. mix, step, smoothstep) for better performance
 * on low-end or mobile GPUs.
 *
 * lowlevel.1989
 *
 * Based on the original shader:
 * https://godotshaders.com/shader/VHS-and-CRT-monitor-effect
 ***************************************************************************/
shader_type canvas_item;

// Input texture representing the current screen content
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, repeat_disable, filter_nearest;

// Scanlines effect parameters
uniform float scanlines_opacity : hint_range(0.0, 1.0) = 0.4;
uniform float scanlines_width : hint_range(0.0, 0.5) = 0.25;

// CRT grille effect (subpixel pattern) opacity
uniform float grille_opacity : hint_range(0.0, 1.0) = 0.3;

// Resolution for pixelation and related effects
uniform vec2 resolution = vec2(640.0, 480.0);

// Chromatic aberration strength
uniform float aberration : hint_range(-0.1, 0.1) = 0.03;

// Overall brightness multiplier
uniform float brightness = 1.4;

// Screen warp intensity
uniform float warp_amount : hint_range(0.0, 5.0) = 1.0;

// Vignette (darkening toward edges) parameters
uniform float vignette_intensity = 0.4;
uniform float vignette_opacity : hint_range(0.0, 1.0) = 0.5;

// Applies radial distortion to UV coordinates
vec2 warp(vec2 uv) {
    vec2 delta = uv - 0.5;
    float delta2 = dot(delta, delta);
    float delta_offset = delta2 * delta2 * warp_amount;
    return uv + delta * delta_offset;
}

// Computes vignette effect based on UV position
float vignette(vec2 uv) {
    uv *= 1.0 - uv;
    return pow(uv.x * uv.y * 15.0, vignette_intensity * vignette_opacity);
}

// Calculates border mask for clipping edges when warping
float border(vec2 uv){
	float r = clamp(min(warp_amount * 2.0, 0.08), 1e-5, 1.0);
	vec2 a = abs(uv * 2.0 - 1.0) - 1.0 + r;
	float d = length(max(vec2(0.0), a)) / r;
	return clamp(1.0 - smoothstep(0.96, 1.0, d), 0.0, 1.0);
}


void fragment() {
    vec2 uv = warp(SCREEN_UV);

	// Chromatic aberration
    vec4 text;
	text.a = 1.0;
    text.r = texture(SCREEN_TEXTURE, uv + vec2(aberration, 0.0) * .17).r;
    text.g = texture(SCREEN_TEXTURE, uv - vec2(aberration, 0.0) * .17).g;
    text.b = texture(SCREEN_TEXTURE, uv).b;

    // Grille pattern
    float pi = 3.14159265;
    vec3 col = text.rgb;
    col.r *= mix(1.0, smoothstep(0.85, 0.95, abs(sin(uv.x * resolution.x * pi))), grille_opacity);
    col.g *= mix(1.0, smoothstep(0.85, 0.95, abs(sin(uv.x * resolution.x * pi + 1.05))), grille_opacity);
    col.b *= mix(1.0, smoothstep(0.85, 0.95, abs(sin(uv.x * resolution.x * pi + 2.1))), grille_opacity);

    // Scanlines
    float scanlines = smoothstep(scanlines_width, scanlines_width + 0.5, abs(sin(uv.y * resolution.y * pi)));
    col = mix(col, col * scanlines, scanlines_opacity);

    // Border and vignette
    col *= brightness * vignette(uv) * border(uv);

	// Final color
	COLOR = vec4(col, text.a);
}
