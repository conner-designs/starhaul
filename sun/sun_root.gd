@tool
extends Node2D

const BODY_SHADER := preload("res://sun/sun_body.gdshader")
const CORONA_SHADER := preload("res://sun/sun_corona.gdshader")
const FLARE_SHADER := preload("res://sun/flare_material.gdshader")

@export var body_scale: float = 260.0:
	set(value):
		body_scale = max(value, 1.0)
		_update_sprite_layout()

@export var corona_scale: float = 390.0:
	set(value):
		corona_scale = max(value, 1.0)
		_update_sprite_layout()

@export var body_core_color: Color = Color(1.0, 0.95, 0.78, 1.0)
@export var body_mid_color: Color = Color(1.0, 0.66, 0.3, 1.0)
@export var body_edge_color: Color = Color(0.96, 0.2, 0.04, 1.0)
@export_range(0.5, 8.0, 0.1) var body_flow_scale: float = 3.0
@export_range(0.01, 1.0, 0.01) var body_flow_speed: float = 0.18
@export_range(0.0, 1.0, 0.01) var body_band_strength: float = 0.3
@export_range(0.02, 0.3, 0.01) var body_edge_softness: float = 0.1
@export_range(0.0, 0.6, 0.01) var body_turbulence: float = 0.28

@export var corona_color: Color = Color(1.0, 0.72, 0.28, 0.95)
@export_range(0.1, 0.9, 0.01) var corona_inner_radius: float = 0.34
@export_range(0.2, 1.4, 0.01) var corona_outer_radius: float = 0.92
@export_range(0.5, 12.0, 0.1) var corona_noise_scale: float = 5.0
@export_range(0.01, 1.0, 0.01) var corona_noise_speed: float = 0.2
@export_range(0.0, 2.0, 0.01) var corona_strength: float = 0.9
@export_range(0.0, 0.5, 0.01) var corona_break_up: float = 0.18

@export var flare_color: Color = Color(1.0, 0.78, 0.34, 0.88)
@export_range(0, 32, 1) var max_flares: int = 8:
	set(value):
		max_flares = max(value, 0)
		_sync_flare_pool()
@export_range(0.0, 1.0, 0.01) var flare_spawn_rate: float = 0.55
@export_range(0.2, 4.0, 0.01) var flare_min_lifetime: float = 1.1
@export_range(0.2, 6.0, 0.01) var flare_max_lifetime: float = 2.8
@export_range(8.0, 90.0, 0.5) var flare_length_min: float = 24.0
@export_range(8.0, 140.0, 0.5) var flare_length_max: float = 56.0
@export_range(4.0, 80.0, 0.5) var flare_width_min: float = 10.0
@export_range(4.0, 120.0, 0.5) var flare_width_max: float = 24.0
@export_range(0.0, 24.0, 0.1) var flare_wobble_amount: float = 8.0
@export_range(0.1, 6.0, 0.01) var flare_wobble_speed: float = 1.6
@export_range(0.0, 120.0, 0.5) var flare_shell_offset: float = 14.0

var _body: Sprite2D
var _corona: Sprite2D
var _flares_root: Node2D
var _body_light: PointLight2D
var _corona_light: PointLight2D
var _time_passed: float = 0.0
var _flare_spawn_accum: float = 0.0
var _white_texture: Texture2D
var _light_texture: Texture2D
var _flare_state: Array[Dictionary] = []


func _ready() -> void:
	_ensure_structure()
	_sync_materials()
	_sync_flare_pool()
	set_process(true)


func _enter_tree() -> void:
	_ensure_structure()


func _process(delta: float) -> void:
	_time_passed += delta
	_sync_materials()
	_update_flares(delta)


func _ensure_structure() -> void:
	_white_texture = _get_or_create_white_texture()

	_body = get_node_or_null("Body") as Sprite2D
	if _body == null:
		_body = Sprite2D.new()
		_body.name = "Body"
		add_child(_body)
		if Engine.is_editor_hint():
			_body.owner = get_tree().edited_scene_root

	_corona = get_node_or_null("Corona") as Sprite2D
	if _corona == null:
		_corona = Sprite2D.new()
		_corona.name = "Corona"
		add_child(_corona)
		move_child(_corona, 0)
		if Engine.is_editor_hint():
			_corona.owner = get_tree().edited_scene_root

	_flares_root = get_node_or_null("Flares") as Node2D
	if _flares_root == null:
		_flares_root = Node2D.new()
		_flares_root.name = "Flares"
		add_child(_flares_root)
		if Engine.is_editor_hint():
			_flares_root.owner = get_tree().edited_scene_root

	_body.texture = _white_texture
	_body.centered = true
	_corona.texture = _white_texture
	_corona.centered = true
	_ensure_lights()

	_update_sprite_layout()


func _get_or_create_white_texture() -> Texture2D:
	if _white_texture != null:
		return _white_texture
	var image: Image = Image.create(2, 2, false, Image.FORMAT_RGBA8)
	image.fill(Color.WHITE)
	_white_texture = ImageTexture.create_from_image(image)
	return _white_texture


func _get_or_create_light_texture(size: int = 128) -> Texture2D:
	if _light_texture != null:
		return _light_texture
	var image: Image = Image.create(size, size, false, Image.FORMAT_RGBA8)
	var center: Vector2 = Vector2(size * 0.5, size * 0.5)
	var radius: float = size * 0.5
	for y in range(size):
		for x in range(size):
			var ratio: float = Vector2(float(x), float(y)).distance_to(center) / radius
			var alpha: float = clampf(1.0 - ratio, 0.0, 1.0)
			alpha = alpha * alpha
			image.set_pixel(x, y, Color(1.0, 1.0, 1.0, alpha))
	_light_texture = ImageTexture.create_from_image(image)
	return _light_texture


func _update_sprite_layout() -> void:
	if _body != null:
		_body.scale = Vector2(body_scale, body_scale)
	if _corona != null:
		_corona.scale = Vector2(corona_scale, corona_scale)
	if _body_light != null:
		_body_light.texture_scale = body_scale / 180.0
	if _corona_light != null:
		_corona_light.texture_scale = corona_scale / 170.0


func _ensure_lights() -> void:
	_body_light = get_node_or_null("BodyLight") as PointLight2D
	if _body_light == null:
		_body_light = PointLight2D.new()
		_body_light.name = "BodyLight"
		_body_light.texture = _get_or_create_light_texture()
		_body_light.shadow_enabled = false
		add_child(_body_light)
		move_child(_body_light, 0)
		if Engine.is_editor_hint():
			_body_light.owner = get_tree().edited_scene_root

	_corona_light = get_node_or_null("CoronaLight") as PointLight2D
	if _corona_light == null:
		_corona_light = PointLight2D.new()
		_corona_light.name = "CoronaLight"
		_corona_light.texture = _get_or_create_light_texture()
		_corona_light.shadow_enabled = false
		add_child(_corona_light)
		move_child(_corona_light, 0)
		if Engine.is_editor_hint():
			_corona_light.owner = get_tree().edited_scene_root


func _sync_materials() -> void:
	if _body == null or _corona == null:
		return

	var body_material: ShaderMaterial = _body.material as ShaderMaterial
	if body_material == null:
		body_material = ShaderMaterial.new()
		body_material.shader = BODY_SHADER
		_body.material = body_material
	body_material.set_shader_parameter("time_scale", _time_passed)
	body_material.set_shader_parameter("core_color", body_core_color)
	body_material.set_shader_parameter("mid_color", body_mid_color)
	body_material.set_shader_parameter("edge_color", body_edge_color)
	body_material.set_shader_parameter("flow_scale", body_flow_scale)
	body_material.set_shader_parameter("flow_speed", body_flow_speed)
	body_material.set_shader_parameter("band_strength", body_band_strength)
	body_material.set_shader_parameter("edge_softness", body_edge_softness)
	body_material.set_shader_parameter("turbulence", body_turbulence)

	var corona_material: ShaderMaterial = _corona.material as ShaderMaterial
	if corona_material == null:
		corona_material = ShaderMaterial.new()
		corona_material.shader = CORONA_SHADER
		_corona.material = corona_material
	corona_material.set_shader_parameter("time_scale", _time_passed)
	corona_material.set_shader_parameter("corona_color", corona_color)
	corona_material.set_shader_parameter("inner_radius", corona_inner_radius)
	corona_material.set_shader_parameter("outer_radius", corona_outer_radius)
	corona_material.set_shader_parameter("noise_scale", corona_noise_scale)
	corona_material.set_shader_parameter("noise_speed", corona_noise_speed)
	corona_material.set_shader_parameter("corona_strength", corona_strength)
	corona_material.set_shader_parameter("break_up", corona_break_up)
	if _body_light != null:
		_body_light.color = body_core_color.lerp(corona_color, 0.25)
		_body_light.energy = 0.55
	if _corona_light != null:
		_corona_light.color = corona_color
		_corona_light.energy = 0.28


func _sync_flare_pool() -> void:
	if _flares_root == null:
		return

	while _flare_state.size() < max_flares:
		var flare: Polygon2D = Polygon2D.new()
		flare.polygon = PackedVector2Array([Vector2.ZERO, Vector2.ZERO, Vector2.ZERO])
		flare.visible = false
		_flares_root.add_child(flare)
		if Engine.is_editor_hint():
			flare.owner = get_tree().edited_scene_root
		var flare_material: ShaderMaterial = ShaderMaterial.new()
		flare_material.shader = FLARE_SHADER
		flare.material = flare_material
		_flare_state.append({
			"node": flare,
			"active": false,
			"life": 0.0,
			"age": 0.0,
			"angle": 0.0,
			"length": flare_length_min,
			"width": flare_width_min,
			"wobble_offset": 0.0,
			"wobble_speed": flare_wobble_speed,
		})

	while _flare_state.size() > max_flares:
		var state: Dictionary = _flare_state.pop_back()
		var flare_node: Polygon2D = state["node"] as Polygon2D
		if flare_node != null:
			flare_node.queue_free()


func _update_flares(delta: float) -> void:
	if max_flares <= 0:
		return

	_flare_spawn_accum += delta * flare_spawn_rate
	if _flare_spawn_accum >= 1.0:
		var spawn_count: int = int(floor(_flare_spawn_accum))
		_flare_spawn_accum -= float(spawn_count)
		for _i in range(spawn_count):
			_spawn_flare()

	for state in _flare_state:
		if not bool(state["active"]):
			continue
		var flare_node: Polygon2D = state["node"] as Polygon2D
		if flare_node == null:
			continue
		state["age"] = float(state["age"]) + delta
		var life: float = max(float(state["life"]), 0.001)
		if float(state["age"]) >= life:
			state["active"] = false
			flare_node.visible = false
			continue

		var life_t: float = clampf(float(state["age"]) / life, 0.0, 1.0)
		var base_angle: float = float(state["angle"])
		var wobble_phase: float = float(state["wobble_offset"]) + _time_passed * float(state["wobble_speed"])
		var wobble: float = sin(wobble_phase) * flare_wobble_amount
		var render_angle: float = base_angle + deg_to_rad(wobble)
		var length: float = float(state["length"])
		var width: float = float(state["width"])
		var base_radius: float = body_scale + flare_shell_offset

		flare_node.visible = true
		flare_node.rotation = render_angle
		flare_node.position = Vector2.RIGHT.rotated(render_angle) * (base_radius * 0.5)
		flare_node.polygon = PackedVector2Array([
			Vector2(0.0, -width * 0.5),
			Vector2(length, 0.0),
			Vector2(0.0, width * 0.5),
		])

		var flare_material: ShaderMaterial = flare_node.material as ShaderMaterial
		if flare_material != null:
			flare_material.set_shader_parameter("life_t", life_t)
			flare_material.set_shader_parameter("wobble", wobble_phase)
			flare_material.set_shader_parameter("flare_color", flare_color)
			flare_material.set_shader_parameter("edge_fade", 1.0 - life_t * 0.35)


func _spawn_flare() -> void:
	for state in _flare_state:
		if bool(state["active"]):
			continue
		state["active"] = true
		state["age"] = 0.0
		state["life"] = randf_range(flare_min_lifetime, flare_max_lifetime)
		state["angle"] = randf_range(0.0, TAU)
		state["length"] = randf_range(flare_length_min, flare_length_max)
		state["width"] = randf_range(flare_width_min, flare_width_max)
		state["wobble_offset"] = randf_range(0.0, TAU)
		state["wobble_speed"] = randf_range(flare_wobble_speed * 0.75, flare_wobble_speed * 1.35)
		return
