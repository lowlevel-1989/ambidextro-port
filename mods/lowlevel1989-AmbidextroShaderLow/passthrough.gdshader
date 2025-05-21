shader_type canvas_item;

// Input texture representing the current screen content
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, repeat_disable, filter_nearest;

void fragment() {
    vec4 color = texture(SCREEN_TEXTURE, SCREEN_UV);
    COLOR = color;
}