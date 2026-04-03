extends Control

const GAME_SCENE_PATH := "res://main.tscn"
const MENU_MUSIC := preload("res://assets/audio/music/Menu_Music.ogg")
const UI_CLICK_SOUND := preload("res://assets/audio/sounds/ui_click_confirm.wav")
const TITLE_LOGO_SPRITE_SHEET := preload("res://assets/icons/Title_logo_sprite_sheet_01.png")
const MENU_PLAYER_SHIP_TEXTURES := [
	preload("res://assets/player/ship_01.png"),
	preload("res://assets/player/ship_02.png"),
]
const MENU_FAR_SHIP_TEXTURES := [
	preload("res://assets/objects/ships/freighter_ship_01.png"),
	preload("res://assets/objects/ships/ship_01.png"),
]
const MENU_DEBRIS_TEXTURES := [
	preload("res://assets/objects/astroid_iron_01.png"),
	preload("res://assets/objects/astroid_iron_02.png"),
]
const TITLE_LOGO_FRAME_COUNT := 4
const MENU_STARFIELD_SPAN := Vector2(2200.0, 1320.0)
const SPLASH_STEPS := [
	{"title": "STARHAUL", "subtitle": "A frontier systems build"},
	{"title": "PROSPECTOR DIVISION", "subtitle": "Clearance granted for launch | Playtest update 0.1.3"},
]
const TITLE_LOGO_FRAME_DURATION := 0.28

@onready var canvas_modulate: CanvasModulate = $CanvasModulate
@onready var menu_starfield_layer: Control = $MenuStarfield
@onready var splash_panel: PanelContainer = $SplashPanel
@onready var splash_title: Label = $SplashPanel/SplashMargin/SplashVBox/SplashTitle
@onready var splash_subtitle: Label = $SplashPanel/SplashMargin/SplashVBox/SplashSubtitle
@onready var title_panel: PanelContainer = $TitlePanel
@onready var title_label: Label = $TitlePanel/TitleMargin/TitleVBox/TitleLabel
@onready var title_logo: TextureRect = $TitlePanel/TitleMargin/TitleVBox/TitleLogo
@onready var new_game_button: Button = $TitlePanel/TitleMargin/TitleVBox/MenuButtons/NewGameButton
@onready var load_menu_button: Button = $TitlePanel/TitleMargin/TitleVBox/MenuButtons/LoadMenuButton
@onready var options_menu_button: Button = $TitlePanel/TitleMargin/TitleVBox/MenuButtons/OptionsMenuButton
@onready var quit_button: Button = $TitlePanel/TitleMargin/TitleVBox/MenuButtons/QuitButton
@onready var load_panel: PanelContainer = $LoadPanel
@onready var load_summary: Label = $LoadPanel/LoadMargin/LoadVBox/LoadSummary
@onready var load_game_button: Button = $LoadPanel/LoadMargin/LoadVBox/LoadButtons/LoadGameButton
@onready var delete_save_button: Button = $LoadPanel/LoadMargin/LoadVBox/LoadButtons/DeleteSaveButton
@onready var load_back_button: Button = $LoadPanel/LoadMargin/LoadVBox/LoadBackButton
@onready var credits_panel: PanelContainer = $CreditsPanel
@onready var credits_body: Label = $CreditsPanel/CreditsMargin/CreditsVBox/CreditsBody
@onready var credits_close_button: Button = $CreditsPanel/CreditsMargin/CreditsVBox/CreditsCloseButton
@onready var options_panel: PanelContainer = $OptionsPanel
@onready var visuals_tab_button: Button = $OptionsPanel/OptionsMargin/OptionsVBox/OptionsTabs/VisualsTabButton
@onready var audio_tab_button: Button = $OptionsPanel/OptionsMargin/OptionsVBox/OptionsTabs/AudioTabButton
@onready var gameplay_tab_button: Button = $OptionsPanel/OptionsMargin/OptionsVBox/OptionsTabs/GameplayTabButton
@onready var visuals_section: VBoxContainer = $OptionsPanel/OptionsMargin/OptionsVBox/VisualsSection
@onready var audio_section: VBoxContainer = $OptionsPanel/OptionsMargin/OptionsVBox/AudioSection
@onready var gameplay_section: VBoxContainer = $OptionsPanel/OptionsMargin/OptionsVBox/GameplaySection
@onready var fullscreen_check: CheckBox = $OptionsPanel/OptionsMargin/OptionsVBox/VisualsSection/FullscreenCheck
@onready var vsync_check: CheckBox = $OptionsPanel/OptionsMargin/OptionsVBox/VisualsSection/VsyncCheck
@onready var show_fps_check: CheckBox = $OptionsPanel/OptionsMargin/OptionsVBox/VisualsSection/ShowFpsCheck
@onready var camera_zoom_label: Label = $OptionsPanel/OptionsMargin/OptionsVBox/VisualsSection/CameraZoomLabel
@onready var camera_zoom_slider: HSlider = $OptionsPanel/OptionsMargin/OptionsVBox/VisualsSection/CameraZoomSlider
@onready var brightness_label: Label = $OptionsPanel/OptionsMargin/OptionsVBox/VisualsSection/BrightnessLabel
@onready var brightness_slider: HSlider = $OptionsPanel/OptionsMargin/OptionsVBox/VisualsSection/BrightnessSlider
@onready var screen_shake_label: Label = $OptionsPanel/OptionsMargin/OptionsVBox/VisualsSection/ScreenShakeLabel
@onready var screen_shake_slider: HSlider = $OptionsPanel/OptionsMargin/OptionsVBox/VisualsSection/ScreenShakeSlider
@onready var parallax_strength_label: Label = $OptionsPanel/OptionsMargin/OptionsVBox/VisualsSection/ParallaxStrengthLabel
@onready var parallax_strength_slider: HSlider = $OptionsPanel/OptionsMargin/OptionsVBox/VisualsSection/ParallaxStrengthSlider
@onready var glow_strength_label: Label = $OptionsPanel/OptionsMargin/OptionsVBox/VisualsSection/GlowStrengthLabel
@onready var glow_strength_slider: HSlider = $OptionsPanel/OptionsMargin/OptionsVBox/VisualsSection/GlowStrengthSlider
@onready var master_volume_label: Label = $OptionsPanel/OptionsMargin/OptionsVBox/AudioSection/MasterVolumeLabel
@onready var master_volume_slider: HSlider = $OptionsPanel/OptionsMargin/OptionsVBox/AudioSection/MasterVolumeSlider
@onready var music_volume_label: Label = $OptionsPanel/OptionsMargin/OptionsVBox/AudioSection/MusicVolumeLabel
@onready var music_volume_slider: HSlider = $OptionsPanel/OptionsMargin/OptionsVBox/AudioSection/MusicVolumeSlider
@onready var sfx_volume_label: Label = $OptionsPanel/OptionsMargin/OptionsVBox/AudioSection/SfxVolumeLabel
@onready var sfx_volume_slider: HSlider = $OptionsPanel/OptionsMargin/OptionsVBox/AudioSection/SfxVolumeSlider
@onready var ui_volume_label: Label = $OptionsPanel/OptionsMargin/OptionsVBox/AudioSection/UiVolumeLabel
@onready var ui_volume_slider: HSlider = $OptionsPanel/OptionsMargin/OptionsVBox/AudioSection/UiVolumeSlider
@onready var engine_volume_label: Label = $OptionsPanel/OptionsMargin/OptionsVBox/AudioSection/EngineVolumeLabel
@onready var engine_volume_slider: HSlider = $OptionsPanel/OptionsMargin/OptionsVBox/AudioSection/EngineVolumeSlider
@onready var onboarding_check: CheckBox = $OptionsPanel/OptionsMargin/OptionsVBox/GameplaySection/OnboardingCheck
@onready var docking_prompt_check: CheckBox = $OptionsPanel/OptionsMargin/OptionsVBox/GameplaySection/DockingPromptCheck
@onready var options_back_button: Button = $OptionsPanel/OptionsMargin/OptionsVBox/OptionsBackButton

var splash_index := 0
var splash_timer := 1.2
var splash_done := false
var menu_music_player: AudioStreamPlayer
var ui_click_player: AudioStreamPlayer
var ui_hover_player: AudioStreamPlayer
var ui_hover_audio_block_until := 0
var active_options_tab := "visuals"
var title_logo_frame_sequence: Array[int] = [0, 1, 2, 3, 2, 1]
var title_logo_sequence_index := 0
var title_logo_frame_timer := TITLE_LOGO_FRAME_DURATION
var title_logo_frame_width := 0
var menu_starfield_far: Array[Dictionary] = []
var menu_starfield_mid: Array[Dictionary] = []
var menu_starfield_near: Array[Dictionary] = []
var menu_background_debris: Array[Dictionary] = []
var menu_background_ships: Array[Dictionary] = []
var menu_far_background_ships: Array[Dictionary] = []
var menu_starfield_focus := Vector2.ZERO


func save_manager() -> Node:
	return get_node("/root/SaveManager")


func settings_manager() -> Node:
	return get_node("/root/SettingsManager")


func _ready() -> void:
	if DisplayServer.get_name() != "headless":
		setup_audio()
	new_game_button.pressed.connect(start_new_game)
	load_menu_button.pressed.connect(open_load_menu)
	options_menu_button.pressed.connect(open_options_menu)
	quit_button.pressed.connect(func() -> void: get_tree().quit())
	load_game_button.pressed.connect(load_game)
	delete_save_button.pressed.connect(delete_save)
	load_back_button.pressed.connect(close_load_menu)
	credits_close_button.pressed.connect(close_credits)
	visuals_tab_button.pressed.connect(func() -> void: set_options_tab("visuals"))
	audio_tab_button.pressed.connect(func() -> void: set_options_tab("audio"))
	gameplay_tab_button.pressed.connect(func() -> void: set_options_tab("gameplay"))
	options_back_button.pressed.connect(close_options_menu)
	fullscreen_check.toggled.connect(func(toggled: bool) -> void:
		settings_manager().set_value("visuals", "fullscreen", toggled)
	)
	vsync_check.toggled.connect(func(toggled: bool) -> void:
		settings_manager().set_value("visuals", "vsync", toggled)
	)
	show_fps_check.toggled.connect(func(toggled: bool) -> void:
		settings_manager().set_value("visuals", "show_fps", toggled)
	)
	camera_zoom_slider.value_changed.connect(func(value: float) -> void:
		settings_manager().set_value("visuals", "camera_zoom", snappedf(value, 0.01))
		refresh_options_labels()
	)
	brightness_slider.value_changed.connect(func(value: float) -> void:
		settings_manager().set_value("visuals", "brightness", snappedf(value, 0.01))
		apply_visual_settings()
		refresh_options_labels()
	)
	screen_shake_slider.value_changed.connect(func(value: float) -> void:
		settings_manager().set_value("visuals", "screen_shake", snappedf(value, 0.01))
		refresh_options_labels()
	)
	parallax_strength_slider.value_changed.connect(func(value: float) -> void:
		settings_manager().set_value("visuals", "parallax_strength", snappedf(value, 0.01))
		refresh_options_labels()
	)
	glow_strength_slider.value_changed.connect(func(value: float) -> void:
		settings_manager().set_value("visuals", "glow_strength", snappedf(value, 0.01))
		refresh_options_labels()
	)
	master_volume_slider.value_changed.connect(func(value: float) -> void:
		settings_manager().set_value("audio", "master", snappedf(value, 0.01))
		apply_audio_settings()
		refresh_options_labels()
	)
	music_volume_slider.value_changed.connect(func(value: float) -> void:
		settings_manager().set_value("audio", "music", snappedf(value, 0.01))
		apply_audio_settings()
		refresh_options_labels()
	)
	sfx_volume_slider.value_changed.connect(func(value: float) -> void:
		settings_manager().set_value("audio", "sfx", snappedf(value, 0.01))
		apply_audio_settings()
		refresh_options_labels()
	)
	ui_volume_slider.value_changed.connect(func(value: float) -> void:
		settings_manager().set_value("audio", "ui", snappedf(value, 0.01))
		apply_audio_settings()
		refresh_options_labels()
	)
	engine_volume_slider.value_changed.connect(func(value: float) -> void:
		settings_manager().set_value("audio", "engine", snappedf(value, 0.01))
		refresh_options_labels()
	)
	onboarding_check.toggled.connect(func(toggled: bool) -> void:
		settings_manager().set_value("gameplay", "show_onboarding", toggled)
	)
	docking_prompt_check.toggled.connect(func(toggled: bool) -> void:
		settings_manager().set_value("gameplay", "docking_prompt", toggled)
	)
	title_label.text = "STARHAUL"
	credits_body.text = "STARHAUL\n\nCreated by Josh Conner\nGame design, direction, worldbuilding, feature planning, playtesting, and production\n\nBuilt in collaboration with Codex\nProgramming support, systems implementation, UI building, iteration support, and technical polish\n\nDedicated to my loving wife Lindsey as she battles breast cancer.\n\nCurrent game slice\nMining, scanning, refining, factions, missions, combat, boarding groundwork, tactical maps, docking, saves, and station operations."
	apply_ui_polish()
	configure_title_logo()
	seed_menu_starfield()
	menu_starfield_layer.draw.connect(draw_menu_starfield_layer)
	refresh_options_from_settings()
	apply_visual_settings()
	show_splash_step()
	refresh_load_menu()


func _process(delta: float) -> void:
	update_menu_starfield(delta)
	if splash_done:
		update_title_logo_animation(delta)
		menu_starfield_layer.queue_redraw()
		return
	if Input.is_anything_pressed():
		show_title_menu()
		menu_starfield_layer.queue_redraw()
		return
	splash_timer -= delta
	if splash_timer > 0.0:
		menu_starfield_layer.queue_redraw()
		return
	splash_index += 1
	if splash_index >= SPLASH_STEPS.size():
		show_title_menu()
		menu_starfield_layer.queue_redraw()
		return
	show_splash_step()
	menu_starfield_layer.queue_redraw()


func _unhandled_input(event: InputEvent) -> void:
	if not event.is_action_pressed("ui_cancel"):
		return
	if not splash_done:
		show_title_menu()
		get_viewport().set_input_as_handled()
		return
	if load_panel.visible:
		close_load_menu()
		get_viewport().set_input_as_handled()
		return
	if options_panel.visible:
		close_options_menu()
		get_viewport().set_input_as_handled()
		return
	if credits_panel.visible:
		close_credits()
		get_viewport().set_input_as_handled()

func show_splash_step() -> void:
	var step: Dictionary = SPLASH_STEPS[splash_index]
	splash_title.text = str(step.get("title", "STARHAUL"))
	splash_subtitle.text = str(step.get("subtitle", ""))
	splash_timer = 1.2
	splash_panel.visible = true
	title_panel.visible = false
	load_panel.visible = false
	credits_panel.visible = false
	options_panel.visible = false


func show_title_menu() -> void:
	splash_done = true
	splash_panel.visible = false
	title_panel.visible = true
	load_panel.visible = false
	credits_panel.visible = false
	options_panel.visible = false
	reset_title_logo_animation()
	refresh_load_menu()


func refresh_load_menu() -> void:
	var has_save: bool = save_manager().has_save_file()
	load_summary.text = save_manager().build_save_summary()
	load_game_button.disabled = not has_save
	delete_save_button.disabled = not has_save
	load_menu_button.disabled = not has_save


func start_new_game() -> void:
	save_manager().clear_pending_load()
	get_tree().change_scene_to_file(GAME_SCENE_PATH)


func open_load_menu() -> void:
	refresh_load_menu()
	title_panel.visible = false
	load_panel.visible = true
	credits_panel.visible = false
	options_panel.visible = false


func close_load_menu() -> void:
	load_panel.visible = false
	title_panel.visible = true


func open_credits() -> void:
	title_panel.visible = false
	credits_panel.visible = true
	load_panel.visible = false
	options_panel.visible = false


func close_credits() -> void:
	credits_panel.visible = false
	title_panel.visible = true


func open_options_menu() -> void:
	refresh_options_from_settings()
	title_panel.visible = false
	load_panel.visible = false
	credits_panel.visible = false
	options_panel.visible = true


func close_options_menu() -> void:
	options_panel.visible = false
	title_panel.visible = true


func set_options_tab(tab_id: String) -> void:
	active_options_tab = tab_id
	visuals_section.visible = tab_id == "visuals"
	audio_section.visible = tab_id == "audio"
	gameplay_section.visible = tab_id == "gameplay"


func refresh_options_from_settings() -> void:
	fullscreen_check.button_pressed = bool(settings_manager().get_value("visuals", "fullscreen"))
	vsync_check.button_pressed = bool(settings_manager().get_value("visuals", "vsync"))
	show_fps_check.button_pressed = bool(settings_manager().get_value("visuals", "show_fps"))
	camera_zoom_slider.value = float(settings_manager().get_value("visuals", "camera_zoom"))
	brightness_slider.value = float(settings_manager().get_value("visuals", "brightness"))
	screen_shake_slider.value = float(settings_manager().get_value("visuals", "screen_shake"))
	parallax_strength_slider.value = float(settings_manager().get_value("visuals", "parallax_strength"))
	glow_strength_slider.value = float(settings_manager().get_value("visuals", "glow_strength"))
	master_volume_slider.value = float(settings_manager().get_value("audio", "master"))
	music_volume_slider.value = float(settings_manager().get_value("audio", "music"))
	sfx_volume_slider.value = float(settings_manager().get_value("audio", "sfx"))
	ui_volume_slider.value = float(settings_manager().get_value("audio", "ui"))
	engine_volume_slider.value = float(settings_manager().get_value("audio", "engine"))
	onboarding_check.button_pressed = bool(settings_manager().get_value("gameplay", "show_onboarding"))
	docking_prompt_check.button_pressed = bool(settings_manager().get_value("gameplay", "docking_prompt"))
	set_options_tab(active_options_tab)
	refresh_options_labels()
	apply_audio_settings()
	apply_visual_settings()


func refresh_options_labels() -> void:
	camera_zoom_label.text = "Camera Zoom  |  %.2f" % camera_zoom_slider.value
	brightness_label.text = "Brightness  |  %d%%" % int(round(brightness_slider.value * 100.0))
	screen_shake_label.text = "Screen Shake  |  %d%%" % int(round(screen_shake_slider.value * 100.0))
	parallax_strength_label.text = "Parallax Strength  |  %d%%" % int(round(parallax_strength_slider.value * 100.0))
	glow_strength_label.text = "Glow Strength  |  %d%%" % int(round(glow_strength_slider.value * 100.0))
	master_volume_label.text = "Master Volume  |  %d%%" % int(round(master_volume_slider.value * 100.0))
	music_volume_label.text = "Music Volume  |  %d%%" % int(round(music_volume_slider.value * 100.0))
	sfx_volume_label.text = "SFX Volume  |  %d%%" % int(round(sfx_volume_slider.value * 100.0))
	ui_volume_label.text = "UI Volume  |  %d%%" % int(round(ui_volume_slider.value * 100.0))
	engine_volume_label.text = "Engine Volume  |  %d%%" % int(round(engine_volume_slider.value * 100.0))
	camera_zoom_label.queue_redraw()
	brightness_label.queue_redraw()
	screen_shake_label.queue_redraw()
	parallax_strength_label.queue_redraw()
	glow_strength_label.queue_redraw()
	master_volume_label.queue_redraw()
	music_volume_label.queue_redraw()
	sfx_volume_label.queue_redraw()
	ui_volume_label.queue_redraw()
	engine_volume_label.queue_redraw()


func apply_visual_settings() -> void:
	var brightness: float = settings_manager().brightness_scalar()
	canvas_modulate.color = Color(brightness, brightness, brightness, 1.0)
	menu_starfield_layer.queue_redraw()


func load_game() -> void:
	if not save_manager().queue_load_from_disk():
		refresh_load_menu()
		return
	get_tree().change_scene_to_file(GAME_SCENE_PATH)


func delete_save() -> void:
	save_manager().delete_save()
	refresh_load_menu()


func setup_audio() -> void:
	menu_music_player = AudioStreamPlayer.new()
	menu_music_player.stream = MENU_MUSIC
	menu_music_player.name = "MenuMusicPlayer"
	menu_music_player.bus = "Master"
	add_child(menu_music_player)
	if is_inside_tree():
		menu_music_player.play()

	ui_click_player = AudioStreamPlayer.new()
	ui_click_player.stream = UI_CLICK_SOUND
	ui_click_player.name = "UiClickPlayer"
	ui_click_player.bus = "Master"
	add_child(ui_click_player)

	ui_hover_player = AudioStreamPlayer.new()
	ui_hover_player.stream = UI_CLICK_SOUND
	ui_hover_player.name = "UiHoverPlayer"
	ui_hover_player.bus = "Master"
	ui_hover_player.pitch_scale = 1.16
	ui_hover_player.volume_db = -6.0
	add_child(ui_hover_player)

	for button in [new_game_button, load_menu_button, quit_button, load_game_button, delete_save_button, load_back_button, credits_close_button]:
		register_button_audio(button)
	for button in [options_menu_button, visuals_tab_button, audio_tab_button, gameplay_tab_button, options_back_button]:
		register_button_audio(button)


func apply_audio_settings() -> void:
	var music_scalar: float = settings_manager().combined_audio_scalar("music")
	var ui_scalar: float = settings_manager().combined_audio_scalar("ui")
	if menu_music_player != null:
		menu_music_player.volume_db = -4.0 + linear_to_db(max(music_scalar, 0.001))
	if ui_click_player != null:
		ui_click_player.volume_db = -3.0 + linear_to_db(max(ui_scalar, 0.001))
	if ui_hover_player != null:
		ui_hover_player.volume_db = -8.0 + linear_to_db(max(ui_scalar, 0.001))


func register_button_audio(button: Button) -> void:
	button.pressed.connect(play_ui_click)
	button.mouse_entered.connect(play_ui_hover)


func play_ui_click() -> void:
	if ui_click_player == null or not ui_click_player.is_inside_tree():
		return
	ui_hover_audio_block_until = Time.get_ticks_msec() + 120
	ui_click_player.pitch_scale = 1.0
	ui_click_player.play()


func play_ui_hover() -> void:
	if ui_hover_player == null or not ui_hover_player.is_inside_tree():
		return
	if Time.get_ticks_msec() < ui_hover_audio_block_until:
		return
	ui_hover_player.play()


func make_panel_style(fill: Color, border: Color, corner_radius: int = 20, border_width: int = 1) -> StyleBoxFlat:
	var style := StyleBoxFlat.new()
	style.bg_color = fill
	style.border_color = border
	style.set_border_width_all(border_width)
	style.set_corner_radius_all(corner_radius)
	style.shadow_color = Color(0.0, 0.0, 0.0, 0.28)
	style.shadow_size = 18
	style.content_margin_left = 10
	style.content_margin_top = 10
	style.content_margin_right = 10
	style.content_margin_bottom = 10
	return style


func make_button_style(fill: Color, border: Color) -> StyleBoxFlat:
	var style := StyleBoxFlat.new()
	style.bg_color = fill
	style.border_color = border
	style.set_border_width_all(1)
	style.set_corner_radius_all(14)
	style.content_margin_left = 12
	style.content_margin_top = 10
	style.content_margin_right = 12
	style.content_margin_bottom = 10
	return style


func style_button(button: Button, accent: Color) -> void:
	button.add_theme_stylebox_override("normal", make_button_style(Color(0.09, 0.13, 0.2, 0.98), Color(accent.r, accent.g, accent.b, 0.35)))
	button.add_theme_stylebox_override("hover", make_button_style(Color(0.14, 0.22, 0.34, 1.0), Color(accent.r, accent.g, accent.b, 0.72)))
	button.add_theme_stylebox_override("pressed", make_button_style(Color(0.18, 0.3, 0.46, 1.0), Color(accent.r, accent.g, accent.b, 0.92)))
	button.add_theme_stylebox_override("disabled", make_button_style(Color(0.07, 0.09, 0.13, 0.92), Color(0.4, 0.45, 0.52, 0.18)))
	button.add_theme_color_override("font_color", Color(0.9, 0.95, 1.0))
	button.add_theme_color_override("font_hover_color", Color(1, 1, 1))
	button.add_theme_color_override("font_pressed_color", Color(1, 1, 1))
	button.add_theme_color_override("font_disabled_color", Color(0.42, 0.47, 0.55))
	button.add_theme_font_size_override("font_size", 16)


func apply_ui_polish() -> void:
	var splash_style := make_panel_style(Color(0.05, 0.08, 0.13, 0.98), Color(0.34, 0.67, 0.96, 0.36), 22, 1)
	var title_style := make_panel_style(Color(0.04, 0.06, 0.1, 0.985), Color(0.92, 0.72, 0.28, 0.28), 24, 1)
	var modal_style := make_panel_style(Color(0.04, 0.06, 0.1, 0.995), Color(0.34, 0.67, 0.96, 0.42), 22, 1)

	splash_panel.add_theme_stylebox_override("panel", splash_style)
	title_panel.add_theme_stylebox_override("panel", title_style)
	load_panel.add_theme_stylebox_override("panel", modal_style)
	credits_panel.add_theme_stylebox_override("panel", modal_style)
	options_panel.add_theme_stylebox_override("panel", modal_style)

	for label in [splash_title, title_label]:
		label.add_theme_font_size_override("font_size", 30)
		label.add_theme_color_override("font_color", Color(0.95, 0.98, 1.0))

	splash_subtitle.add_theme_font_size_override("font_size", 15)
	splash_subtitle.add_theme_color_override("font_color", Color(0.66, 0.78, 0.92))

	load_summary.add_theme_font_size_override("font_size", 15)
	load_summary.add_theme_color_override("font_color", Color(0.84, 0.9, 1.0))
	credits_body.add_theme_font_size_override("font_size", 15)
	credits_body.add_theme_color_override("font_color", Color(0.82, 0.88, 0.96))

	for button in [new_game_button, load_menu_button, options_menu_button, quit_button]:
		style_button(button, Color(0.92, 0.72, 0.28))

	for button in [load_game_button, delete_save_button, load_back_button, credits_close_button, options_back_button]:
		style_button(button, Color(0.34, 0.67, 0.96))

	for button in [visuals_tab_button, audio_tab_button, gameplay_tab_button]:
		style_button(button, Color(0.34, 0.67, 0.96))


func configure_title_logo() -> void:
	var atlas := AtlasTexture.new()
	atlas.atlas = TITLE_LOGO_SPRITE_SHEET
	title_logo.texture = atlas
	title_logo.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	title_logo.stretch_mode = TextureRect.STRETCH_KEEP_CENTERED
	title_logo_frame_width = int(floor(float(TITLE_LOGO_SPRITE_SHEET.get_width()) / float(TITLE_LOGO_FRAME_COUNT)))
	title_logo.custom_minimum_size = Vector2(title_logo_frame_width, TITLE_LOGO_SPRITE_SHEET.get_height())
	title_logo.material = null
	reset_title_logo_animation()


func seed_menu_starfield() -> void:
	menu_starfield_far.clear()
	menu_starfield_mid.clear()
	menu_starfield_near.clear()
	menu_background_debris.clear()
	menu_background_ships.clear()
	menu_far_background_ships.clear()
	var rng := RandomNumberGenerator.new()
	rng.randomize()
	for _index in range(74):
		menu_starfield_far.append({
			"position": Vector2(rng.randf_range(0.0, MENU_STARFIELD_SPAN.x), rng.randf_range(0.0, MENU_STARFIELD_SPAN.y)),
			"radius": rng.randf_range(0.7, 1.6),
			"depth": rng.randf_range(0.16, 0.28),
			"color": Color(0.48, 0.62, 0.82, rng.randf_range(0.26, 0.54)),
		})
	for _index in range(52):
		menu_starfield_mid.append({
			"position": Vector2(rng.randf_range(0.0, MENU_STARFIELD_SPAN.x), rng.randf_range(0.0, MENU_STARFIELD_SPAN.y)),
			"radius": rng.randf_range(1.0, 2.2),
			"depth": rng.randf_range(0.34, 0.5),
			"color": Color(0.72, 0.84, 1.0, rng.randf_range(0.4, 0.8)),
			"bloom": rng.randf() < 0.14,
			"blink_phase": rng.randf_range(0.0, TAU),
		})
	for _index in range(18):
		menu_starfield_near.append({
			"position": Vector2(rng.randf_range(0.0, MENU_STARFIELD_SPAN.x), rng.randf_range(0.0, MENU_STARFIELD_SPAN.y)),
			"radius": rng.randf_range(1.4, 3.1),
			"depth": rng.randf_range(0.58, 0.82),
			"color": Color(1.0, rng.randf_range(0.84, 0.94), rng.randf_range(0.64, 0.82), rng.randf_range(0.5, 0.92)),
			"bloom": rng.randf() < 0.42,
			"blink_phase": rng.randf_range(0.0, TAU),
		})
	for _index in range(10):
		var debris_texture: Texture2D = MENU_DEBRIS_TEXTURES[rng.randi_range(0, MENU_DEBRIS_TEXTURES.size() - 1)]
		menu_background_debris.append({
			"texture": debris_texture,
			"position": Vector2(rng.randf_range(0.0, MENU_STARFIELD_SPAN.x), rng.randf_range(0.0, MENU_STARFIELD_SPAN.y)),
			"depth": rng.randf_range(0.26, 0.6),
			"scale": rng.randf_range(0.45, 0.92),
			"rotation": rng.randf_range(-PI, PI),
			"rotation_speed": rng.randf_range(-0.07, 0.07),
			"alpha": rng.randf_range(0.14, 0.28),
		})
	for _index in range(2):
		menu_background_ships.append(build_menu_background_ship(rng))
	for _index in range(2):
		menu_far_background_ships.append(build_menu_far_background_ship(rng))


func update_menu_starfield(delta: float) -> void:
	var parallax_scalar: float = float(settings_manager().get_value("visuals", "parallax_strength"))
	var speed_scale: float = lerpf(0.45, 1.0, clampf(parallax_scalar, 0.0, 1.0))
	menu_starfield_focus.x = wrapf(menu_starfield_focus.x + delta * 22.0 * speed_scale, 0.0, MENU_STARFIELD_SPAN.x)
	menu_starfield_focus.y = wrapf(menu_starfield_focus.y + delta * 6.0 * speed_scale, 0.0, MENU_STARFIELD_SPAN.y)
	for debris_index in range(menu_background_debris.size()):
		var debris: Dictionary = menu_background_debris[debris_index]
		debris["rotation"] = float(debris.get("rotation", 0.0)) + float(debris.get("rotation_speed", 0.0)) * delta
		menu_background_debris[debris_index] = debris
	for ship_index in range(menu_background_ships.size()):
		var ship: Dictionary = menu_background_ships[ship_index]
		var ship_position: Vector2 = ship.get("position", Vector2.ZERO)
		var velocity: Vector2 = ship.get("velocity", Vector2.ZERO)
		ship_position += velocity * delta * speed_scale
		ship["position"] = ship_position
		ship["thruster_phase"] = float(ship.get("thruster_phase", 0.0)) + delta * 5.2
		var screen_margin: float = 180.0
		if ship_position.x < -screen_margin or ship_position.x > menu_starfield_layer.size.x + screen_margin or ship_position.y < -screen_margin or ship_position.y > menu_starfield_layer.size.y + screen_margin:
			var ship_rng := RandomNumberGenerator.new()
			ship_rng.seed = Time.get_ticks_usec() + ship_index * 9187
			ship = build_menu_background_ship(ship_rng)
		menu_background_ships[ship_index] = ship
	for ship_index in range(menu_far_background_ships.size()):
		var ship: Dictionary = menu_far_background_ships[ship_index]
		var ship_position: Vector2 = ship.get("position", Vector2.ZERO)
		var velocity: Vector2 = ship.get("velocity", Vector2.ZERO)
		ship_position += velocity * delta * speed_scale * 0.68
		ship["position"] = ship_position
		ship["thruster_phase"] = float(ship.get("thruster_phase", 0.0)) + delta * 3.2
		var screen_margin: float = 220.0
		if ship_position.x < -screen_margin or ship_position.x > menu_starfield_layer.size.x + screen_margin or ship_position.y < -screen_margin or ship_position.y > menu_starfield_layer.size.y + screen_margin:
			var ship_rng := RandomNumberGenerator.new()
			ship_rng.seed = Time.get_ticks_usec() + ship_index * 14711 + 99
			ship = build_menu_far_background_ship(ship_rng)
		menu_far_background_ships[ship_index] = ship


func draw_menu_starfield_layer() -> void:
	draw_menu_star_layer(menu_starfield_far)
	draw_menu_star_layer(menu_starfield_mid)
	draw_menu_far_background_ships()
	draw_menu_background_debris()
	draw_menu_background_ships()
	draw_menu_star_layer(menu_starfield_near)


func draw_menu_star_layer(layer: Array[Dictionary]) -> void:
	for star_variant in layer:
		var star: Dictionary = star_variant
		var point: Vector2 = menu_starfield_point(Vector2(star.get("position", Vector2.ZERO)), float(star.get("depth", 1.0)))
		var base_color: Color = Color(star.get("color", Color.WHITE))
		var radius: float = float(star.get("radius", 1.0))
		if bool(star.get("bloom", false)):
			menu_starfield_layer.draw_circle(point, radius * 2.8, Color(base_color.r, base_color.g, base_color.b, base_color.a * 0.12))
			menu_starfield_layer.draw_circle(point, radius * 1.8, Color(base_color.r, base_color.g, base_color.b, base_color.a * 0.18))
		var blink := 0.0
		if star.has("blink_phase"):
			blink = max(sin(Time.get_ticks_msec() / 420.0 + float(star.get("blink_phase", 0.0))), 0.0)
		menu_starfield_layer.draw_circle(point, radius, base_color)
		if blink > 0.92:
			menu_starfield_layer.draw_circle(point, radius * 1.2, Color(0.9, 1.0, 0.96, 0.18 + 0.14 * blink))
			menu_starfield_layer.draw_line(point + Vector2(-5.0, 0.0), point + Vector2(5.0, 0.0), Color(0.72, 0.92, 1.0, 0.18 * blink), 1.0)


func draw_menu_background_debris() -> void:
	for debris_variant in menu_background_debris:
		var debris: Dictionary = debris_variant
		var texture: Texture2D = debris.get("texture", null)
		if texture == null:
			continue
		var point: Vector2 = menu_starfield_point(Vector2(debris.get("position", Vector2.ZERO)), float(debris.get("depth", 1.0)))
		var debris_scale: float = float(debris.get("scale", 1.0))
		menu_starfield_layer.draw_set_transform(point, float(debris.get("rotation", 0.0)), Vector2.ONE * debris_scale)
		menu_starfield_layer.draw_texture(texture, -texture.get_size() * 0.5, Color(0.42, 0.56, 0.72, float(debris.get("alpha", 0.22))))
		menu_starfield_layer.draw_set_transform(Vector2.ZERO, 0.0, Vector2.ONE)


func draw_menu_background_ships() -> void:
	for ship_variant in menu_background_ships:
		var ship: Dictionary = ship_variant
		var texture: Texture2D = ship.get("texture", null)
		if texture == null:
			continue
		var ship_position: Vector2 = ship.get("position", Vector2.ZERO)
		var velocity: Vector2 = ship.get("velocity", Vector2.RIGHT)
		var angle: float = velocity.angle() + PI
		var ship_scale: float = float(ship.get("scale", 1.0))
		var alpha: float = float(ship.get("alpha", 0.6))
		var half_size: Vector2 = texture.get_size() * 0.5
		var rear_x: float = half_size.x * 0.92
		var thrust_alpha: float = clampf(velocity.length() / max(float(ship.get("speed_max", 95.0)), 1.0), 0.2, 0.9)
		var thrust_length: float = 8.0 + 8.0 * thrust_alpha
		menu_starfield_layer.draw_set_transform(ship_position, angle, Vector2.ONE * ship_scale)
		var exhaust_center := Vector2(rear_x, 0.0)
		var exhaust_tip := exhaust_center + Vector2(thrust_length, 0.0)
		menu_starfield_layer.draw_line(exhaust_center, exhaust_tip, Color(1.0, 0.56, 0.2, 0.78 * thrust_alpha * alpha), 7.2)
		menu_starfield_layer.draw_line(exhaust_center, exhaust_center + Vector2(thrust_length * 0.68, 0.0), Color(1.0, 0.84, 0.48, 0.94 * thrust_alpha * alpha), 3.8)
		menu_starfield_layer.draw_circle(exhaust_center, 5.2, Color(0.48, 0.86, 1.0, 0.22 * thrust_alpha * alpha))
		menu_starfield_layer.draw_circle(exhaust_tip, 4.0, Color(1.0, 0.82, 0.42, 0.34 * thrust_alpha * alpha))
		menu_starfield_layer.draw_texture(texture, -half_size, Color(0.84, 0.92, 1.0, alpha))
		menu_starfield_layer.draw_set_transform(Vector2.ZERO, 0.0, Vector2.ONE)


func draw_menu_far_background_ships() -> void:
	for ship_variant in menu_far_background_ships:
		var ship: Dictionary = ship_variant
		var texture: Texture2D = ship.get("texture", null)
		if texture == null:
			continue
		var ship_position: Vector2 = ship.get("position", Vector2.ZERO)
		var velocity: Vector2 = ship.get("velocity", Vector2.RIGHT)
		var angle: float = velocity.angle() + PI
		var ship_scale: float = float(ship.get("scale", 1.0))
		var alpha: float = float(ship.get("alpha", 0.3))
		var half_size: Vector2 = texture.get_size() * 0.5
		var rear_x: float = half_size.x * 0.92
		var thrust_alpha: float = clampf(velocity.length() / max(float(ship.get("speed_max", 95.0)), 1.0), 0.2, 0.9)
		var thrust_length: float = 8.0 + 8.0 * thrust_alpha
		menu_starfield_layer.draw_set_transform(ship_position, angle, Vector2.ONE * ship_scale)
		var exhaust_center := Vector2(rear_x, 0.0)
		var exhaust_tip := exhaust_center + Vector2(thrust_length, 0.0)
		menu_starfield_layer.draw_line(exhaust_center, exhaust_tip, Color(1.0, 0.56, 0.2, 0.56 * thrust_alpha * alpha), 4.8)
		menu_starfield_layer.draw_line(exhaust_center, exhaust_center + Vector2(thrust_length * 0.62, 0.0), Color(1.0, 0.84, 0.48, 0.7 * thrust_alpha * alpha), 2.4)
		menu_starfield_layer.draw_circle(exhaust_center, 3.2, Color(0.48, 0.86, 1.0, 0.14 * thrust_alpha * alpha))
		menu_starfield_layer.draw_circle(exhaust_tip, 2.8, Color(1.0, 0.82, 0.42, 0.24 * thrust_alpha * alpha))
		menu_starfield_layer.draw_texture(texture, -half_size, Color(0.72, 0.82, 0.94, alpha))
		menu_starfield_layer.draw_set_transform(Vector2.ZERO, 0.0, Vector2.ONE)


func build_menu_background_ship(rng: RandomNumberGenerator) -> Dictionary:
	var texture: Texture2D = MENU_PLAYER_SHIP_TEXTURES[rng.randi_range(0, MENU_PLAYER_SHIP_TEXTURES.size() - 1)]
	var viewport_size: Vector2 = menu_starfield_layer.size
	if viewport_size.x <= 0.0 or viewport_size.y <= 0.0:
		viewport_size = get_viewport_rect().size
	if viewport_size.x <= 0.0:
		viewport_size.x = 1280.0
	if viewport_size.y <= 0.0:
		viewport_size.y = 720.0
	var margin := 160.0
	var entry_side: int = rng.randi_range(0, 3)
	var spawn_position := Vector2.ZERO
	var target := Vector2.ZERO
	match entry_side:
		0:
			spawn_position = Vector2(-margin, rng.randf_range(70.0, viewport_size.y - 70.0))
			target = Vector2(viewport_size.x + margin, rng.randf_range(70.0, viewport_size.y - 70.0))
		1:
			spawn_position = Vector2(viewport_size.x + margin, rng.randf_range(70.0, viewport_size.y - 70.0))
			target = Vector2(-margin, rng.randf_range(70.0, viewport_size.y - 70.0))
		2:
			spawn_position = Vector2(rng.randf_range(70.0, viewport_size.x - 70.0), -margin)
			target = Vector2(rng.randf_range(70.0, viewport_size.x - 70.0), viewport_size.y + margin)
		_:
			spawn_position = Vector2(rng.randf_range(70.0, viewport_size.x - 70.0), viewport_size.y + margin)
			target = Vector2(rng.randf_range(70.0, viewport_size.x - 70.0), -margin)
	var velocity: Vector2 = (target - spawn_position).normalized() * rng.randf_range(34.0, 62.0)
	return {
		"texture": texture,
		"position": spawn_position,
		"velocity": velocity,
		"speed_max": velocity.length(),
		"scale": rng.randf_range(0.5, 0.82),
		"alpha": rng.randf_range(0.3, 0.58),
		"thruster_phase": rng.randf_range(0.0, TAU),
	}


func build_menu_far_background_ship(rng: RandomNumberGenerator) -> Dictionary:
	var texture: Texture2D = MENU_FAR_SHIP_TEXTURES[rng.randi_range(0, MENU_FAR_SHIP_TEXTURES.size() - 1)]
	var viewport_size: Vector2 = menu_starfield_layer.size
	if viewport_size.x <= 0.0 or viewport_size.y <= 0.0:
		viewport_size = get_viewport_rect().size
	if viewport_size.x <= 0.0:
		viewport_size.x = 1280.0
	if viewport_size.y <= 0.0:
		viewport_size.y = 720.0
	var margin := 180.0
	var move_right: bool = rng.randf() >= 0.5
	var spawn_position := Vector2(-margin if move_right else viewport_size.x + margin, rng.randf_range(46.0, viewport_size.y * 0.42))
	var target := Vector2(viewport_size.x + margin if move_right else -margin, rng.randf_range(46.0, viewport_size.y * 0.42))
	var velocity := (target - spawn_position).normalized() * rng.randf_range(18.0, 30.0)
	return {
		"texture": texture,
		"position": spawn_position,
		"velocity": velocity,
		"speed_max": velocity.length(),
		"scale": rng.randf_range(0.28, 0.52),
		"alpha": rng.randf_range(0.16, 0.3),
		"thruster_phase": rng.randf_range(0.0, TAU),
	}


func menu_starfield_point(source_position: Vector2, depth: float) -> Vector2:
	var adjusted_depth: float = lerpf(1.0, depth, float(settings_manager().get_value("visuals", "parallax_strength")))
	var offset_position: Vector2 = source_position - menu_starfield_focus * adjusted_depth
	return Vector2(
		wrapf(offset_position.x, 0.0, MENU_STARFIELD_SPAN.x) / MENU_STARFIELD_SPAN.x * max(menu_starfield_layer.size.x, 1.0),
		wrapf(offset_position.y, 0.0, MENU_STARFIELD_SPAN.y) / MENU_STARFIELD_SPAN.y * max(menu_starfield_layer.size.y, 1.0)
	)


func reset_title_logo_animation() -> void:
	title_logo_sequence_index = 0
	title_logo_frame_timer = TITLE_LOGO_FRAME_DURATION
	apply_title_logo_frame()


func update_title_logo_animation(delta: float) -> void:
	if not title_panel.visible or title_logo.texture == null:
		return
	title_logo_frame_timer -= delta
	if title_logo_frame_timer > 0.0:
		return
	title_logo_frame_timer = TITLE_LOGO_FRAME_DURATION
	title_logo_sequence_index = (title_logo_sequence_index + 1) % title_logo_frame_sequence.size()
	apply_title_logo_frame()


func apply_title_logo_frame() -> void:
	var atlas := title_logo.texture as AtlasTexture
	if atlas == null:
		return
	var target_frame: int = title_logo_frame_sequence[title_logo_sequence_index]
	var frame_start: int = target_frame * title_logo_frame_width
	atlas.region = Rect2(frame_start, 0, title_logo_frame_width, TITLE_LOGO_SPRITE_SHEET.get_height())
