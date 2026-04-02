extends Area2D

const DERELICT_TEXTURES := [
	preload("res://assets/objects/derelict_ship_01.png"),
	preload("res://assets/objects/derelict_ship_02.png"),
]

var asteroid_polygon := PackedVector2Array([0, -30, 24, -16, 30, 8, 16, 28, -10, 30, -28, 10, -22, -14])
var crystal_polygon := PackedVector2Array([0, -34, 10, -18, 18, -10, 24, 8, 10, 30, -2, 34, -14, 18, -20, -2, -10, -20])
var crystal_accent_polygon := PackedVector2Array([0, -20, 6, -10, 10, 4, 4, 18, -4, 20, -10, 8, -8, -8])
var derelict_polygon := PackedVector2Array([24, 0, 10, 12, -18, 14, -30, 4, -24, -4, -10, -10, 6, -12])
var derelict_accent_polygon := PackedVector2Array([16, 0, 4, 8, -14, 8, -20, 0, -14, -8, 4, -8])
var derelict_bridge_polygon := PackedVector2Array([8, 0, 0, 5, -10, 4, -14, 0, -10, -4, 0, -5])
var derelict_spine_polygon := PackedVector2Array([10, -2, -16, -2, -16, 2, 10, 2])

@export var resource_type: StringName = &"ore"
@export var resource_label := "Raw Ore"
@export var max_amount := 10
@export var gather_interval := 0.9

var remaining_amount := 10
var gather_progress := 0.0
var rng := RandomNumberGenerator.new()
var size_multiplier := 1.0
var node_name := "Ore Asteroid"
var rare_resource: StringName = &""
var rare_label := ""
var rare_chance := 0.0
var scan_description := ""
var body_color := Color(0.58, 0.66, 0.76)
var node_texture: Texture2D
var texture_scale_bonus := 1.0
var texture_tint := Color(1.0, 1.0, 1.0, 1.0)
var trait_name := ""
var trait_description := ""
var required_mining_stage := 0
var extraction_hint := ""
var is_derelict_ship := false
var mission_derelict_tag := ""
var derelict_profile_id := ""
var derelict_profile_name := ""
var salvage_phase := 0
var derelict_cache_opened := false
var forced_rare_drop := false
var drift_phase := 0.0
var drift_speed := 0.0
var rotation_speed := 0.0
var base_visual_offset := Vector2.ZERO
var visual_ratio := 1.0
var derelict_texture: Texture2D
var bridge_light: PointLight2D
var salvage_light: PointLight2D


func _ready() -> void:
	rng.randomize()
	derelict_texture = pick_derelict_texture()
	setup_lighting()
	drift_phase = rng.randf_range(0.0, TAU)
	drift_speed = rng.randf_range(0.45, 0.9)
	rotation_speed = rng.randf_range(-0.22, 0.22)
	remaining_amount = max_amount
	update_visuals()


func _process(delta: float) -> void:
	drift_phase += delta * drift_speed
	rotation += rotation_speed * delta
	var drift_offset := Vector2(0.0, sin(drift_phase) * 2.8)
	$Body.position = base_visual_offset + drift_offset
	$Accent.position = base_visual_offset + drift_offset
	$Bridge.position = base_visual_offset + drift_offset
	$Spine.position = base_visual_offset + drift_offset
	$Sprite2D.position = base_visual_offset + drift_offset
	if bridge_light != null:
		bridge_light.position = base_visual_offset + drift_offset + Vector2(24.0 * size_multiplier, -4.0 * size_multiplier)
	if salvage_light != null:
		salvage_light.position = base_visual_offset + drift_offset + Vector2(-18.0 * size_multiplier, 8.0 * size_multiplier)
	var alpha_scale := visual_ratio
	if rare_chance >= 0.12:
		alpha_scale *= 0.92 + 0.12 * (0.5 + 0.5 * sin(drift_phase * 2.2))
	if node_texture != null:
		$Sprite2D.modulate = Color(texture_tint.r, texture_tint.g, texture_tint.b, alpha_scale * texture_tint.a)
		$Accent.modulate = Color(1.0, 1.0, 1.0, alpha_scale)
		$Bridge.modulate = Color(1.0, 1.0, 1.0, alpha_scale)
		$Spine.modulate = Color(1.0, 1.0, 1.0, alpha_scale)
	else:
		$Body.modulate = Color(1.0, 1.0, 1.0, alpha_scale)
		$Accent.modulate = Color(1.0, 1.0, 1.0, alpha_scale)
		$Bridge.modulate = Color(1.0, 1.0, 1.0, alpha_scale)
		$Spine.modulate = Color(1.0, 1.0, 1.0, alpha_scale)
	update_light_state()


func configure(config: Dictionary) -> void:
	resource_type = config.get("primary_resource", resource_type)
	resource_label = config.get("primary_label", resource_label)
	max_amount = int(config.get("amount", max_amount))
	remaining_amount = max_amount
	gather_interval = float(config.get("interval", gather_interval))
	size_multiplier = float(config.get("scale_multiplier", size_multiplier))
	node_name = config.get("node_name", node_name)
	rare_resource = config.get("rare_resource", rare_resource)
	rare_label = config.get("rare_label", rare_label)
	rare_chance = float(config.get("rare_chance", rare_chance))
	scan_description = config.get("scan_description", scan_description)
	body_color = config.get("body_color", body_color)
	node_texture = config.get("texture", node_texture)
	texture_scale_bonus = float(config.get("texture_scale_bonus", texture_scale_bonus))
	texture_tint = config.get("texture_tint", texture_tint)
	trait_name = config.get("trait_name", trait_name)
	trait_description = config.get("trait_description", trait_description)
	required_mining_stage = int(config.get("required_mining_stage", required_mining_stage))
	extraction_hint = str(config.get("extraction_hint", extraction_hint))
	is_derelict_ship = bool(config.get("is_derelict_ship", false))
	mission_derelict_tag = str(config.get("mission_derelict_tag", mission_derelict_tag))
	derelict_profile_id = str(config.get("derelict_profile_id", derelict_profile_id))
	derelict_profile_name = str(config.get("derelict_profile_name", derelict_profile_name))
	forced_rare_drop = bool(config.get("forced_rare_drop", forced_rare_drop))
	if is_derelict_ship:
		derelict_texture = pick_derelict_texture()
	salvage_phase = 0
	derelict_cache_opened = false
	z_index = 3 if is_derelict_ship else 0
	update_collision_shape()
	base_visual_offset = Vector2.ZERO
	update_visuals()
	update_light_state()


func setup_lighting() -> void:
	bridge_light = PointLight2D.new()
	bridge_light.name = "BridgeLight"
	bridge_light.texture = make_light_texture()
	bridge_light.color = Color(0.52, 0.88, 1.0, 1.0)
	bridge_light.energy = 0.0
	bridge_light.texture_scale = 0.28
	bridge_light.shadow_enabled = false
	add_child(bridge_light)

	salvage_light = PointLight2D.new()
	salvage_light.name = "SalvageLight"
	salvage_light.texture = make_light_texture()
	salvage_light.color = Color(1.0, 0.64, 0.34, 1.0)
	salvage_light.energy = 0.0
	salvage_light.texture_scale = 0.22
	salvage_light.shadow_enabled = false
	add_child(salvage_light)


func make_light_texture(size: int = 96) -> Texture2D:
	var image: Image = Image.create(size, size, false, Image.FORMAT_RGBA8)
	var center: Vector2 = Vector2(size * 0.5, size * 0.5)
	var radius: float = size * 0.5
	for y in range(size):
		for x in range(size):
			var distance_ratio: float = Vector2(float(x), float(y)).distance_to(center) / radius
			var alpha: float = clampf(1.0 - distance_ratio, 0.0, 1.0)
			alpha = alpha * alpha
			image.set_pixel(x, y, Color(1.0, 1.0, 1.0, alpha))
	return ImageTexture.create_from_image(image)


func update_light_state() -> void:
	if bridge_light == null or salvage_light == null:
		return
	if is_derelict_ship:
		bridge_light.color = Color(0.52, 0.88, 1.0, 1.0)
		salvage_light.color = Color(1.0, 0.64, 0.34, 1.0)
		bridge_light.energy = 0.34 + 0.1 * (0.5 + 0.5 * sin(drift_phase * 1.9))
		bridge_light.texture_scale = 0.32 * size_multiplier
		salvage_light.energy = 0.16 + 0.06 * (0.5 + 0.5 * sin(drift_phase * 2.6 + 1.2))
		salvage_light.texture_scale = 0.24 * size_multiplier
	elif resource_type == &"crystal":
		bridge_light.color = Color(0.66, 0.96, 1.0, 1.0)
		bridge_light.energy = 0.18 + 0.06 * (0.5 + 0.5 * sin(drift_phase * 2.1))
		bridge_light.texture_scale = 0.22 * size_multiplier
		salvage_light.energy = 0.0
	else:
		bridge_light.energy = 0.0
		salvage_light.energy = 0.0


func pick_derelict_texture() -> Texture2D:
	if DERELICT_TEXTURES.is_empty():
		return create_derelict_placeholder_texture()
	return DERELICT_TEXTURES[rng.randi_range(0, DERELICT_TEXTURES.size() - 1)]


func update_collision_shape() -> void:
	if is_derelict_ship and derelict_texture != null:
		var rect := RectangleShape2D.new()
		var collision_scale := size_multiplier * 0.68
		rect.size = Vector2(
			derelict_texture.get_width() * collision_scale * 0.52,
			derelict_texture.get_height() * collision_scale * 0.42
		)
		$CollisionShape2D.shape = rect
		return

	var circle := CircleShape2D.new()
	circle.radius = 28.0 * size_multiplier
	$CollisionShape2D.shape = circle


func harvest(delta: float, mining_power: float, free_space: int, bonus_yield_chance: float) -> Dictionary:
	if remaining_amount <= 0 or free_space <= 0:
		return {}

	gather_progress += delta * mining_power
	if gather_progress < gather_interval:
		return {}

	gather_progress = 0.0

	var amount: int = 1
	var drop_type: StringName = resource_type
	var drop_label := resource_label
	var rare_drop := rare_resource != StringName() and (forced_rare_drop or rng.randf() < rare_chance)
	if rare_drop:
		drop_type = rare_resource
		drop_label = rare_label
		forced_rare_drop = false
	elif rng.randf() < bonus_yield_chance and remaining_amount > amount and free_space > amount:
		amount += 1

	remaining_amount -= amount
	update_visuals()

	if remaining_amount <= 0:
		queue_free()

	return {
		"type": drop_type,
		"label": drop_label,
		"amount": amount,
		"rare": rare_drop,
		"node_name": node_name,
		"depleted": remaining_amount <= 0,
	}


func update_visuals() -> void:
	visual_ratio = clamp(float(remaining_amount) / max(float(max_amount), 1.0), 0.35, 1.0)
	if is_derelict_ship:
		$Sprite2D.visible = true
		$Body.visible = false
		$Accent.visible = false
		$Bridge.visible = false
		$Spine.visible = false
		$Sprite2D.texture = derelict_texture
		$Sprite2D.scale = Vector2.ONE * size_multiplier * 0.68
		$Sprite2D.modulate = Color(1.0, 1.0, 1.0, visual_ratio)
	elif node_texture != null:
		$Sprite2D.visible = true
		$Body.visible = false
		$Accent.visible = false
		$Bridge.visible = false
		$Spine.visible = false
		$Sprite2D.texture = node_texture
		$Sprite2D.scale = Vector2.ONE * size_multiplier * texture_scale_bonus
		$Sprite2D.modulate = Color(texture_tint.r, texture_tint.g, texture_tint.b, visual_ratio * texture_tint.a)
	else:
		$Sprite2D.visible = false
		$Body.visible = true
		var crystal_mode := resource_type == &"crystal"
		$Accent.visible = is_derelict_ship or crystal_mode
		$Bridge.visible = is_derelict_ship
		$Spine.visible = is_derelict_ship
		$Body.color = body_color
		if is_derelict_ship:
			$Body.polygon = derelict_polygon
		elif crystal_mode:
			$Body.polygon = crystal_polygon
		else:
			$Body.polygon = asteroid_polygon
		$Body.scale = Vector2.ONE * size_multiplier
		$Body.modulate = Color(1.0, 1.0, 1.0, visual_ratio)
		$Accent.polygon = derelict_accent_polygon if is_derelict_ship else crystal_accent_polygon
		$Accent.scale = Vector2.ONE * size_multiplier * (0.92 if is_derelict_ship else 0.88)
		$Accent.color = Color(0.94, 0.8, 0.58, 0.95) if is_derelict_ship else Color(0.86, 0.98, 1.0, 0.95)
		$Accent.modulate = Color(1.0, 1.0, 1.0, visual_ratio)
		$Bridge.polygon = derelict_bridge_polygon
		$Bridge.scale = Vector2.ONE * size_multiplier * 0.78
		$Bridge.color = Color(0.46, 0.84, 1.0, 0.95)
		$Bridge.modulate = Color(1.0, 1.0, 1.0, visual_ratio)
		$Spine.polygon = derelict_spine_polygon
		$Spine.scale = Vector2.ONE * size_multiplier * 0.96
		$Spine.color = Color(0.24, 0.16, 0.12, 0.95)
		$Spine.modulate = Color(1.0, 1.0, 1.0, visual_ratio)


func create_derelict_placeholder_texture() -> Texture2D:
	var image := Image.create(160, 96, false, Image.FORMAT_RGBA8)
	image.fill(Color(0.0, 0.0, 0.0, 0.0))

	var hull := Color(0.74, 0.56, 0.42, 1.0)
	var plate := Color(0.95, 0.8, 0.58, 1.0)
	var bridge := Color(0.42, 0.84, 1.0, 1.0)
	var spine := Color(0.18, 0.12, 0.1, 1.0)
	var damage := Color(0.98, 0.52, 0.24, 0.95)

	for y in range(34, 62):
		for x in range(24, 136):
			image.set_pixel(x, y, hull)

	for y in range(28, 68):
		for x in range(52, 108):
			image.set_pixel(x, y, plate)

	for y in range(38, 58):
		for x in range(42, 118):
			image.set_pixel(x, y, spine)

	for y in range(30, 48):
		for x in range(86, 126):
			image.set_pixel(x, y, bridge)

	for y in range(20, 76):
		var wing_offset: int = int(abs(48 - y) / 2)
		for x in range(int(12 + wing_offset), 34):
			image.set_pixel(x, y, hull)
		for x in range(126, int(148 - wing_offset)):
			image.set_pixel(x, y, hull)

	for y in range(42, 54):
		for x in range(18, 30):
			image.set_pixel(x, y, damage)
		for x in range(130, 142):
			image.set_pixel(x, y, damage)

	return ImageTexture.create_from_image(image)
