shader_type canvas_item;

uniform float life_t = 0.0;
uniform float wobble = 0.0;
uniform vec4 flare_color : source_color = vec4(1.0, 0.78, 0.34, 1.0);
uniform float edge_fade = 1.0;

void fragment() {
	vec2 uv = UV;
	float center_falloff = 1.0 - abs(uv.y - 0.5) * 2.0;
	float tip_falloff = smoothstep(0.0, 0.24, uv.x) * (1.0 - smoothstep(0.78, 1.0, uv.x));
	float life_alpha = sin(life_t * 3.14159265);
	float shimmer = 0.85 + 0.15 * sin((uv.x * 12.0) + wobble * 6.0);
	float alpha = center_falloff * tip_falloff * life_alpha * edge_fade * shimmer;
	COLOR = vec4(flare_color.rgb, alpha * flare_color.a);
}
