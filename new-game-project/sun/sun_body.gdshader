shader_type canvas_item;

uniform float time_scale = 0.0;
uniform vec4 core_color : source_color = vec4(1.0, 0.95, 0.78, 1.0);
uniform vec4 mid_color : source_color = vec4(1.0, 0.66, 0.3, 1.0);
uniform vec4 edge_color : source_color = vec4(0.96, 0.2, 0.04, 1.0);
uniform float flow_scale = 3.0;
uniform float flow_speed = 0.18;
uniform float band_strength = 0.3;
uniform float edge_softness = 0.1;
uniform float turbulence = 0.28;
uniform float core_radius = 0.58;
uniform float core_fill_strength = 1.0;
uniform float outer_breakup_start = 0.78;
uniform float detail_strength = 0.08;

float hash21(vec2 p) {
	p = fract(p * vec2(123.34, 456.21));
	p += dot(p, p + 34.45);
	return fract(p.x * p.y);
}

float noise2d(vec2 p) {
	vec2 i = floor(p);
	vec2 f = fract(p);
	float a = hash21(i);
	float b = hash21(i + vec2(1.0, 0.0));
	float c = hash21(i + vec2(0.0, 1.0));
	float d = hash21(i + vec2(1.0, 1.0));
	vec2 u = f * f * (3.0 - 2.0 * f);
	return mix(a, b, u.x) + (c - a) * u.y * (1.0 - u.x) + (d - b) * u.x * u.y;
}

float fbm(vec2 p) {
	float sum = 0.0;
	float amp = 0.5;
	for (int i = 0; i < 5; i++) {
		sum += noise2d(p) * amp;
		p = p * 2.03 + vec2(7.1, 3.4);
		amp *= 0.5;
	}
	return sum;
}

void fragment() {
	vec2 uv = UV * 2.0 - 1.0;
	float radius = length(uv);
	float time = time_scale * flow_speed;

	vec2 flow_uv = uv * flow_scale;
	float flow_a = fbm(flow_uv + vec2(time, -time * 0.6));
	float flow_b = fbm(flow_uv * 1.7 - vec2(time * 1.4, time * 0.4));
	float fine_a = fbm(flow_uv * 3.2 + vec2(-time * 1.8, time * 1.2));
	float fine_b = fbm(flow_uv * 4.6 - vec2(time * 1.1, time * 2.0));
	float plasma = mix(flow_a, flow_b, 0.55);
	plasma = mix(plasma, mix(fine_a, fine_b, 0.5), detail_strength);

	float breakup_mask = smoothstep(outer_breakup_start, 0.98, radius);
	float turbulence_amount = turbulence * breakup_mask;
	float bands = sin((uv.y + plasma * turbulence_amount) * 12.0 + time_scale * 0.9) * 0.5 + 0.5;
	float cells = clamp(plasma * (1.0 - band_strength * 0.55) + bands * band_strength * 0.45 * breakup_mask, 0.0, 1.0);

	float inner = smoothstep(core_radius, 0.0, radius);
	float body = smoothstep(1.0, 1.0 - max(edge_softness, 0.16), radius);
	float rim = smoothstep(0.98, 0.76, radius);
	float molten_mix = smoothstep(core_radius * 0.92, 0.92, radius);
	float outer_heat = smoothstep(0.62, 0.96, radius);

	vec3 color = mix(edge_color.rgb, mid_color.rgb, cells);
	color = mix(core_color.rgb, color, molten_mix);
	color = mix(color, mid_color.rgb, outer_heat * 0.38);
	color = mix(color, core_color.rgb, rim * 0.18);
	color = mix(color, vec3(1.0), inner * 0.12);

	float solid_core = smoothstep(core_radius + 0.08, core_radius * 0.32, radius) * core_fill_strength;
	float alpha = max(body, solid_core);
	alpha *= smoothstep(1.0, 0.92, radius) * 0.08 + 0.92;

	COLOR = vec4(color, alpha);
}
