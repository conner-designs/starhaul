extends Node

const SETTINGS_PATH := "user://settings.cfg"
const DEFAULT_SETTINGS := {
	"visuals": {
		"fullscreen": false,
		"vsync": true,
		"show_fps": false,
		"camera_zoom": 0.8,
		"brightness": 1.0,
		"screen_shake": 0.9,
		"parallax_strength": 1.0,
		"glow_strength": 1.0,
	},
	"audio": {
		"master": 1.0,
		"music": 0.82,
		"sfx": 0.92,
		"ui": 0.95,
		"engine": 0.88,
	},
	"gameplay": {
		"show_onboarding": true,
		"docking_prompt": true,
	},
}

var settings: Dictionary = {}


func _ready() -> void:
	load_settings()
	apply_window_mode()
	apply_vsync_mode()


func load_settings() -> void:
	settings = DEFAULT_SETTINGS.duplicate(true)
	var config := ConfigFile.new()
	var err := config.load(SETTINGS_PATH)
	if err != OK:
		save_settings()
		return

	for section in DEFAULT_SETTINGS.keys():
		var section_defaults: Dictionary = DEFAULT_SETTINGS[section]
		for key in section_defaults.keys():
			settings[section][key] = config.get_value(section, key, section_defaults[key])


func save_settings() -> void:
	var config := ConfigFile.new()
	for section in settings.keys():
		for key in settings[section].keys():
			config.set_value(section, key, settings[section][key])
	config.save(SETTINGS_PATH)


func get_value(section: String, key: String):
	if not settings.has(section):
		return null
	return settings[section].get(key, DEFAULT_SETTINGS.get(section, {}).get(key))


func set_value(section: String, key: String, value) -> void:
	if not settings.has(section):
		settings[section] = {}
	settings[section][key] = value
	save_settings()
	if section == "visuals":
		if key == "fullscreen":
			apply_window_mode()
		elif key == "vsync":
			apply_vsync_mode()


func apply_window_mode() -> void:
	if Engine.is_editor_hint():
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		return
	var fullscreen := bool(get_value("visuals", "fullscreen"))
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN if fullscreen else DisplayServer.WINDOW_MODE_WINDOWED)


func apply_vsync_mode() -> void:
	var vsync_enabled := bool(get_value("visuals", "vsync"))
	DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED if vsync_enabled else DisplayServer.VSYNC_DISABLED)


func combined_audio_scalar(category: String) -> float:
	var master_value: float = float(get_value("audio", "master"))
	var category_value: float = float(get_value("audio", category))
	return clampf(master_value * category_value, 0.0, 1.0)


func brightness_scalar() -> float:
	return clampf(float(get_value("visuals", "brightness")), 0.7, 1.3)


func screen_shake_scalar() -> float:
	return clampf(float(get_value("visuals", "screen_shake")), 0.0, 1.25)


func parallax_strength_scalar() -> float:
	return clampf(float(get_value("visuals", "parallax_strength")), 0.4, 1.4)


func glow_strength_scalar() -> float:
	return clampf(float(get_value("visuals", "glow_strength")), 0.0, 1.4)


func gameplay_onboarding_enabled() -> bool:
	return bool(get_value("gameplay", "show_onboarding"))


func docking_prompt_enabled() -> bool:
	return bool(get_value("gameplay", "docking_prompt"))
