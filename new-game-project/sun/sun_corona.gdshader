shader_type canvas_item;

uniform float time_scale = 0.0;
uniform vec4 corona_color : source_color = vec4(1.0, 0.72, 0.28, 1.0);
uniform float inner_radius = 0.34;
uniform float outer_radius = 0.92;
uniform float noise_scale = 5.0;
uniform float noise_speed = 0.2;
uniform float corona_strength = 0.9;
uniform float break_up = 0.18;

float hash21(vec2 p) {
	p = fract(p * vec2(234.56, 345.67));
	p += dot(p, p + 45.32);
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
	for (int i = 0; i < 4; i++) {
		sum += noise2d(p) * amp;
		p = p * 2.1 + vec2(2.5, 6.4);
		amp *= 0.5;
	}
	return sum;
}

void fragment() {
	vec2 uv = UV * 2.0 - 1.0;
	float radius = length(uv);
	float time = time_scale * noise_speed;
	float corona_noise = fbm(uv * noise_scale + vec2(time, -time * 0.8));
	float noisy_radius = radius + (corona_noise - 0.5) * break_up;

	float outer = smoothstep(outer_radius, inner_radius, noisy_radius);
	float inner_hole = smoothstep(inner_radius, inner_radius - 0.08, noisy_radius);
	float ring = clamp(outer - inner_hole, 0.0, 1.0);
	float alpha = ring * corona_strength * (1.0 - smoothstep(inner_radius, outer_radius, radius));

	COLOR = vec4(corona_color.rgb, alpha * corona_color.a);
}
