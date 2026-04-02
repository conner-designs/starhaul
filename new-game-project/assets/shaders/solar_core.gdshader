shader_type canvas_item;

uniform float time_scale = 0.0;
uniform vec4 core_color : source_color = vec4(1.0, 0.78, 0.42, 1.0);
uniform vec4 hot_color : source_color = vec4(1.0, 0.95, 0.75, 1.0);
uniform vec4 mid_color : source_color = vec4(1.0, 0.48, 0.16, 1.0);
uniform vec4 edge_color : source_color = vec4(0.95, 0.18, 0.04, 1.0);

float hash21(vec2 p) {
	p = fract(p * vec2(234.34, 435.345));
	p += dot(p, p + 34.23);
	return fract(p.x * p.y);
}

float noise(vec2 p) {
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
	float value = 0.0;
	float amp = 0.5;
	for (int i = 0; i < 5; i++) {
		value += noise(p) * amp;
		p = p * 2.03 + vec2(7.2, 3.1);
		amp *= 0.5;
	}
	return value;
}

void fragment() {
	vec2 uv = UV * 2.0 - 1.0;
	float r = length(uv);
	float t = time_scale;

	vec2 flow_uv = uv * 2.2;
	flow_uv += vec2(t * 0.06, -t * 0.04);
	float flow_a = fbm(flow_uv + vec2(0.0, t * 0.12));
	float flow_b = fbm(flow_uv * 1.6 - vec2(t * 0.08, 0.0));
	float plasma = mix(flow_a, flow_b, 0.55);
	float bands = sin((uv.y + plasma * 0.24) * 16.0 + t * 0.8) * 0.5 + 0.5;
	float cells = smoothstep(0.24, 0.86, plasma * 0.75 + bands * 0.25);

	float sphere = smoothstep(1.02, 0.1, r);
	float limb = smoothstep(0.98, 0.62, r);
	float core = smoothstep(0.42, 0.0, r);

	vec3 color = mix(edge_color.rgb, mid_color.rgb, cells);
	color = mix(color, core_color.rgb, limb);
	color = mix(color, hot_color.rgb, core);

	float corona_noise = fbm(uv * 3.8 + vec2(t * 0.18, -t * 0.14));
	float corona = smoothstep(1.16, 0.72, r + corona_noise * 0.08);
	float alpha = max(sphere, corona * 0.42);
	alpha *= smoothstep(1.22, 0.0, r);

	COLOR = vec4(color, alpha);
}
