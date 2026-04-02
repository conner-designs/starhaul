extends Area2D

const THRUSTER_MOVE_SOUND := preload("res://assets/audio/sounds/thrusters_move.wav")
const THRUSTER_BOOST_SOUND := preload("res://assets/audio/sounds/thrusters_boost.wav")

@onready var camera: Camera2D = $Camera2D
@onready var ship_sprite: Sprite2D = $ShipSprite
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

@export var use_manual_thruster_sockets := false
@export var manual_thruster_sockets: Array[Vector2] = [Vector2(-42, -12), Vector2(-42, 12)]

var base_speed := 300.0
var base_acceleration := 650.0
var drift_decay := 500.0
var boost_multiplier := 1.55
var low_fuel_multiplier := 0.68

var velocity := Vector2.ZERO
var thrusting := false
var controls_enabled := true
var boost_active := false
var fuel_limited := false
var engine_time := 0.0
var autopilot_active := false
var autopilot_target := Vector2.ZERO
var autopilot_top_speed := 220.0
var autopilot_min_speed := 80.0
var autopilot_mode := ""
var screen_shake_scalar := 0.9
var camera_shake_trauma := 0.0
var thruster_move_player: AudioStreamPlayer
var thruster_boost_player: AudioStreamPlayer
var thruster_sockets: Array[Vector2] = []
var engine_light: PointLight2D
var cabin_light: PointLight2D


func settings_manager() -> Node:
	return get_node_or_null("/root/SettingsManager")


func _ready() -> void:
	camera.enabled = true
	update_ship_visual_profile()
	setup_lighting()
	if DisplayServer.get_name() == "headless":
		return
	thruster_move_player = AudioStreamPlayer.new()
	thruster_move_player.stream = THRUSTER_MOVE_SOUND
	thruster_move_player.bus = "Master"
	add_child(thruster_move_player)

	thruster_boost_player = AudioStreamPlayer.new()
	thruster_boost_player.stream = THRUSTER_BOOST_SOUND
	thruster_boost_player.bus = "Master"
	add_child(thruster_boost_player)
	apply_audio_settings()


func _physics_process(delta: float) -> void:
	engine_time += delta
	if autopilot_active:
		var to_target: Vector2 = autopilot_target - global_position
		var distance := to_target.length()
		if distance <= 8.0:
			global_position = autopilot_target
			velocity = Vector2.ZERO
			autopilot_active = false
			autopilot_mode = ""
			queue_redraw()
			return

		var direction := to_target.normalized()
		rotation = direction.angle()
		velocity = direction * min(autopilot_top_speed, max(distance * 3.4, autopilot_min_speed))
		position += velocity * delta
		thrusting = true
		boost_active = false
		update_thruster_audio()
		update_camera_effects(delta)
		queue_redraw()
		return

	var input_vector := Vector2.ZERO
	var facing_direction := Vector2.RIGHT
	if controls_enabled:
		facing_direction = (get_global_mouse_position() - global_position).normalized()
		if facing_direction == Vector2.ZERO:
			facing_direction = Vector2.RIGHT
		rotation = facing_direction.angle()

		var forward_axis: float = Input.get_action_strength("move_up") - Input.get_action_strength("move_down")
		var strafe_axis: float = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
		var strafe_direction := -facing_direction.orthogonal()
		var reverse_scale := 0.68 if forward_axis < 0.0 else 1.0
		input_vector = (facing_direction * forward_axis * reverse_scale) + (strafe_direction * strafe_axis)
		if input_vector.length() > 1.0:
			input_vector = input_vector.normalized()
	thrusting = input_vector.length() > 0.05

	var speed_multiplier := 1.0
	if boost_active and thrusting:
		speed_multiplier *= boost_multiplier
	if fuel_limited:
		speed_multiplier *= low_fuel_multiplier

	if thrusting:
		var desired_velocity := input_vector.normalized() * (base_speed * speed_multiplier)
		velocity = velocity.move_toward(desired_velocity, (base_acceleration * speed_multiplier) * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, drift_decay * delta)

	position += velocity * delta

	update_thruster_audio()
	update_camera_effects(delta)
	queue_redraw()


func configure(engine_speed: float, engine_acceleration: float) -> void:
	base_speed = engine_speed
	base_acceleration = engine_acceleration


func update_ship_visual_profile() -> void:
	if ship_sprite == null or ship_sprite.texture == null:
		thruster_sockets = [Vector2(-24, 0)]
		return

	var sprite_size: Vector2 = ship_sprite.texture.get_size() * ship_sprite.scale.abs()
	var half_width := sprite_size.x * 0.5
	var half_height := sprite_size.y * 0.5

	if collision_shape != null:
		var shape := collision_shape.shape
		if shape is CircleShape2D:
			var circle := shape as CircleShape2D
			circle.radius = max(half_width * 0.38, half_height * 0.5)

	if use_manual_thruster_sockets and not manual_thruster_sockets.is_empty():
		thruster_sockets = manual_thruster_sockets.duplicate()
		return

	var rear_x: float = -half_width * 0.84
	var vertical_offset: float = max(half_height * 0.3, 8.0)
	if sprite_size.y >= 52.0:
		thruster_sockets = [Vector2(rear_x, -vertical_offset), Vector2(rear_x, vertical_offset)]
	else:
		thruster_sockets = [Vector2(rear_x, 0.0)]
	update_light_layout()


func setup_lighting() -> void:
	engine_light = PointLight2D.new()
	engine_light.name = "EngineLight"
	engine_light.texture = make_light_texture()
	engine_light.color = Color(1.0, 0.54, 0.22, 1.0)
	engine_light.energy = 0.0
	engine_light.texture_scale = 0.6
	engine_light.height = 0.0
	engine_light.shadow_enabled = false
	add_child(engine_light)

	cabin_light = PointLight2D.new()
	cabin_light.name = "CabinLight"
	cabin_light.texture = make_light_texture()
	cabin_light.color = Color(0.56, 0.9, 1.0, 1.0)
	cabin_light.energy = 0.35
	cabin_light.texture_scale = 0.26
	cabin_light.height = 0.0
	cabin_light.shadow_enabled = false
	add_child(cabin_light)
	update_light_layout()


func make_light_texture(size: int = 128) -> Texture2D:
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


func update_light_layout() -> void:
	if engine_light != null:
		var average_socket: Vector2 = Vector2.ZERO
		if not thruster_sockets.is_empty():
			for socket in thruster_sockets:
				average_socket += socket
			average_socket /= float(thruster_sockets.size())
		engine_light.position = average_socket + Vector2(-8.0, 0.0)
	if cabin_light != null and ship_sprite != null and ship_sprite.texture != null:
		var sprite_size: Vector2 = ship_sprite.texture.get_size() * ship_sprite.scale.abs()
		cabin_light.position = Vector2(sprite_size.x * 0.08, -sprite_size.y * 0.04)


func set_controls_enabled(enabled: bool) -> void:
	controls_enabled = enabled


func set_boost_active(active: bool) -> void:
	if autopilot_active:
		boost_active = false
		return
	boost_active = active


func set_fuel_limited(active: bool) -> void:
	fuel_limited = active


func force_stop() -> void:
	velocity = Vector2.ZERO
	thrusting = false
	autopilot_active = false
	autopilot_mode = ""
	stop_thruster_audio()


func launch_to(target_position: Vector2) -> void:
	autopilot_target = target_position
	autopilot_active = true
	autopilot_mode = "launch"
	autopilot_top_speed = 260.0
	autopilot_min_speed = 90.0
	velocity = Vector2.ZERO


func dock_to(target_position: Vector2) -> void:
	autopilot_target = target_position
	autopilot_active = true
	autopilot_mode = "dock"
	autopilot_top_speed = 170.0
	autopilot_min_speed = 55.0
	velocity = Vector2.ZERO


func is_launching() -> bool:
	return autopilot_active and autopilot_mode == "launch"


func is_autopilot_active() -> bool:
	return autopilot_active


func reset_camera_to_ship() -> void:
	if camera == null:
		return
	camera.offset = Vector2.ZERO
	camera.reset_smoothing()


func stop_thruster_audio() -> void:
	if thruster_move_player != null and thruster_move_player.is_inside_tree():
		thruster_move_player.stop()
	if thruster_boost_player != null and thruster_boost_player.is_inside_tree():
		thruster_boost_player.stop()


func update_thruster_audio() -> void:
	if thruster_move_player == null or thruster_boost_player == null:
		return
	if not thrusting:
		stop_thruster_audio()
		update_light_energy()
		return
	if boost_active:
		if thruster_move_player.playing:
			thruster_move_player.stop()
		if not thruster_boost_player.playing:
			thruster_boost_player.play()
		update_light_energy()
		return
	if thruster_boost_player.playing:
		thruster_boost_player.stop()
	if not thruster_move_player.playing:
		thruster_move_player.play()
	update_light_energy()


func update_light_energy() -> void:
	if engine_light != null:
		if not thrusting:
			engine_light.energy = 0.0
		elif boost_active:
			engine_light.color = Color(0.44, 0.9, 1.0, 1.0)
			engine_light.texture_scale = 0.82
			engine_light.energy = 1.1
		elif fuel_limited:
			engine_light.color = Color(1.0, 0.42, 0.18, 1.0)
			engine_light.texture_scale = 0.48
			engine_light.energy = 0.42
		else:
			engine_light.color = Color(1.0, 0.56, 0.24, 1.0)
			engine_light.texture_scale = 0.62
			engine_light.energy = 0.68
	if cabin_light != null:
		cabin_light.energy = 0.28 + 0.08 * (0.5 + 0.5 * sin(engine_time * 1.7))


func apply_audio_settings() -> void:
	var settings := settings_manager()
	if settings == null:
		return
	var engine_scalar: float = float(settings.combined_audio_scalar("engine"))
	if thruster_move_player != null and thruster_move_player.is_inside_tree():
		thruster_move_player.volume_db = -7.0 + linear_to_db(max(engine_scalar, 0.001))
	if thruster_boost_player != null and thruster_boost_player.is_inside_tree():
		thruster_boost_player.volume_db = -5.5 + linear_to_db(max(engine_scalar, 0.001))


func set_screen_shake_scalar(value: float) -> void:
	screen_shake_scalar = clampf(value, 0.0, 1.25)
	if screen_shake_scalar <= 0.0 and camera != null:
		camera.offset = Vector2.ZERO


func add_camera_shake(amount: float) -> void:
	if screen_shake_scalar <= 0.0:
		return
	camera_shake_trauma = clampf(camera_shake_trauma + amount * screen_shake_scalar, 0.0, 1.4)


func update_camera_effects(delta: float) -> void:
	if camera == null:
		return
	if camera_shake_trauma <= 0.0 or screen_shake_scalar <= 0.0:
		camera.offset = Vector2.ZERO
		return
	camera_shake_trauma = max(camera_shake_trauma - delta * 2.7, 0.0)
	var intensity: float = camera_shake_trauma * camera_shake_trauma
	camera.offset = Vector2(
		sin(engine_time * 39.0),
		cos(engine_time * 31.0)
	) * (10.0 * intensity * screen_shake_scalar)


func _draw() -> void:
	if not thrusting:
		return

	var pulse := 0.88 + 0.12 * sin(engine_time * (15.0 if boost_active else 9.0))
	var outer_color := Color(1.0, 0.45, 0.16, 0.22)
	var inner_color := Color(1.0, 0.78, 0.46, 0.94)
	var core_color := Color(1.0, 0.96, 0.82, 0.95)
	if boost_active:
		outer_color = Color(0.34, 0.86, 1.0, 0.28)
		inner_color = Color(0.54, 0.92, 1.0, 0.96)
		core_color = Color(0.94, 1.0, 1.0, 0.98)
	elif fuel_limited:
		outer_color = Color(1.0, 0.34, 0.12, 0.16)
		inner_color = Color(1.0, 0.56, 0.28, 0.74)

	var outer_length := (-52.0 if boost_active else -40.0) * pulse
	var inner_length := (-36.0 if boost_active else -28.0) * pulse
	var exhaust_width := 10.0 if boost_active else 7.5
	var core_width := 3.1 if boost_active else 2.6
	var glow_radius := 11.0 if boost_active else 8.5

	for socket in thruster_sockets:
		draw_circle(socket + Vector2(-2, 0), glow_radius, outer_color)
		draw_colored_polygon(
			PackedVector2Array([
				socket + Vector2(0, exhaust_width),
				socket + Vector2(outer_length, 0),
				socket + Vector2(0, -exhaust_width),
			]),
			outer_color
		)
		draw_colored_polygon(
			PackedVector2Array([
				socket + Vector2(-2, 5.4),
				socket + Vector2(inner_length, 0),
				socket + Vector2(-2, -5.4),
			]),
			inner_color
		)
		draw_colored_polygon(
			PackedVector2Array([
				socket + Vector2(-2, core_width),
				socket + Vector2(inner_length * 0.62, 0),
				socket + Vector2(-2, -core_width),
			]),
			core_color
		)

		if boost_active:
			draw_arc(socket + Vector2(-4, 0), 15.0, -0.52, 0.52, 18, Color(0.48, 0.9, 1.0, 0.38), 2.0)
