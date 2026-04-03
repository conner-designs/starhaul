extends Node2D

# --- Shared data / assets ---
const STARHAUL_DATA_LIB := preload("res://scripts/starhaul_data.gd")
const STARHAUL_MISSION_LIB := preload("res://scripts/starhaul_mission_data.gd")
const STARHAUL_RESEARCH_LIB := preload("res://scripts/starhaul_research_data.gd")
const STARHAUL_WORLD_LIB := preload("res://scripts/starhaul_world_data.gd")
const RESOURCE_SCENE := preload("res://scenes/resource_node.tscn")
const ORE_ASTEROID_TEXTURES := [
	{"texture": preload("res://assets/objects/astroid_iron_01.png"), "scale_bonus": 1.24},
	{"texture": preload("res://assets/objects/astroid_iron_02.png"), "scale_bonus": 1.1},
]
const NICKEL_ASTEROID_TEXTURES := [
	{"texture": preload("res://assets/objects/astroid_nickle_01.png"), "scale_bonus": 1.18},
	{"texture": preload("res://assets/objects/astroid_nickle_02.png"), "scale_bonus": 1.08},
]
const COPPER_ASTEROID_TEXTURES := [
	{"texture": preload("res://assets/objects/astroid_copper_01.png"), "scale_bonus": 1.14},
	{"texture": preload("res://assets/objects/astroid_copper_02.png"), "scale_bonus": 1.06},
]
const TITANIUM_ASTEROID_TEXTURES := [
	{"texture": preload("res://assets/objects/astroid_titanium_01.png"), "scale_bonus": 1.12},
	{"texture": preload("res://assets/objects/astroid_titanium_02.png"), "scale_bonus": 1.06},
]
const ICE_ASTEROID_TEXTURES := [
	{"texture": preload("res://assets/objects/astroid_ice_01.png"), "scale_bonus": 1.22},
	{"texture": preload("res://assets/objects/astroid_ice_02.png"), "scale_bonus": 1.08},
]
const CRYSTAL_ASTEROID_TEXTURES := [
	{"texture": preload("res://assets/objects/astroid_crystal_01.png"), "scale_bonus": 1.18},
	{"texture": preload("res://assets/objects/astroid_crystal_02.png"), "scale_bonus": 1.1},
]
const DEBRIS_TEXTURES := [
	{"texture": preload("res://assets/objects/space_debris_01.png"), "scale_bonus": 1.16},
	{"texture": preload("res://assets/objects/space_debris_02.png"), "scale_bonus": 1.1},
]
const ENGINE_UPGRADE_ICON := preload("res://assets/icons/engine_upgrade.png")
const CARGO_UPGRADE_ICON := preload("res://assets/icons/cargo_upgrade.png")
const MINING_UPGRADE_ICON := preload("res://assets/icons/mining_upgrade.png")
const FUEL_UPGRADE_ICON := preload("res://assets/icons/fuel_tank_upgrade.png")
const SHIELD_UPGRADE_ICON := preload("res://assets/icons/shield_upgrade.png")
const HULL_UPGRADE_ICON := preload("res://assets/icons/hull_upgrade.png")
const LASER_UPGRADE_ICON := preload("res://assets/icons/lazer_upgrade.png")
const MISSILE_UPGRADE_ICON := preload("res://assets/icons/missle_upgrade.png")
const REPAIR_HULL_ICON := preload("res://assets/icons/repair_hull.png")
const REFUEL_SHIP_ICON := preload("res://assets/icons/refuel_ship.png")
const REFINER_ROOM_ICON := preload("res://assets/icons/Refiner_refining_room.png")
const IRON_ORE_ITEM_ICON := preload("res://assets/objects/iron_ore.png")
const NICKEL_ORE_ITEM_ICON := preload("res://assets/objects/nickel_ore.png")
const COPPER_ORE_ITEM_ICON := preload("res://assets/objects/copper_ore.png")
const TITANIUM_ORE_ITEM_ICON := preload("res://assets/objects/titanium_ore.png")
const ENEMY_SHIP_TEXTURE_01 := preload("res://assets/objects/ships/enemy_ship_01.png")
const ENEMY_SHIP_TEXTURE_02 := preload("res://assets/objects/ships/enemy_ship_02.png")
const GAME_MUSIC := preload("res://assets/audio/music/Starlite Dreams.ogg")
const UI_CLICK_SOUND := preload("res://assets/audio/sounds/ui_click_confirm.wav")
const SCAN_SOUND := preload("res://assets/audio/sounds/scan.wav")
const MINING_SOUND := preload("res://assets/audio/sounds/mining.wav")
const LASER_SOUND := preload("res://assets/audio/sounds/lazer.wav")
const MISSILE_SOUND := preload("res://assets/audio/sounds/missile.wav")
const LOCK_SOUND := preload("res://assets/audio/sounds/lock-on.wav")
const IMPACT_SOUND := preload("res://assets/audio/sounds/impact.wav")
const PICKUP_SOUND := preload("res://assets/audio/sounds/pick_ups.wav")
const ALERT_SOUND := preload("res://assets/audio/sounds/warning_alert.wav")

const ORE := STARHAUL_DATA_LIB.ORE
const NICKEL := STARHAUL_DATA_LIB.NICKEL
const COPPER := STARHAUL_DATA_LIB.COPPER
const TITANIUM := STARHAUL_DATA_LIB.TITANIUM
const COBALT := STARHAUL_DATA_LIB.COBALT
const SILVER := STARHAUL_DATA_LIB.SILVER
const GOLD := STARHAUL_DATA_LIB.GOLD
const LINDRITE := STARHAUL_DATA_LIB.LINDRITE
const IRON_INGOT := STARHAUL_DATA_LIB.IRON_INGOT
const NICKEL_INGOT := STARHAUL_DATA_LIB.NICKEL_INGOT
const COPPER_INGOT := STARHAUL_DATA_LIB.COPPER_INGOT
const TITANIUM_INGOT := STARHAUL_DATA_LIB.TITANIUM_INGOT
const COBALT_INGOT := STARHAUL_DATA_LIB.COBALT_INGOT
const SILVER_INGOT := STARHAUL_DATA_LIB.SILVER_INGOT
const GOLD_INGOT := STARHAUL_DATA_LIB.GOLD_INGOT
const LINDRITE_INGOT := STARHAUL_DATA_LIB.LINDRITE_INGOT
const CRYSTAL := STARHAUL_DATA_LIB.CRYSTAL
const ICE := STARHAUL_DATA_LIB.ICE
const SCRAP := STARHAUL_DATA_LIB.SCRAP
const ALLOY := STARHAUL_DATA_LIB.ALLOY
const FOCUS_CRYSTAL := STARHAUL_DATA_LIB.FOCUS_CRYSTAL
const FUEL_CELL := STARHAUL_DATA_LIB.FUEL_CELL
const CIRCUIT := STARHAUL_DATA_LIB.CIRCUIT
const CONDUIT_WIRE := STARHAUL_DATA_LIB.CONDUIT_WIRE
const HULL_PLATE := STARHAUL_DATA_LIB.HULL_PLATE
const THRUSTER_NOZZLE := STARHAUL_DATA_LIB.THRUSTER_NOZZLE
const SENSOR_LENS := STARHAUL_DATA_LIB.SENSOR_LENS
const GUIDANCE_CHIP := STARHAUL_DATA_LIB.GUIDANCE_CHIP
const IRIDIUM := STARHAUL_DATA_LIB.IRIDIUM
const QUANTUM_SHARD := STARHAUL_DATA_LIB.QUANTUM_SHARD
const HELIUM3 := STARHAUL_DATA_LIB.HELIUM3
const ANCIENT_RELIC := STARHAUL_DATA_LIB.ANCIENT_RELIC
const BLACKWAKE_TAG := STARHAUL_DATA_LIB.BLACKWAKE_TAG
const TARGETING_ARRAY := STARHAUL_DATA_LIB.TARGETING_ARRAY
const PLASMA_COIL := STARHAUL_DATA_LIB.PLASMA_COIL
const INVENTORY_SLOT_COUNT := 12
const STARTING_STORAGE_SLOTS := 8
const SHIP_STACK_LIMIT := 150
const STATION_STACK_LIMIT := 300
const COMBAT_LOCK_TIME := 0.6
const PRIMARY_LASER_RANGE := 430.0
const PRIMARY_LASER_DAMAGE := 6
const PRIMARY_LASER_INTERVAL := 0.16
const SPECIAL_MISSILE_DAMAGE := 16
const SPECIAL_MISSILE_COOLDOWN := 4.0
const SPECIAL_MISSILE_MAX_AMMO := 6
const MISSION_OFFER_MIN_LIFETIME := 120.0
const MISSION_OFFER_MAX_LIFETIME := 220.0
const MISSION_OFFER_COUNT := 6
const SCAN_HOLD_THRESHOLD := 0.28
const SCAN_COOLDOWN_DURATION := 3.8
const SCAN_RADIUS := 640.0
const MAP_HALF_SPAN := 2200.0
const MAP_FULL_SPAN := MAP_HALF_SPAN * 2.0
const SYSTEM_GRID_SIZE := 5
const MAP_RESOURCE_BASE_COUNT := 18
const MAP_JUMP_BASE_FUEL_COST := 10.0
const MAP_JUMP_FUEL_PER_STEP := 4.0
const MAP_JUMP_COOLDOWN := 6.0
const MAX_PLAYER_LEVEL := 100
const SCAN_DATA_RESOURCE_COOLDOWN := 45.0
const SCAN_DATA_HOSTILE_COOLDOWN := 40.0
const SCAN_DATA_MAJOR_OBJECT_COOLDOWN := 90.0
const TRACKER_PANEL_WIDTH := 256.0
const RESEARCH_TREE_BRANCHES := STARHAUL_DATA_LIB.RESEARCH_TREE_BRANCHES
const CRAFTING_RECIPES := STARHAUL_DATA_LIB.CRAFTING_RECIPES
const RESEARCH_TREE_NODE_COUNT := 100
const RESEARCH_TREE_COLUMNS := 20
const RESEARCH_TREE_NODE_SIZE := Vector2(144, 92)
const RESEARCH_TREE_ROOT_X := 420.0
const RESEARCH_TREE_START_Y := 150.0
const RESEARCH_TREE_COLUMN_SPACING := 204.0
const RESEARCH_TREE_ROW_SPACING := 188.0
const RESEARCH_TREE_DRAG_THRESHOLD := 10.0
const METALLIC_ORE_TYPES: Array[StringName] = STARHAUL_DATA_LIB.METALLIC_ORE_TYPES
const ITEM_ORDER := STARHAUL_DATA_LIB.ITEM_ORDER
const FACTIONS := STARHAUL_DATA_LIB.FACTIONS
const FACTION_RANK_DATA := STARHAUL_DATA_LIB.FACTION_RANK_DATA
const FACTION_SERVICE_PLANS := STARHAUL_DATA_LIB.FACTION_SERVICE_PLANS
const SKILL_TREE_LOCKS := STARHAUL_DATA_LIB.SKILL_TREE_LOCKS
const SKILL_TREE_NODES := STARHAUL_DATA_LIB.SKILL_TREE_NODES
const ONBOARDING_STEP_ORDER := STARHAUL_DATA_LIB.ONBOARDING_STEP_ORDER
const ONBOARDING_STEP_DATA := STARHAUL_DATA_LIB.ONBOARDING_STEP_DATA

# --- Scene references ---
@onready var player = $Player
@onready var station = $Station
@onready var station_ring: Sprite2D = $Station/StationRing
@onready var station_inner: Sprite2D = $Station/StationInner
@onready var canvas_modulate: CanvasModulate = $CanvasModulate
@onready var sun_root: Node2D = $SunRoot
@onready var resource_layer = $Resources
@onready var hud_layer: CanvasLayer = $HUD
@onready var ship_caption: Label = $HUD/MarginContainer/RootLayout/TopBar/ShipPanel/ShipMargin/ShipVBox/ShipCaption
@onready var ship_name: Label = $HUD/MarginContainer/RootLayout/TopBar/ShipPanel/ShipMargin/ShipVBox/ShipName
@onready var ship_class: Label = $HUD/MarginContainer/RootLayout/TopBar/ShipPanel/ShipMargin/ShipVBox/ShipClass
@onready var arm_button: Button = $HUD/MarginContainer/RootLayout/TopBar/ArmButton
@onready var level_value: Label = $HUD/MarginContainer/RootLayout/TopBar/StatsPanel/StatsMargin/StatsRow/LevelBlock/LevelValue
@onready var credits_value: Label = $HUD/MarginContainer/RootLayout/TopBar/StatsPanel/StatsMargin/StatsRow/CreditsBlock/CreditsValue
@onready var cargo_value: Label = $HUD/MarginContainer/RootLayout/TopBar/StatsPanel/StatsMargin/StatsRow/CargoBlock/CargoValue
@onready var fuel_value: Label = $HUD/MarginContainer/RootLayout/TopBar/StatsPanel/StatsMargin/StatsRow/FuelBlock/FuelValue
@onready var hull_value: Label = $HUD/MarginContainer/RootLayout/TopBar/StatsPanel/StatsMargin/StatsRow/HullBlock/HullValue
@onready var prompt_label: Label = $HUD/PromptPanel/PromptMargin/PromptLabel
@onready var onboarding_panel: PanelContainer = $HUD/OnboardingPanel
@onready var onboarding_margin: MarginContainer = $HUD/OnboardingPanel/OnboardingMargin
@onready var onboarding_vbox: VBoxContainer = $HUD/OnboardingPanel/OnboardingMargin/OnboardingVBox
@onready var onboarding_title: Label = $HUD/OnboardingPanel/OnboardingMargin/OnboardingVBox/OnboardingTitle
@onready var onboarding_status: Label = $HUD/OnboardingPanel/OnboardingMargin/OnboardingVBox/OnboardingStatus
@onready var onboarding_body: Label = $HUD/OnboardingPanel/OnboardingMargin/OnboardingVBox/OnboardingBody
@onready var monitor_panel: PanelContainer = $HUD/MonitorPanel
@onready var monitor_caption: Label = $HUD/MonitorPanel/MonitorMargin/MonitorVBox/MonitorHeader/MonitorCaption
@onready var monitor_live: Label = $HUD/MonitorPanel/MonitorMargin/MonitorVBox/MonitorHeader/MonitorLive
@onready var monitor_log: RichTextLabel = $HUD/MonitorPanel/MonitorMargin/MonitorVBox/MonitorLog
@onready var combat_panel: PanelContainer = $HUD/CombatPanel
@onready var combat_caption: Label = $HUD/CombatPanel/CombatMargin/CombatVBox/CombatHeader/CombatCaption
@onready var combat_live: Label = $HUD/CombatPanel/CombatMargin/CombatVBox/CombatHeader/CombatLive
@onready var combat_mode_label: Label = $HUD/CombatPanel/CombatMargin/CombatVBox/CombatMode
@onready var combat_weapons_label: Label = $HUD/CombatPanel/CombatMargin/CombatVBox/CombatWeapons
@onready var combat_lock_label: Label = $HUD/CombatPanel/CombatMargin/CombatVBox/CombatLock
@onready var combat_target_label: Label = $HUD/CombatPanel/CombatMargin/CombatVBox/CombatTarget
@onready var fps_label: Label = $HUD/FpsLabel
@onready var popup_backdrop: ColorRect = $HUD/PopupBackdrop
@onready var guided_mission_popup: PanelContainer = $HUD/GuidedMissionPopup
@onready var guided_mission_popup_margin: MarginContainer = $HUD/GuidedMissionPopup/GuidedMissionPopupMargin
@onready var guided_mission_popup_vbox: VBoxContainer = $HUD/GuidedMissionPopup/GuidedMissionPopupMargin/GuidedMissionPopupVBox
@onready var guided_mission_popup_title: Label = $HUD/GuidedMissionPopup/GuidedMissionPopupMargin/GuidedMissionPopupVBox/GuidedMissionPopupHeader/GuidedMissionPopupTitle
@onready var guided_mission_popup_badge: Label = $HUD/GuidedMissionPopup/GuidedMissionPopupMargin/GuidedMissionPopupVBox/GuidedMissionPopupHeader/GuidedMissionPopupBadge
@onready var guided_mission_popup_step: Label = $HUD/GuidedMissionPopup/GuidedMissionPopupMargin/GuidedMissionPopupVBox/GuidedMissionPopupStep
@onready var guided_mission_popup_body: Label = $HUD/GuidedMissionPopup/GuidedMissionPopupMargin/GuidedMissionPopupVBox/GuidedMissionPopupBody
@onready var guided_mission_popup_secondary_button: Button = $HUD/GuidedMissionPopup/GuidedMissionPopupMargin/GuidedMissionPopupVBox/GuidedMissionPopupButtonsCenter/GuidedMissionPopupButtons/GuidedMissionPopupSecondaryButton
@onready var guided_mission_popup_primary_button: Button = $HUD/GuidedMissionPopup/GuidedMissionPopupMargin/GuidedMissionPopupVBox/GuidedMissionPopupButtonsCenter/GuidedMissionPopupButtons/GuidedMissionPopupPrimaryButton
@onready var dock_screen: Control = $HUD/DockScreen
@onready var dock_back_button: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/Header/BackButton
@onready var dock_close_button: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/Header/CloseButton
@onready var dock_subtitle: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/Header/HeaderLeft/Subtitle
@onready var dock_top_row: HBoxContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/TopRow
@onready var dock_status_value: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/TopRow/DockStatusPanel/DockStatusMargin/DockStatusVBox/DockStatusValue
@onready var dock_status_body: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/TopRow/DockStatusPanel/DockStatusMargin/DockStatusVBox/DockStatusBody
@onready var dock_ship_name: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/TopRow/ShipSummaryPanel/ShipSummaryMargin/ShipSummaryVBox/ShipSummaryName
@onready var dock_ship_stats: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/TopRow/ShipSummaryPanel/ShipSummaryMargin/ShipSummaryVBox/ShipSummaryStats
@onready var dock_credits_value: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/Header/CreditsPanel/CreditsMargin/CreditsVBox/CreditsValue
@onready var dock_credits_subtext: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/Header/CreditsPanel/CreditsMargin/CreditsVBox/CreditsSubtext
@onready var pilot_summary: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/TopRow/PilotPanel/PilotMargin/PilotVBox/PilotSummary
@onready var pilot_profile_button: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/TopRow/PilotPanel/PilotMargin/PilotVBox/PilotProfileButton
@onready var main_menu_panel: PanelContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/MainMenuPanel
@onready var main_menu_summary_panel: PanelContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/MainMenuPanel/MainMenuMargin/MainMenuCenter/MainMenuVBox/MainMenuSummaryPanel
@onready var main_menu_summary: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/MainMenuPanel/MainMenuMargin/MainMenuCenter/MainMenuVBox/MainMenuSummaryPanel/MainMenuSummaryMargin/MainMenuSummary
@onready var exchange_room_button: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/MainMenuPanel/MainMenuMargin/MainMenuCenter/MainMenuVBox/MainMenuButtons/ExchangeRoomButton
@onready var storage_room_button: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/MainMenuPanel/MainMenuMargin/MainMenuCenter/MainMenuVBox/MainMenuButtons/StorageRoomButton
@onready var refinery_room_button: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/MainMenuPanel/MainMenuMargin/MainMenuCenter/MainMenuVBox/MainMenuButtons/RefineryRoomButton
@onready var crafting_room_button: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/MainMenuPanel/MainMenuMargin/MainMenuCenter/MainMenuVBox/MainMenuButtons/CraftingRoomButton
@onready var shipyard_room_button: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/MainMenuPanel/MainMenuMargin/MainMenuCenter/MainMenuVBox/MainMenuButtons/ShipyardRoomButton
@onready var crew_room_button: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/MainMenuPanel/MainMenuMargin/MainMenuCenter/MainMenuVBox/MainMenuButtons/CrewRoomButton
@onready var research_room_button: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/MainMenuPanel/MainMenuMargin/MainMenuCenter/MainMenuVBox/MainMenuButtons/ResearchRoomButton
@onready var faction_room_button: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/MainMenuPanel/MainMenuMargin/MainMenuCenter/MainMenuVBox/MainMenuButtons/FactionRoomButton
@onready var mission_room_button: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/MainMenuPanel/MainMenuMargin/MainMenuCenter/MainMenuVBox/MainMenuButtons/MissionRoomButton
@onready var cargo_room_button: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/MainMenuPanel/MainMenuMargin/MainMenuCenter/MainMenuVBox/MainMenuButtons/CargoRoomButton
@onready var dock_rooms: GridContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow
@onready var market_panel: PanelContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/MarketPanel
@onready var cargo_manifest: VBoxContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/MarketPanel/MarketMargin/MarketVBox/MarketColumns/CargoMarketPanel/CargoMarketMargin/CargoMarketVBox/CargoManifestScroll/CargoManifest
@onready var sell_summary: RichTextLabel = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/MarketPanel/MarketMargin/MarketVBox/MarketColumns/MarketStatusPanel/MarketStatusMargin/MarketStatusVBox/SellSummary
@onready var sell_button: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/MarketPanel/MarketMargin/MarketVBox/SellButton
@onready var refuel_button: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/Header/RefuelButton
@onready var bounty_turn_in_button: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/MarketPanel/MarketMargin/MarketVBox/BountyTurnInButton
@onready var storage_panel: PanelContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/StoragePanel
@onready var ship_storage_panel: PanelContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/StoragePanel/StorageMargin/StorageVBox/StorageColumns/ShipStoragePanel
@onready var ship_storage_summary: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/StoragePanel/StorageMargin/StorageVBox/StorageColumns/ShipStoragePanel/ShipStorageMargin/ShipStorageVBox/ShipStorageSummary
@onready var ship_storage_grid: GridContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/StoragePanel/StorageMargin/StorageVBox/StorageColumns/ShipStoragePanel/ShipStorageMargin/ShipStorageVBox/ShipStorageGrid
@onready var ship_storage_hint: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/StoragePanel/StorageMargin/StorageVBox/StorageColumns/ShipStoragePanel/ShipStorageMargin/ShipStorageVBox/ShipStorageHint
@onready var station_storage_panel: PanelContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/StoragePanel/StorageMargin/StorageVBox/StorageColumns/StationStoragePanel
@onready var storage_summary: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/StoragePanel/StorageMargin/StorageVBox/StorageColumns/StationStoragePanel/StationStorageMargin/StationStorageVBox/StorageSummary
@onready var storage_grid: GridContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/StoragePanel/StorageMargin/StorageVBox/StorageColumns/StationStoragePanel/StationStorageMargin/StationStorageVBox/StorageGrid
@onready var storage_hint: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/StoragePanel/StorageMargin/StorageVBox/StorageColumns/StationStoragePanel/StationStorageMargin/StationStorageVBox/StorageHint
@onready var storage_expand_button: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/StoragePanel/StorageMargin/StorageVBox/StorageColumns/StationStoragePanel/StationStorageMargin/StationStorageVBox/StorageExpandButton
@onready var refinery_panel: PanelContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/RefineryPanel
@onready var refinery_ship_tab_button: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/RefineryPanel/RefineryMargin/RefineryVBox/RefineryTabs/RefineryShipTabButton
@onready var refinery_station_tab_button: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/RefineryPanel/RefineryMargin/RefineryVBox/RefineryTabs/RefineryStationTabButton
@onready var refinery_inventory_caption: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/RefineryPanel/RefineryMargin/RefineryVBox/RefineryColumns/RefineryInventoryPanel/RefineryInventoryMargin/RefineryInventoryVBox/RefineryInventoryCaption
@onready var refinery_inventory_header: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/RefineryPanel/RefineryMargin/RefineryVBox/RefineryColumns/RefineryInventoryPanel/RefineryInventoryMargin/RefineryInventoryVBox/RefineryInventoryHeader
@onready var refinery_inventory_grid: GridContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/RefineryPanel/RefineryMargin/RefineryVBox/RefineryColumns/RefineryInventoryPanel/RefineryInventoryMargin/RefineryInventoryVBox/RefineryInventoryGrid
@onready var refinery_inventory_hint: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/RefineryPanel/RefineryMargin/RefineryVBox/RefineryColumns/RefineryInventoryPanel/RefineryInventoryMargin/RefineryInventoryVBox/RefineryInventoryHint
@onready var refinery_machine_label: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/RefineryPanel/RefineryMargin/RefineryVBox/RefineryColumns/RefineryControlPanel/RefineryControlMargin/RefineryControlVBox/RefineryVisualCenter/RefineryVisualVBox/RefineryMachineLabel
@onready var refinery_core_icon: TextureRect = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/RefineryPanel/RefineryMargin/RefineryVBox/RefineryColumns/RefineryControlPanel/RefineryControlMargin/RefineryControlVBox/RefineryVisualCenter/RefineryVisualVBox/RefineryBodyRow/RefineryCoreColumn/RefineryCorePanel/RefineryCoreMargin/RefineryCoreVBox/RefineryCoreIcon
@onready var refinery_input_card: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/RefineryPanel/RefineryMargin/RefineryVBox/RefineryColumns/RefineryControlPanel/RefineryControlMargin/RefineryControlVBox/RefineryVisualCenter/RefineryVisualVBox/RefineryBodyRow/RefineryInputColumn/RefineryInputCard
@onready var refinery_input_readout: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/RefineryPanel/RefineryMargin/RefineryVBox/RefineryColumns/RefineryControlPanel/RefineryControlMargin/RefineryControlVBox/RefineryVisualCenter/RefineryVisualVBox/RefineryBodyRow/RefineryInputColumn/RefineryInputReadout
@onready var refinery_output_card: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/RefineryPanel/RefineryMargin/RefineryVBox/RefineryColumns/RefineryControlPanel/RefineryControlMargin/RefineryControlVBox/RefineryVisualCenter/RefineryVisualVBox/RefineryBodyRow/RefineryOutputColumn/RefineryOutputCard
@onready var refinery_output_readout: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/RefineryPanel/RefineryMargin/RefineryVBox/RefineryColumns/RefineryControlPanel/RefineryControlMargin/RefineryControlVBox/RefineryVisualCenter/RefineryVisualVBox/RefineryBodyRow/RefineryOutputColumn/RefineryOutputReadout
@onready var refinery_progress: ProgressBar = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/RefineryPanel/RefineryMargin/RefineryVBox/RefineryColumns/RefineryControlPanel/RefineryControlMargin/RefineryControlVBox/RefineryVisualCenter/RefineryVisualVBox/RefineryBodyRow/RefineryCoreColumn/RefineryProgress
@onready var refinery_selected_input: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/RefineryPanel/RefineryMargin/RefineryVBox/RefineryColumns/RefineryControlPanel/RefineryControlMargin/RefineryControlVBox/RefinerySelectedInput
@onready var refinery_selected_output: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/RefineryPanel/RefineryMargin/RefineryVBox/RefineryColumns/RefineryControlPanel/RefineryControlMargin/RefineryControlVBox/RefinerySelectedOutput
@onready var refinery_summary: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/RefineryPanel/RefineryMargin/RefineryVBox/RefineryColumns/RefineryControlPanel/RefineryControlMargin/RefineryControlVBox/RefinerySummary
@onready var refine_button: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/RefineryPanel/RefineryMargin/RefineryVBox/RefineryColumns/RefineryControlPanel/RefineryControlMargin/RefineryControlVBox/RefineButton
@onready var crafting_panel: PanelContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/CraftingPanel
@onready var crafting_summary: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/CraftingPanel/CraftingMargin/CraftingVBox/CraftingSummary
@onready var crafting_recipe_list: VBoxContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/CraftingPanel/CraftingMargin/CraftingVBox/CraftingColumns/CraftingRecipePanel/CraftingRecipeMargin/CraftingRecipeVBox/CraftingRecipeScroll/CraftingRecipeList
@onready var crafting_detail_title: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/CraftingPanel/CraftingMargin/CraftingVBox/CraftingColumns/CraftingDetailPanel/CraftingDetailMargin/CraftingDetailVBox/CraftingDetailTitle
@onready var crafting_detail_meta: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/CraftingPanel/CraftingMargin/CraftingVBox/CraftingColumns/CraftingDetailPanel/CraftingDetailMargin/CraftingDetailVBox/CraftingDetailMeta
@onready var crafting_detail_summary: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/CraftingPanel/CraftingMargin/CraftingVBox/CraftingColumns/CraftingDetailPanel/CraftingDetailMargin/CraftingDetailVBox/CraftingDetailSummary
@onready var crafting_detail_costs: RichTextLabel = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/CraftingPanel/CraftingMargin/CraftingVBox/CraftingColumns/CraftingDetailPanel/CraftingDetailMargin/CraftingDetailVBox/CraftingDetailCosts
@onready var crafting_detail_button: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/CraftingPanel/CraftingMargin/CraftingVBox/CraftingColumns/CraftingDetailPanel/CraftingDetailMargin/CraftingDetailVBox/CraftingDetailButton
@onready var mission_board_panel: PanelContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/MissionBoardPanel
@onready var mission_board_summary: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/MissionBoardPanel/MissionBoardMargin/MissionBoardVBox/MissionBoardSummary
@onready var mission_available_button: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/MissionBoardPanel/MissionBoardMargin/MissionBoardVBox/MissionBoardTabs/MissionAvailableButton
@onready var mission_active_button: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/MissionBoardPanel/MissionBoardMargin/MissionBoardVBox/MissionBoardTabs/MissionActiveButton
@onready var mission_offer_list: VBoxContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/MissionBoardPanel/MissionBoardMargin/MissionBoardVBox/MissionBoardScroll/MissionOfferList
@onready var shipyard_panel: PanelContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ShipyardPanel
@onready var shipyard_info: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ShipyardPanel/ShipyardMargin/ShipyardVBox/ShipyardInfo
@onready var engine_button: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ShipyardPanel/ShipyardMargin/ShipyardVBox/ShipyardColumns/ShipUpgradePanel/ShipUpgradeMargin/ShipUpgradeVBox/ShipUpgradeGrid/EngineButton
@onready var cargo_button: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ShipyardPanel/ShipyardMargin/ShipyardVBox/ShipyardColumns/ShipUpgradePanel/ShipUpgradeMargin/ShipUpgradeVBox/ShipUpgradeGrid/CargoButton
@onready var mining_button: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ShipyardPanel/ShipyardMargin/ShipyardVBox/ShipyardColumns/ShipUpgradePanel/ShipUpgradeMargin/ShipUpgradeVBox/ShipUpgradeGrid/MiningButton
@onready var fuel_button: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ShipyardPanel/ShipyardMargin/ShipyardVBox/ShipyardColumns/ShipUpgradePanel/ShipUpgradeMargin/ShipUpgradeVBox/ShipUpgradeGrid/FuelButton
@onready var shield_button: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ShipyardPanel/ShipyardMargin/ShipyardVBox/ShipyardColumns/CombatUpgradePanel/CombatUpgradeMargin/CombatUpgradeVBox/CombatUpgradeGrid/ShieldButton
@onready var hull_button: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ShipyardPanel/ShipyardMargin/ShipyardVBox/ShipyardColumns/CombatUpgradePanel/CombatUpgradeMargin/CombatUpgradeVBox/CombatUpgradeGrid/HullButton
@onready var laser_button: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ShipyardPanel/ShipyardMargin/ShipyardVBox/ShipyardColumns/CombatUpgradePanel/CombatUpgradeMargin/CombatUpgradeVBox/CombatUpgradeGrid/LaserButton
@onready var special_button: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ShipyardPanel/ShipyardMargin/ShipyardVBox/ShipyardColumns/CombatUpgradePanel/CombatUpgradeMargin/CombatUpgradeVBox/CombatUpgradeGrid/SpecialButton
@onready var repair_button: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ShipyardPanel/ShipyardMargin/ShipyardVBox/ShipyardColumns/ShipyardServicePanel/ShipyardServiceMargin/ShipyardServiceVBox/RepairButton
@onready var restock_button: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ShipyardPanel/ShipyardMargin/ShipyardVBox/ShipyardColumns/ShipyardServicePanel/ShipyardServiceMargin/ShipyardServiceVBox/RestockButton
@onready var skills_panel: PanelContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/SkillsPanel
@onready var skills_vbox: VBoxContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/SkillsPanel/SkillsMargin/SkillsVBox
@onready var skill_points_label: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/SkillsPanel/SkillsMargin/SkillsVBox/SkillPointsLabel
@onready var skill_tree_hint: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/SkillsPanel/SkillsMargin/SkillsVBox/SkillTreeHint
@onready var training_soon_panel: PanelContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/SkillsPanel/SkillsMargin/SkillsVBox/TrainingSoonCenter/TrainingSoonPanel
@onready var training_soon_title: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/SkillsPanel/SkillsMargin/SkillsVBox/TrainingSoonCenter/TrainingSoonPanel/TrainingSoonMargin/TrainingSoonVBox/TrainingSoonTitle
@onready var training_soon_text: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/SkillsPanel/SkillsMargin/SkillsVBox/TrainingSoonCenter/TrainingSoonPanel/TrainingSoonMargin/TrainingSoonVBox/TrainingSoonText
@onready var research_panel: PanelContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ResearchPanel
@onready var research_summary: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ResearchPanel/ResearchMargin/ResearchVBox/ResearchHeaderRow/ResearchSummary
@onready var research_units_label: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ResearchPanel/ResearchMargin/ResearchVBox/ResearchHeaderRow/ResearchUploadPanel/ResearchUploadMargin/ResearchUploadVBox/ResearchUnitsLabel
@onready var research_canister_label: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ResearchPanel/ResearchMargin/ResearchVBox/ResearchHeaderRow/ResearchUploadPanel/ResearchUploadMargin/ResearchUploadVBox/ResearchCanisterLabel
@onready var research_upload_button: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ResearchPanel/ResearchMargin/ResearchVBox/ResearchHeaderRow/ResearchUploadPanel/ResearchUploadMargin/ResearchUploadVBox/ResearchUploadButton
@onready var research_branch_badge: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ResearchPanel/ResearchMargin/ResearchVBox/ResearchHeaderRow/ResearchBranchBadge
@onready var research_tabs: HBoxContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ResearchPanel/ResearchMargin/ResearchVBox/ResearchTabsPanel/ResearchTabsMargin/ResearchTabs
@onready var research_hint: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ResearchPanel/ResearchMargin/ResearchVBox/ResearchBodyRow/ResearchViewportPanel/ResearchViewportMargin/ResearchViewportVBox/ResearchHint
@onready var research_tree_frame: PanelContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ResearchPanel/ResearchMargin/ResearchVBox/ResearchBodyRow/ResearchViewportPanel/ResearchViewportMargin/ResearchViewportVBox/ResearchTreeFrame
@onready var research_tree_scroll: ScrollContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ResearchPanel/ResearchMargin/ResearchVBox/ResearchBodyRow/ResearchViewportPanel/ResearchViewportMargin/ResearchViewportVBox/ResearchTreeFrame/ResearchTreeScroll
@onready var research_tree_canvas: Control = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ResearchPanel/ResearchMargin/ResearchVBox/ResearchBodyRow/ResearchViewportPanel/ResearchViewportMargin/ResearchViewportVBox/ResearchTreeFrame/ResearchTreeScroll/ResearchTreeCanvas
@onready var research_inspector_title: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ResearchPanel/ResearchMargin/ResearchVBox/ResearchBodyRow/ResearchInspectorPanel/ResearchInspectorMargin/ResearchInspectorVBox/ResearchInspectorTitle
@onready var research_inspector_meta: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ResearchPanel/ResearchMargin/ResearchVBox/ResearchBodyRow/ResearchInspectorPanel/ResearchInspectorMargin/ResearchInspectorVBox/ResearchInspectorMeta
@onready var research_inspector_summary: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ResearchPanel/ResearchMargin/ResearchVBox/ResearchBodyRow/ResearchInspectorPanel/ResearchInspectorMargin/ResearchInspectorVBox/ResearchInspectorSummary
@onready var research_inspector_description: RichTextLabel = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ResearchPanel/ResearchMargin/ResearchVBox/ResearchBodyRow/ResearchInspectorPanel/ResearchInspectorMargin/ResearchInspectorVBox/ResearchInspectorDescription
@onready var research_unlock_button: Button = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ResearchPanel/ResearchMargin/ResearchVBox/ResearchBodyRow/ResearchInspectorPanel/ResearchInspectorMargin/ResearchInspectorVBox/ResearchUnlockButton
@onready var research_footer_status: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ResearchPanel/ResearchMargin/ResearchVBox/ResearchFooterPanel/ResearchFooterMargin/ResearchFooterStatus
@onready var factions_panel: PanelContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/FactionsPanel
@onready var factions_summary: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/FactionsPanel/FactionsMargin/FactionsVBox/FactionsSummary
@onready var pilot_detail_text: RichTextLabel = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/FactionsPanel/FactionsMargin/FactionsVBox/ProfileColumns/PilotDetailPanel/PilotDetailMargin/PilotDetailVBox/PilotDetailText
@onready var faction_list: RichTextLabel = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/FactionsPanel/FactionsMargin/FactionsVBox/ProfileColumns/FactionDetailPanel/FactionDetailMargin/FactionDetailVBox/FactionList
@onready var factions_hint: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/FactionsPanel/FactionsMargin/FactionsVBox/FactionsHint
@onready var dock_footer_status: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/Footer/FooterStatus
@onready var field_console_popup: PanelContainer = $HUD/FieldConsolePopup
@onready var field_console_title: Label = $HUD/FieldConsolePopup/FieldConsoleMargin/FieldConsoleVBox/FieldConsoleHeader/FieldConsoleTitle
@onready var field_console_close_button: Button = $HUD/FieldConsolePopup/FieldConsoleMargin/FieldConsoleVBox/FieldConsoleHeader/FieldConsoleCloseButton
@onready var field_mission_tab_button: Button = $HUD/FieldConsolePopup/FieldConsoleMargin/FieldConsoleVBox/FieldConsoleTabs/FieldMissionTabButton
@onready var field_cargo_tab_button: Button = $HUD/FieldConsolePopup/FieldConsoleMargin/FieldConsoleVBox/FieldConsoleTabs/FieldCargoTabButton
@onready var field_map_tab_button: Button = $HUD/FieldConsolePopup/FieldConsoleMargin/FieldConsoleVBox/FieldConsoleTabs/FieldMapTabButton
@onready var field_pilot_tab_button: Button = $HUD/FieldConsolePopup/FieldConsoleMargin/FieldConsoleVBox/FieldConsoleTabs/FieldPilotTabButton
@onready var field_skills_tab_button: Button = $HUD/FieldConsolePopup/FieldConsoleMargin/FieldConsoleVBox/FieldConsoleTabs/FieldSkillsTabButton
@onready var field_mission_panel: PanelContainer = $HUD/FieldConsolePopup/FieldConsoleMargin/FieldConsoleVBox/FieldConsoleBody/FieldMissionPanel
@onready var field_cargo_panel: PanelContainer = $HUD/FieldConsolePopup/FieldConsoleMargin/FieldConsoleVBox/FieldConsoleBody/FieldCargoPanel
@onready var field_map_panel: PanelContainer = $HUD/FieldConsolePopup/FieldConsoleMargin/FieldConsoleVBox/FieldConsoleBody/FieldMapPanel
@onready var field_pilot_panel: PanelContainer = $HUD/FieldConsolePopup/FieldConsoleMargin/FieldConsoleVBox/FieldConsoleBody/FieldPilotPanel
@onready var field_skills_panel: PanelContainer = $HUD/FieldConsolePopup/FieldConsoleMargin/FieldConsoleVBox/FieldConsoleBody/FieldSkillsPanel
@onready var field_mission_name: Label = $HUD/FieldConsolePopup/FieldConsoleMargin/FieldConsoleVBox/FieldConsoleBody/FieldMissionPanel/FieldMissionMargin/FieldMissionVBox/FieldMissionName
@onready var field_mission_list_title: Label = $HUD/FieldConsolePopup/FieldConsoleMargin/FieldConsoleVBox/FieldConsoleBody/FieldMissionPanel/FieldMissionMargin/FieldMissionVBox/FieldMissionListTitle
@onready var field_mission_list: VBoxContainer = $HUD/FieldConsolePopup/FieldConsoleMargin/FieldConsoleVBox/FieldConsoleBody/FieldMissionPanel/FieldMissionMargin/FieldMissionVBox/FieldMissionList
@onready var field_mission_description: Label = $HUD/FieldConsolePopup/FieldConsoleMargin/FieldConsoleVBox/FieldConsoleBody/FieldMissionPanel/FieldMissionMargin/FieldMissionVBox/FieldMissionDescription
@onready var field_mission_progress: Label = $HUD/FieldConsolePopup/FieldConsoleMargin/FieldConsoleVBox/FieldConsoleBody/FieldMissionPanel/FieldMissionMargin/FieldMissionVBox/FieldMissionProgress
@onready var field_mission_rewards: Label = $HUD/FieldConsolePopup/FieldConsoleMargin/FieldConsoleVBox/FieldConsoleBody/FieldMissionPanel/FieldMissionMargin/FieldMissionVBox/FieldMissionRewards
@onready var field_cargo_summary: Label = $HUD/FieldConsolePopup/FieldConsoleMargin/FieldConsoleVBox/FieldConsoleBody/FieldCargoPanel/FieldCargoMargin/FieldCargoVBox/FieldCargoSummary
@onready var field_cargo_grid: GridContainer = $HUD/FieldConsolePopup/FieldConsoleMargin/FieldConsoleVBox/FieldConsoleBody/FieldCargoPanel/FieldCargoMargin/FieldCargoVBox/FieldCargoGridCenter/FieldCargoGrid
@onready var field_map_info: Label = $HUD/FieldConsolePopup/FieldConsoleMargin/FieldConsoleVBox/FieldConsoleBody/FieldMapPanel/FieldMapMargin/FieldMapVBox/FieldMapInfo
@onready var field_map_grid: GridContainer = $HUD/FieldConsolePopup/FieldConsoleMargin/FieldConsoleVBox/FieldConsoleBody/FieldMapPanel/FieldMapMargin/FieldMapVBox/FieldMapGridCenter/FieldMapGrid
@onready var field_map_legend: Label = $HUD/FieldConsolePopup/FieldConsoleMargin/FieldConsoleVBox/FieldConsoleBody/FieldMapPanel/FieldMapMargin/FieldMapVBox/FieldMapLegend
@onready var field_map_status: Label = $HUD/FieldConsolePopup/FieldConsoleMargin/FieldConsoleVBox/FieldConsoleBody/FieldMapPanel/FieldMapMargin/FieldMapVBox/FieldMapStatus
@onready var field_pilot_summary: Label = $HUD/FieldConsolePopup/FieldConsoleMargin/FieldConsoleVBox/FieldConsoleBody/FieldPilotPanel/FieldPilotMargin/FieldPilotVBox/FieldPilotSummary
@onready var field_pilot_detail: RichTextLabel = $HUD/FieldConsolePopup/FieldConsoleMargin/FieldConsoleVBox/FieldConsoleBody/FieldPilotPanel/FieldPilotMargin/FieldPilotVBox/FieldPilotDetail
@onready var field_skills_summary: Label = $HUD/FieldConsolePopup/FieldConsoleMargin/FieldConsoleVBox/FieldConsoleBody/FieldSkillsPanel/FieldSkillsMargin/FieldSkillsVBox/FieldSkillsSummary
@onready var field_skills_list: VBoxContainer = $HUD/FieldConsolePopup/FieldConsoleMargin/FieldConsoleVBox/FieldConsoleBody/FieldSkillsPanel/FieldSkillsMargin/FieldSkillsVBox/FieldSkillsScroll/FieldSkillsList
@onready var mission_popup: PanelContainer = $HUD/MissionPopup
@onready var mission_popup_name: Label = $HUD/MissionPopup/MissionPopupMargin/MissionPopupVBox/MissionPopupName
@onready var mission_popup_description: Label = $HUD/MissionPopup/MissionPopupMargin/MissionPopupVBox/MissionPopupDescription
@onready var mission_popup_progress: Label = $HUD/MissionPopup/MissionPopupMargin/MissionPopupVBox/MissionPopupProgress
@onready var mission_popup_rewards: Label = $HUD/MissionPopup/MissionPopupMargin/MissionPopupVBox/MissionPopupRewards
@onready var close_mission_button: Button = $HUD/MissionPopup/MissionPopupMargin/MissionPopupVBox/MissionPopupHeader/CloseMissionButton
@onready var inventory_popup: PanelContainer = $HUD/InventoryPopup
@onready var inventory_summary: Label = $HUD/InventoryPopup/InventoryPopupMargin/InventoryPopupVBox/InventorySummary
@onready var inventory_grid: GridContainer = $HUD/InventoryPopup/InventoryPopupMargin/InventoryPopupVBox/InventoryGrid
@onready var close_inventory_button: Button = $HUD/InventoryPopup/InventoryPopupMargin/InventoryPopupVBox/InventoryPopupHeader/CloseInventoryButton
@onready var inventory_tooltip: PanelContainer = $HUD/InventoryTooltip
@onready var tooltip_name: Label = $HUD/InventoryTooltip/InventoryTooltipMargin/InventoryTooltipVBox/TooltipName
@onready var tooltip_body: Label = $HUD/InventoryTooltip/InventoryTooltipMargin/InventoryTooltipVBox/TooltipBody
@onready var transfer_popup: PanelContainer = $HUD/TransferPopup
@onready var transfer_popup_title: Label = $HUD/TransferPopup/TransferPopupMargin/TransferPopupVBox/TransferPopupTitle
@onready var transfer_popup_info: Label = $HUD/TransferPopup/TransferPopupMargin/TransferPopupVBox/TransferPopupInfo
@onready var transfer_amount: SpinBox = $HUD/TransferPopup/TransferPopupMargin/TransferPopupVBox/TransferAmount
@onready var transfer_cancel_button: Button = $HUD/TransferPopup/TransferPopupMargin/TransferPopupVBox/TransferPopupButtons/TransferCancelButton
@onready var transfer_confirm_button: Button = $HUD/TransferPopup/TransferPopupMargin/TransferPopupVBox/TransferPopupButtons/TransferConfirmButton
@onready var dock_prompt_popup: PanelContainer = $HUD/DockPromptPopup
@onready var dock_prompt_title: Label = $HUD/DockPromptPopup/DockPromptMargin/DockPromptVBox/DockPromptTitle
@onready var dock_prompt_info: Label = $HUD/DockPromptPopup/DockPromptMargin/DockPromptVBox/DockPromptInfo
@onready var dock_prompt_no_button: Button = $HUD/DockPromptPopup/DockPromptMargin/DockPromptVBox/DockPromptButtons/DockPromptNoButton
@onready var dock_prompt_yes_button: Button = $HUD/DockPromptPopup/DockPromptMargin/DockPromptVBox/DockPromptButtons/DockPromptYesButton
@onready var boarding_prompt_popup: PanelContainer = $HUD/BoardingPromptPopup
@onready var boarding_prompt_title: Label = $HUD/BoardingPromptPopup/BoardingPromptMargin/BoardingPromptVBox/BoardingPromptTitle
@onready var boarding_prompt_info: Label = $HUD/BoardingPromptPopup/BoardingPromptMargin/BoardingPromptVBox/BoardingPromptInfo
@onready var boarding_prompt_board_button: Button = $HUD/BoardingPromptPopup/BoardingPromptMargin/BoardingPromptVBox/BoardingPromptButtons/BoardingPromptBoardButton
@onready var boarding_prompt_destroy_button: Button = $HUD/BoardingPromptPopup/BoardingPromptMargin/BoardingPromptVBox/BoardingPromptButtons/BoardingPromptDestroyButton
@onready var scan_mode_popup: PanelContainer = $HUD/ScanModePopup
@onready var scan_mode_title: Label = $HUD/ScanModePopup/ScanModeMargin/ScanModeVBox/ScanModeTitle
@onready var scan_mode_info: Label = $HUD/ScanModePopup/ScanModeMargin/ScanModeVBox/ScanModeInfo
@onready var resource_scan_scroll: ScrollContainer = $HUD/ScanModePopup/ScanModeMargin/ScanModeVBox/ResourceScanScroll
@onready var resource_scan_list: VBoxContainer = $HUD/ScanModePopup/ScanModeMargin/ScanModeVBox/ResourceScanScroll/ResourceScanList
@onready var general_scan_button: Button = $HUD/ScanModePopup/ScanModeMargin/ScanModeVBox/GeneralScanButton
@onready var hostile_scan_button: Button = $HUD/ScanModePopup/ScanModeMargin/ScanModeVBox/HostileScanButton
@onready var derelict_scan_button: Button = $HUD/ScanModePopup/ScanModeMargin/ScanModeVBox/DerelictScanButton
@onready var resource_scan_button: Button = $HUD/ScanModePopup/ScanModeMargin/ScanModeVBox/ResourceScanButton
@onready var bounty_scan_button: Button = $HUD/ScanModePopup/ScanModeMargin/ScanModeVBox/BountyScanButton
@onready var resource_scan_back_button: Button = $HUD/ScanModePopup/ScanModeMargin/ScanModeVBox/ResourceScanBackButton
@onready var close_scan_mode_button: Button = $HUD/ScanModePopup/ScanModeMargin/ScanModeVBox/CloseScanModeButton
@onready var tactical_map_popup: PanelContainer = $HUD/TacticalMapPopup
@onready var tactical_map_title: Label = $HUD/TacticalMapPopup/TacticalMapMargin/TacticalMapVBox/TacticalMapHeader/TacticalMapTitle
@onready var close_tactical_map_button: Button = $HUD/TacticalMapPopup/TacticalMapMargin/TacticalMapVBox/TacticalMapHeader/CloseTacticalMapButton
@onready var tactical_map_info: Label = $HUD/TacticalMapPopup/TacticalMapMargin/TacticalMapVBox/TacticalMapInfo
@onready var tactical_map_grid: GridContainer = $HUD/TacticalMapPopup/TacticalMapMargin/TacticalMapVBox/TacticalMapGrid
@onready var tactical_map_legend: Label = $HUD/TacticalMapPopup/TacticalMapMargin/TacticalMapVBox/TacticalMapLegend
@onready var tactical_map_status: Label = $HUD/TacticalMapPopup/TacticalMapMargin/TacticalMapVBox/TacticalMapStatus
@onready var pause_popup: PanelContainer = $HUD/PausePopup
@onready var pause_title: Label = $HUD/PausePopup/PauseMargin/PauseVBox/PauseTitle
@onready var pause_status: Label = $HUD/PausePopup/PauseMargin/PauseVBox/PauseStatus
@onready var resume_button: Button = $HUD/PausePopup/PauseMargin/PauseVBox/ResumeButton
@onready var save_button: Button = $HUD/PausePopup/PauseMargin/PauseVBox/SaveButton
@onready var load_button: Button = $HUD/PausePopup/PauseMargin/PauseVBox/LoadButton
@onready var options_button: Button = $HUD/PausePopup/PauseMargin/PauseVBox/OptionsButton
@onready var pause_main_menu_button: Button = $HUD/PausePopup/PauseMargin/PauseVBox/MainMenuButton
@onready var pause_quit_button: Button = $HUD/PausePopup/PauseMargin/PauseVBox/QuitButton
@onready var options_popup: PanelContainer = $HUD/OptionsPopup
@onready var options_visuals_button: Button = $HUD/OptionsPopup/OptionsMargin/OptionsVBox/OptionsTabs/OptionsVisualsButton
@onready var options_audio_button: Button = $HUD/OptionsPopup/OptionsMargin/OptionsVBox/OptionsTabs/OptionsAudioButton
@onready var options_gameplay_button: Button = $HUD/OptionsPopup/OptionsMargin/OptionsVBox/OptionsTabs/OptionsGameplayButton
@onready var options_visuals_section: VBoxContainer = $HUD/OptionsPopup/OptionsMargin/OptionsVBox/OptionsVisualsSection
@onready var options_audio_section: VBoxContainer = $HUD/OptionsPopup/OptionsMargin/OptionsVBox/OptionsAudioSection
@onready var options_gameplay_section: VBoxContainer = $HUD/OptionsPopup/OptionsMargin/OptionsVBox/OptionsGameplaySection
@onready var options_fullscreen_check: CheckBox = $HUD/OptionsPopup/OptionsMargin/OptionsVBox/OptionsVisualsSection/OptionsFullscreenCheck
@onready var options_vsync_check: CheckBox = $HUD/OptionsPopup/OptionsMargin/OptionsVBox/OptionsVisualsSection/OptionsVsyncCheck
@onready var options_show_fps_check: CheckBox = $HUD/OptionsPopup/OptionsMargin/OptionsVBox/OptionsVisualsSection/OptionsShowFpsCheck
@onready var options_camera_zoom_label: Label = $HUD/OptionsPopup/OptionsMargin/OptionsVBox/OptionsVisualsSection/OptionsCameraZoomLabel
@onready var options_camera_zoom_slider: HSlider = $HUD/OptionsPopup/OptionsMargin/OptionsVBox/OptionsVisualsSection/OptionsCameraZoomSlider
@onready var options_brightness_label: Label = $HUD/OptionsPopup/OptionsMargin/OptionsVBox/OptionsVisualsSection/OptionsBrightnessLabel
@onready var options_brightness_slider: HSlider = $HUD/OptionsPopup/OptionsMargin/OptionsVBox/OptionsVisualsSection/OptionsBrightnessSlider
@onready var options_hud_scale_label: Label = $HUD/OptionsPopup/OptionsMargin/OptionsVBox/OptionsVisualsSection/OptionsHudScaleLabel
@onready var options_hud_scale_slider: HSlider = $HUD/OptionsPopup/OptionsMargin/OptionsVBox/OptionsVisualsSection/OptionsHudScaleSlider
@onready var options_screen_shake_label: Label = $HUD/OptionsPopup/OptionsMargin/OptionsVBox/OptionsVisualsSection/OptionsScreenShakeLabel
@onready var options_screen_shake_slider: HSlider = $HUD/OptionsPopup/OptionsMargin/OptionsVBox/OptionsVisualsSection/OptionsScreenShakeSlider
@onready var options_parallax_strength_label: Label = $HUD/OptionsPopup/OptionsMargin/OptionsVBox/OptionsVisualsSection/OptionsParallaxStrengthLabel
@onready var options_parallax_strength_slider: HSlider = $HUD/OptionsPopup/OptionsMargin/OptionsVBox/OptionsVisualsSection/OptionsParallaxStrengthSlider
@onready var options_glow_strength_label: Label = $HUD/OptionsPopup/OptionsMargin/OptionsVBox/OptionsVisualsSection/OptionsGlowStrengthLabel
@onready var options_glow_strength_slider: HSlider = $HUD/OptionsPopup/OptionsMargin/OptionsVBox/OptionsVisualsSection/OptionsGlowStrengthSlider
@onready var options_master_volume_label: Label = $HUD/OptionsPopup/OptionsMargin/OptionsVBox/OptionsAudioSection/OptionsMasterVolumeLabel
@onready var options_master_volume_slider: HSlider = $HUD/OptionsPopup/OptionsMargin/OptionsVBox/OptionsAudioSection/OptionsMasterVolumeSlider
@onready var options_music_volume_label: Label = $HUD/OptionsPopup/OptionsMargin/OptionsVBox/OptionsAudioSection/OptionsMusicVolumeLabel
@onready var options_music_volume_slider: HSlider = $HUD/OptionsPopup/OptionsMargin/OptionsVBox/OptionsAudioSection/OptionsMusicVolumeSlider
@onready var options_sfx_volume_label: Label = $HUD/OptionsPopup/OptionsMargin/OptionsVBox/OptionsAudioSection/OptionsSfxVolumeLabel
@onready var options_sfx_volume_slider: HSlider = $HUD/OptionsPopup/OptionsMargin/OptionsVBox/OptionsAudioSection/OptionsSfxVolumeSlider
@onready var options_ui_volume_label: Label = $HUD/OptionsPopup/OptionsMargin/OptionsVBox/OptionsAudioSection/OptionsUiVolumeLabel
@onready var options_ui_volume_slider: HSlider = $HUD/OptionsPopup/OptionsMargin/OptionsVBox/OptionsAudioSection/OptionsUiVolumeSlider
@onready var options_engine_volume_label: Label = $HUD/OptionsPopup/OptionsMargin/OptionsVBox/OptionsAudioSection/OptionsEngineVolumeLabel
@onready var options_engine_volume_slider: HSlider = $HUD/OptionsPopup/OptionsMargin/OptionsVBox/OptionsAudioSection/OptionsEngineVolumeSlider
@onready var options_onboarding_check: CheckBox = $HUD/OptionsPopup/OptionsMargin/OptionsVBox/OptionsGameplaySection/OptionsOnboardingCheck
@onready var options_docking_prompt_check: CheckBox = $HUD/OptionsPopup/OptionsMargin/OptionsVBox/OptionsGameplaySection/OptionsDockingPromptCheck
@onready var options_close_button: Button = $HUD/OptionsPopup/OptionsMargin/OptionsVBox/OptionsCloseButton

# --- Runtime state ---
var rng := RandomNumberGenerator.new()
var starfield_far: Array[Dictionary] = []
var starfield_mid: Array[Dictionary] = []
var starfield_near: Array[Dictionary] = []
var ambient_debris: Array[Dictionary] = []
var world_fx_time := 0.0
var mining_effects: Array[Dictionary] = []
var scan_pulses: Array[Dictionary] = []
var inventory_slots: Array[Button] = []
var field_inventory_slots: Array[Button] = []
var field_skill_rows: Dictionary = {}
var ship_storage_slots: Array[Button] = []
var storage_slots: Array[Button] = []
var refinery_inventory_buttons: Array[Button] = []
var market_sell_buttons: Array[Button] = []
var mission_board_action_buttons: Array[Button] = []
var item_icons := {}
var telemetry_events: Array[Dictionary] = []
var last_dock_state := false
var cargo_full_alert_active := false
var onboarding_active := true
var onboarding_completed_steps := {}
var onboarding_completion_announced := false
var onboarding_completion_acknowledged := false
var onboarding_declined := false
var onboarding_offer_pending := true
var onboarding_current_step_popup := ""
var onboarding_popup_mode := ""
var onboarding_last_guidance_time := 0.0
var onboarding_highlight_pulse := 0.0
var onboarding_mine_target_id := -1
var pending_onboarding_mission_offer_index := -1
var pending_intro_popup_complete_mission_id := ""
var onboarding_move_progress := 0.0
const ONBOARDING_REMINDER_DELAY := 20.0
const ONBOARDING_MOVE_REQUIRED_TIME := 1.6
var return_to_dock_on_popup_close := false
var current_dock_room := ""
var pending_transfer := {}
var market_price_multipliers := {}
var market_update_timer := 0.0
var room_tooltips := STARHAUL_DATA_LIB.ROOM_TOOLTIPS.duplicate(true)
var station_greetings := STARHAUL_DATA_LIB.STATION_GREETINGS.duplicate(true)
var current_station_greeting := "Welcome back, pilot."

var credits := 90
var experience := 0
var level := 1
var skill_points := 1

const USE_SKILL_ORDER: Array[String] = [
	"piloting",
	"mining",
	"surveying",
	"combat",
	"salvage",
	"industry",
	"trade",
]
const USE_SKILL_MAX_LEVEL := 100
const MINING_STAGE_LEVEL_REQUIREMENTS: Array[int] = [0, 5, 10, 15, 25, 35, 45, 55, 65]
const MINING_EXTRACTION_SPEED_MILESTONES: Array[int] = [10, 30, 50, 70, 90]
const MINING_BONUS_YIELD_MILESTONES: Array[int] = [20, 40, 60, 80, 100]
const SURVEYING_DF_MILESTONES: Array[int] = [5, 20, 35, 50, 80]
const SURVEYING_COOLDOWN_MILESTONES: Array[int] = [10, 25, 40, 60, 90]
const SURVEYING_RELIABILITY_MILESTONES: Array[int] = [15, 30, 45, 70, 100]
const COMBAT_LASER_DAMAGE_MILESTONES: Array[int] = [5, 20, 35, 50, 80]
const COMBAT_LOCK_SPEED_MILESTONES: Array[int] = [10, 25, 40, 60, 90]
const COMBAT_SPECIAL_COOLDOWN_MILESTONES: Array[int] = [15, 30, 45, 70, 100]
const SALVAGE_SPEED_MILESTONES: Array[int] = [5, 20, 35, 50, 80]
const SALVAGE_YIELD_MILESTONES: Array[int] = [10, 25, 40, 60, 90]
const SALVAGE_CACHE_MILESTONES: Array[int] = [15, 30, 45, 70, 100]
const INDUSTRY_REFINING_SPEED_MILESTONES: Array[int] = [5, 25, 45, 65, 85]
const INDUSTRY_REFINING_QUALITY_MILESTONES: Array[int] = [10, 30, 50, 70, 90]
const INDUSTRY_CRAFTING_COST_MILESTONES: Array[int] = [15, 35, 55, 75, 95]
const INDUSTRY_REFINING_FEE_MILESTONES: Array[int] = [20, 40, 60, 80, 100]
const TRADE_SELL_VALUE_MILESTONES: Array[int] = [5, 20, 35, 50, 80]
const TRADE_MISSION_PAYOUT_MILESTONES: Array[int] = [10, 25, 40, 60, 90]
const TRADE_BOUNTY_PAYOUT_MILESTONES: Array[int] = [15, 30, 45, 70, 100]
const SALVAGE_SMALL_DERELICT_BOARDING_LEVEL := 10
const SALVAGE_STANDARD_DERELICT_BOARDING_LEVEL := 20
const SALVAGE_HOSTILE_BOARDING_LEVEL := 35
const MINING_RESOURCE_UNLOCKS := [
	{"level": 0, "label": "Iron"},
	{"level": 5, "label": "Copper"},
	{"level": 10, "label": "Nickel"},
	{"level": 15, "label": "Cobalt"},
	{"level": 25, "label": "Crystal"},
	{"level": 35, "label": "Titanium"},
	{"level": 45, "label": "Silver"},
	{"level": 55, "label": "Gold"},
	{"level": 65, "label": "Lindrite"},
]
const PILOTING_TRAVEL_FUEL_MILESTONES: Array[int] = [10, 25, 50, 75]
const PILOTING_BOOST_FUEL_MILESTONES: Array[int] = [35, 60, 85]
const PILOTING_LICENSE_MILESTONES := [
	{"level": 20, "name": "Basic Flight License II"},
	{"level": 40, "name": "Basic Flight License III"},
	{"level": 70, "name": "Advanced Flight License I"},
	{"level": 100, "name": "Advanced Flight License II"},
]
const USE_SKILL_DEFINITIONS := {
	"piloting": {
		"name": "Piloting",
		"description": "Flight hours earned through maneuvering, docking, and short-range travel.",
	},
	"mining": {
		"name": "Mining",
		"description": "Extraction experience earned from productive mining cycles and deeper ore access.",
	},
	"surveying": {
		"name": "Surveying",
		"description": "Field analysis earned from targeted scans, world sweeps, and data collection.",
	},
	"combat": {
		"name": "Combat",
		"description": "Weapons handling earned by landing hits in live engagements.",
	},
	"salvage": {
		"name": "Salvage",
		"description": "Recovery skill earned from wreck stripping, boarding, and debris work.",
	},
	"industry": {
		"name": "Industry",
		"description": "Processing skill earned through refining and fabrication work.",
	},
	"trade": {
		"name": "Trade",
		"description": "Brokerage skill earned from profitable sales and contract turnover.",
	},
}

var cargo := {}
var station_storage: Array[Dictionary] = []
var station_storage_capacity := STARTING_STORAGE_SLOTS
var station_storage_upgrades := 0

var upgrades := {
	"engine": 0,
	"cargo": 0,
	"mining": 0,
	"fuel": 0,
	"shield": 0,
	"hull": 0,
	"laser": 0,
	"special": 0,
}

var skills := {
	"efficiency": 0,
	"prospecting": 0,
	"contractor": 0,
}
var skill_node_ranks := {}
var research_tree_buttons: Array[Button] = []
var research_branch_buttons: Array[Button] = []
var crafting_recipe_buttons: Array[Button] = []
var research_tree_nodes: Array[Dictionary] = []
var research_node_ranks := {}
var research_units := 0
var data_fragments := 0
var claimed_scan_data := {}
var scan_data_cooldowns := {}
var research_tree_drag_active := false
var research_tree_dragging := false
var research_tree_drag_start_mouse := Vector2.ZERO
var research_tree_drag_start_scroll := Vector2.ZERO
var research_tree_click_candidate := ""
var selected_research_branch := "industry"
var selected_research_node_id := ""

var faction_reputation := {
	"paladins": 0,
	"freeport_assembly": 0,
	"blackwake": 0,
	"deepcore_consortium": 0,
	"recovery_corps": 0,
	"pathfinder_initiative": 0,
}

var ship_stats := {
	"speed": 300.0,
	"acceleration": 650.0,
	"cargo_capacity": 120.0,
	"mining_power": 1.0,
	"fuel_capacity": 120.0,
	"shield_bonus": 0.0,
	"hull_bonus": 0.0,
	"laser_damage_bonus": 0.0,
	"special_damage_bonus": 0.0,
}

var total_stats := {
	"ore_mined": 0,
	"crystals_mined": 0,
	"ice_mined": 0,
	"scrap_salvaged": 0,
	"credits_earned": 0,
	"missions_completed": 0,
}

var current_mission := {}
var active_missions: Array[Dictionary] = []
var current_mission_index := -1
var mission_offers: Array[Dictionary] = []
var mission_board_view := "available"
var next_mission_offer_uid := 1
var completed_intro_missions: Dictionary = {}
var intro_tab_visits: Dictionary = {}
var last_status_message := "Mine nearby asteroids, then sell cargo back at the station."
var current_fuel := 120.0
var low_fuel_warning_active := false
var docked_at_station := false
var docking_prompt_suppressed := false
var was_in_docking_range := false
var docking_pull_in_progress := false
var docking_menu_delay := -1.0
var docking_phase := ""
var docking_approach_target := Vector2.ZERO
var docking_final_target := Vector2.ZERO
var docking_side_label := ""
var combat_mode := false
var combat_test_spawn_timer := 3.5
var combat_test_spawned := false
var combat_contract_spawn_timer := 0.0
var hostile_contacts: Array[Dictionary] = []
var player_missiles: Array[Dictionary] = []
var active_laser_beams: Array[Dictionary] = []
var loot_pickups: Array[Dictionary] = []
var damage_floaters: Array[Dictionary] = []
var next_hostile_id := 1
var primary_laser_timer := 0.0
var special_weapon_cooldown := 0.0
var special_ammo := SPECIAL_MISSILE_MAX_AMMO
var scan_cooldown := 0.0
var scan_hold_time := 0.0
var scan_input_active := false
var scan_popup_opened_from_hold := false
var last_scan_mode := "general"
var scan_mode_view := "root"
var tracked_scan_contact := {}
var system_registry := {}
var current_system_id := "neutral_reach"
var current_map_coord := Vector2i(2, 1)
var current_map_data := {}
var current_system_data := {}
var discovered_maps := {}
var tactical_map_buttons: Array[Button] = []
var field_console_tab: String = "mission"
var use_skill_progress: Dictionary = {}
var last_piloting_position: Vector2 = Vector2.ZERO
var piloting_distance_accumulator: float = 0.0
var tab_console_held := false
var map_jump_cooldown := 0.0
var ambient_hostile_event_timer := 0.0
var pending_boarding_hostile_id := -1
var pending_boarding_derelict_id := 0
var pending_boarding_mode := ""
var lock_target_id := -1
var lock_progress := 0.0
var last_lock_target_id := -1
var player_hull := 100
var player_shield := 0.0
var player_shield_recharge_delay := 0.0
var last_announced_faction_ranks := {}
var hostile_laser_beams: Array[Dictionary] = []
var hostile_missiles: Array[Dictionary] = []
var shield_hit_effects: Array[Dictionary] = []

# --- Mutable gameplay data copies ---
var item_data := STARHAUL_DATA_LIB.ITEM_DATA.duplicate(true)
var resource_node_templates := STARHAUL_WORLD_LIB.build_resource_node_templates(
	ORE_ASTEROID_TEXTURES,
	NICKEL_ASTEROID_TEXTURES,
	COPPER_ASTEROID_TEXTURES,
	TITANIUM_ASTEROID_TEXTURES,
	ICE_ASTEROID_TEXTURES,
	CRYSTAL_ASTEROID_TEXTURES,
	DEBRIS_TEXTURES
)

var resource_trait_templates := STARHAUL_DATA_LIB.RESOURCE_TRAIT_TEMPLATES.duplicate(true)
var refinery_recipes := STARHAUL_DATA_LIB.REFINERY_RECIPES.duplicate(true)
var crafting_recipes: Array = STARHAUL_DATA_LIB.CRAFTING_RECIPES.duplicate(true)


# --- System / map data ---
func map_key(coord: Vector2i) -> String:
	return STARHAUL_WORLD_LIB.map_key(coord)


func build_system_registry() -> Dictionary:
	return STARHAUL_WORLD_LIB.build_system_registry(SYSTEM_GRID_SIZE, MAP_RESOURCE_BASE_COUNT)
var derelict_profiles := STARHAUL_DATA_LIB.DERELICT_PROFILES.duplicate(true)
var selected_crafting_recipe_id := ""


# --- World state helpers ---
func current_system_name() -> String:
	return str(current_system_data.get("name", "Unknown System"))


func current_map_name() -> String:
	return str(current_map_data.get("label", "Unknown Map"))


func current_map_control_state() -> String:
	return str(current_map_data.get("control_state", "neutral"))


func current_map_controlling_faction() -> String:
	return str(current_map_data.get("controlling_faction", ""))


func current_station_faction() -> String:
	return str(current_map_data.get("station_faction", ""))


func current_station_name() -> String:
	return str(current_map_data.get("station_name", "Orbital Dock"))


func has_station_in_current_map() -> bool:
	return bool(current_map_data.get("has_station", false))


func get_current_map_data() -> Dictionary:
	if not system_registry.has(current_system_id):
		return {}
	var system_data: Dictionary = system_registry[current_system_id]
	var maps: Dictionary = system_data.get("maps", {})
	return maps.get(map_key(current_map_coord), {})


func ensure_system_discovery(system_id: String) -> void:
	if discovered_maps.has(system_id):
		return
	discovered_maps[system_id] = {}


func mark_map_discovered(system_id: String, map_coord: Vector2i) -> void:
	ensure_system_discovery(system_id)
	discovered_maps[system_id][map_key(map_coord)] = true


func is_map_discovered(system_id: String, map_coord: Vector2i) -> bool:
	if not discovered_maps.has(system_id):
		return false
	return bool(discovered_maps[system_id].get(map_key(map_coord), false))


func reload_current_map_metadata() -> void:
	current_system_data = system_registry.get(current_system_id, {})
	current_map_data = get_current_map_data()


func current_map_resource_target() -> int:
	if bool(current_map_data.get("is_solar_map", false)):
		return 0
	return max(int(current_map_data.get("resource_target", MAP_RESOURCE_BASE_COUNT)), 8)


func is_solar_map(map_data: Dictionary = current_map_data) -> bool:
	return bool(map_data.get("is_solar_map", false))


func current_map_danger_level() -> float:
	return float(current_map_data.get("danger_level", 0.0))


func current_map_bounds_point() -> Vector2:
	return Vector2(MAP_HALF_SPAN - 140.0, MAP_HALF_SPAN - 140.0)


func random_position_in_current_map(min_distance_from_player: float = 280.0, avoid_station: bool = true) -> Vector2:
	var candidate := Vector2.ZERO
	var bounds := current_map_bounds_point()
	for _i in range(36):
		candidate = Vector2(rng.randf_range(-bounds.x, bounds.x), rng.randf_range(-bounds.y, bounds.y))
		if candidate.distance_to(player.global_position) < min_distance_from_player:
			continue
		if avoid_station and has_station_in_current_map() and candidate.distance_to(station.global_position) < 240.0:
			continue
		return candidate
	return Vector2(rng.randf_range(-bounds.x, bounds.x), rng.randf_range(-bounds.y, bounds.y))


func clear_current_map_entities() -> void:
	for child in resource_layer.get_children():
		resource_layer.remove_child(child)
		child.queue_free()
	hostile_contacts.clear()
	player_missiles.clear()
	active_laser_beams.clear()
	hostile_laser_beams.clear()
	hostile_missiles.clear()
	shield_hit_effects.clear()
	loot_pickups.clear()
	damage_floaters.clear()
	tracked_scan_contact = {}
	lock_target_id = -1
	lock_progress = 0.0
	last_lock_target_id = -1
	pending_boarding_hostile_id = -1
	pending_boarding_derelict_id = 0
	pending_boarding_mode = ""
	combat_contract_spawn_timer = 0.0
	ambient_hostile_event_timer = 0.0
	if onboarding_active and next_onboarding_step_id() == "mine":
		onboarding_mine_target_id = -1


func configure_station_for_current_map() -> void:
	if not has_station_in_current_map():
		station.visible = false
		update_world_lighting()
		return
	station.visible = true
	station.global_position = Vector2(current_map_data.get("station_position", Vector2.ZERO))
	update_world_lighting()


func map_control_summary(map_data: Dictionary = current_map_data) -> String:
	if is_solar_map(map_data):
		return "Solar core"
	var control_state := str(map_data.get("control_state", "neutral"))
	var faction_id := str(map_data.get("controlling_faction", ""))
	match control_state:
		"controlled":
			if faction_id.is_empty():
				return "Controlled space"
			return "%s controlled space" % faction_name(faction_id)
		"contested":
			if faction_id.is_empty():
				return "Contested fringe"
			return "Contested by %s" % faction_name(faction_id)
		"salvage_zone":
			return "Salvage zone"
		_:
			return "Neutral space"


func announce_map_entry() -> void:
	if is_solar_map():
		push_telemetry_event("Entering %s / %s. Solar core." % [current_system_name(), current_map_name()], "system")
		push_telemetry_event("%s star dominant. Expect heat glare, clear lanes, and almost no recoverable field matter." % str(current_system_data.get("star_type", "Primary")), "warning")
		push_telemetry_event(str(current_map_data.get("description", "")), "system")
		return
	var control_state := current_map_control_state()
	var faction_id := current_map_controlling_faction()
	var prefix := "Welcome to"
	var kind := "system"
	if control_state == "controlled":
		prefix = "Entering"
		if not faction_id.is_empty():
			prefix = "Entering %s held space in" % faction_name(faction_id)
	elif control_state == "contested":
		prefix = "Warning"
		kind = "combat"
	elif control_state == "salvage_zone":
		prefix = "Advisory"
		kind = "mission"
	push_telemetry_event("%s %s / %s. %s." % [prefix, current_system_name(), current_map_name(), map_control_summary()], kind)
	push_telemetry_event(str(current_map_data.get("description", "")), "system")
	if has_station_in_current_map():
		push_telemetry_event("%s services online under %s authority." % [current_station_name(), faction_name(current_station_faction())], "dock")
	else:
		var station_map: Dictionary = get_primary_station_map_data()
		push_telemetry_event("No station in this map. Nearest dock: %s." % str(station_map.get("station_name", current_system_data.get("main_station_name", "Main Station"))), "dock")


func get_primary_station_map_data() -> Dictionary:
	if current_system_data.is_empty():
		return {}
	var coord: Vector2i = current_system_data.get("main_station_map", Vector2i(2, 1))
	return current_system_data.get("maps", {}).get(map_key(coord), {})


func station_guidance_position() -> Vector2:
	if has_station_in_current_map():
		return station.global_position
	var station_map: Dictionary = get_primary_station_map_data()
	var station_coord: Vector2i = station_map.get("coord", current_system_data.get("main_station_map", Vector2i(2, 1)))
	var delta := station_coord - current_map_coord
	if delta == Vector2i.ZERO:
		return Vector2.ZERO
	var direction := Vector2(float(sign(delta.x)), float(sign(delta.y)))
	if direction == Vector2.ZERO:
		return Vector2.ZERO
	return direction.normalized() * (MAP_HALF_SPAN - 170.0)


func enter_current_map(announce: bool = true) -> void:
	reload_current_map_metadata()
	configure_sun_root()
	mark_map_discovered(current_system_id, current_map_coord)
	clear_current_map_entities()
	configure_station_for_current_map()
	spawn_starting_resources()
	ensure_active_mission_derelict_spawned()
	if announce:
		announce_map_entry()
	if field_console_popup.visible and field_console_tab == "map":
		refresh_tactical_map()
	update_hud()


func place_player_for_new_game_start() -> void:
	if not has_station_in_current_map():
		return
	player.global_position = station.global_position + Vector2(0.0, -320.0)
	player.force_stop()
	player.reset_camera_to_ship()


func nearest_station_dock_plan(start_position: Vector2) -> Dictionary:
	var left_berth: Vector2 = station.global_position + Vector2(-92.0, 0.0)
	var right_berth: Vector2 = station.global_position + Vector2(92.0, 0.0)
	var left_approach: Vector2 = station.global_position + Vector2(-190.0, 0.0)
	var right_approach: Vector2 = station.global_position + Vector2(190.0, 0.0)
	if start_position.distance_to(left_approach) <= start_position.distance_to(right_approach):
		return {
			"approach": left_approach,
			"berth": left_berth,
			"label": "port",
		}
	return {
		"approach": right_approach,
		"berth": right_berth,
		"label": "starboard",
	}


func transition_to_map(new_coord: Vector2i, entry_position: Vector2) -> void:
	current_map_coord = new_coord
	player.global_position = entry_position
	player.reset_camera_to_ship()
	if new_coord != primary_station_map_coord():
		update_mission_progress("intro_fly_new_map", 1)
	elif new_coord == primary_station_map_coord():
		update_mission_progress("intro_jump_back_station", 1)
	enter_current_map(true)


func handle_map_transitions() -> void:
	if is_any_overlay_open() or docked_at_station or docking_pull_in_progress or player.is_launching():
		return
	var next_coord: Vector2i = current_map_coord
	var next_position: Vector2 = player.global_position
	var changed := false
	if player.global_position.x > MAP_HALF_SPAN:
		next_coord.x += 1
		next_position.x = player.global_position.x - MAP_FULL_SPAN
		changed = true
	elif player.global_position.x < -MAP_HALF_SPAN:
		next_coord.x -= 1
		next_position.x = player.global_position.x + MAP_FULL_SPAN
		changed = true
	if player.global_position.y > MAP_HALF_SPAN:
		next_coord.y += 1
		next_position.y = player.global_position.y - MAP_FULL_SPAN
		changed = true
	elif player.global_position.y < -MAP_HALF_SPAN:
		next_coord.y -= 1
		next_position.y = player.global_position.y + MAP_FULL_SPAN
		changed = true
	next_coord.x = clampi(next_coord.x, 0, SYSTEM_GRID_SIZE - 1)
	next_coord.y = clampi(next_coord.y, 0, SYSTEM_GRID_SIZE - 1)
	if changed and next_coord != current_map_coord:
		transition_to_map(next_coord, next_position)
	elif changed:
		player.global_position = Vector2(
			clampf(player.global_position.x, -MAP_HALF_SPAN, MAP_HALF_SPAN),
			clampf(player.global_position.y, -MAP_HALF_SPAN, MAP_HALF_SPAN)
		)
		player.reset_camera_to_ship()


func handle_ambient_map_events(delta: float) -> void:
	if docked_at_station or docking_pull_in_progress or is_any_overlay_open():
		return
	if has_active_mission():
		return
	var control_state := current_map_control_state()
	if control_state == "controlled":
		ambient_hostile_event_timer = 0.0
		return
	if ambient_hostile_event_timer <= 0.0:
		ambient_hostile_event_timer = rng.randf_range(16.0, 28.0)
	ambient_hostile_event_timer -= delta
	if ambient_hostile_event_timer > 0.0:
		return
	ambient_hostile_event_timer = rng.randf_range(18.0, 32.0)
	var spawn_chance := 0.08 + current_map_danger_level() * 0.45
	if control_state == "salvage_zone":
		spawn_chance += 0.05
	if rng.randf() > spawn_chance:
		return
	var enemy_role := "interceptor" if rng.randf() < 0.5 else ("breacher" if rng.randf() < 0.2 else "scout")
	var spawn_position := random_position_in_current_map(380.0, true)
	spawn_hostile_contact(spawn_position, "blackwake", 1, enemy_role)
	push_telemetry_event("Open-space contact spike. Blackwake %s moving through %s." % [enemy_role, current_map_name()], "combat")
var selected_refinery_input: StringName = &""
var selected_refinery_amount := 0
var selected_refinery_source := "ship"
var refinery_job_active := false
var refinery_job_timer := 0.0
var refinery_job_duration := 2.0
var refinery_job_source := "ship"
var refinery_job_input: StringName = &""
var refinery_job_amount := 0
var refinery_job_pending_outputs := {}
var refinery_job_output_queue: Array[Dictionary] = []
var refinery_job_completed_outputs := {}
var refinery_last_completed_outputs := {}
var refinery_last_output_source := "ship"
var refinery_last_input: StringName = &""
var refinery_last_input_amount := 0
var game_music_player: AudioStreamPlayer
var ui_click_player: AudioStreamPlayer
var ui_hover_player: AudioStreamPlayer
var scan_player: AudioStreamPlayer
var mining_player: AudioStreamPlayer
var laser_player: AudioStreamPlayer
var missile_player: AudioStreamPlayer
var lock_player: AudioStreamPlayer
var impact_player: AudioStreamPlayer
var pickup_player: AudioStreamPlayer
var alert_player: AudioStreamPlayer
var ui_hover_audio_block_until := 0
var active_options_tab := "visuals"

# --- Shared service access ---
func save_manager() -> Node:
	return get_node("/root/SaveManager")


func settings_manager() -> Node:
	return get_node("/root/SettingsManager")


# --- Audio / presentation helpers ---
func make_audio_player(player_name: String, stream: AudioStream, volume_db: float = 0.0, pitch_scale: float = 1.0) -> AudioStreamPlayer:
	var audio_player := AudioStreamPlayer.new()
	audio_player.name = player_name
	audio_player.stream = stream
	audio_player.bus = "Master"
	audio_player.volume_db = volume_db
	audio_player.pitch_scale = pitch_scale
	add_child(audio_player)
	return audio_player


func setup_world_lighting() -> void:
	canvas_modulate.color = Color(0.72, 0.76, 0.82, 1.0)


func update_world_lighting() -> void:
	if canvas_modulate == null:
		return
	var station_visible: bool = has_station_in_current_map()
	if is_solar_map():
		canvas_modulate.color = Color(0.96, 0.92, 0.84, 1.0)
	else:
		var danger_tint: float = clampf(current_map_danger_level(), 0.0, 1.0)
		canvas_modulate.color = Color(
			0.72 + danger_tint * 0.05,
			0.76 - danger_tint * 0.03,
			0.82 - danger_tint * 0.06,
			1.0
		)
	if station_ring != null:
		station_ring.visible = station_visible
	if station_inner != null:
		station_inner.visible = station_visible


func setup_audio() -> void:
	game_music_player = make_audio_player("GameMusicPlayer", GAME_MUSIC, -4.0)
	ui_click_player = make_audio_player("UiClickPlayer", UI_CLICK_SOUND, -3.0)
	ui_hover_player = make_audio_player("UiHoverPlayer", UI_CLICK_SOUND, -8.0, 1.16)
	scan_player = make_audio_player("ScanPlayer", SCAN_SOUND, -4.5)
	mining_player = make_audio_player("MiningPlayer", MINING_SOUND, -4.0)
	laser_player = make_audio_player("LaserPlayer", LASER_SOUND, -5.0)
	missile_player = make_audio_player("MissilePlayer", MISSILE_SOUND, -3.0)
	lock_player = make_audio_player("LockPlayer", LOCK_SOUND, -3.0)
	impact_player = make_audio_player("ImpactPlayer", IMPACT_SOUND, -3.5)
	pickup_player = make_audio_player("PickupPlayer", PICKUP_SOUND, -4.0)
	alert_player = make_audio_player("AlertPlayer", ALERT_SOUND, -7.0)
	if game_music_player != null and game_music_player.is_inside_tree():
		game_music_player.play()
	apply_audio_settings()


func apply_audio_settings() -> void:
	var music_scalar: float = settings_manager().combined_audio_scalar("music")
	var sfx_scalar: float = settings_manager().combined_audio_scalar("sfx")
	var ui_scalar: float = settings_manager().combined_audio_scalar("ui")
	if game_music_player != null:
		game_music_player.volume_db = -4.0 + linear_to_db(max(music_scalar, 0.001))
	if ui_click_player != null:
		ui_click_player.volume_db = -3.0 + linear_to_db(max(ui_scalar, 0.001))
	if ui_hover_player != null:
		ui_hover_player.volume_db = -8.0 + linear_to_db(max(ui_scalar, 0.001))
	if scan_player != null:
		scan_player.volume_db = -4.5 + linear_to_db(max(sfx_scalar, 0.001))
	if mining_player != null:
		mining_player.volume_db = -4.0 + linear_to_db(max(sfx_scalar, 0.001))
	if laser_player != null:
		laser_player.volume_db = -5.0 + linear_to_db(max(sfx_scalar, 0.001))
	if missile_player != null:
		missile_player.volume_db = -3.0 + linear_to_db(max(sfx_scalar, 0.001))
	if lock_player != null:
		lock_player.volume_db = -3.0 + linear_to_db(max(sfx_scalar, 0.001))
	if impact_player != null:
		impact_player.volume_db = -3.5 + linear_to_db(max(sfx_scalar, 0.001))
	if pickup_player != null:
		pickup_player.volume_db = -4.0 + linear_to_db(max(sfx_scalar, 0.001))
	if alert_player != null:
		alert_player.volume_db = -7.0 + linear_to_db(max(sfx_scalar, 0.001))
	if player != null:
		player.apply_audio_settings()


func apply_user_settings() -> void:
	settings_manager().apply_window_mode()
	var brightness_value: float = settings_manager().brightness_scalar()
	canvas_modulate.color = Color(brightness_value, brightness_value, brightness_value, 1.0)
	if player != null and player.camera != null:
		var zoom_value: float = float(settings_manager().get_value("visuals", "camera_zoom"))
		player.camera.zoom = Vector2(zoom_value, zoom_value)
		player.set_screen_shake_scalar(settings_manager().screen_shake_scalar())
	call_deferred("resize_onboarding_panel_to_content")
	if DisplayServer.get_name() != "headless":
		apply_audio_settings()
	fps_label.visible = bool(settings_manager().get_value("visuals", "show_fps"))
	if not bool(settings_manager().get_value("gameplay", "show_onboarding")):
		onboarding_active = false
	update_hud()


func apply_hud_scale() -> void:
	resize_onboarding_panel_to_content()


func apply_tracker_scale() -> void:
	onboarding_panel.scale = Vector2.ONE
	onboarding_title.add_theme_font_size_override("font_size", 15)
	onboarding_status.add_theme_font_size_override("font_size", 13)
	onboarding_body.add_theme_font_size_override("font_size", 13)
	resize_onboarding_panel_to_content()


func play_audio(audio_player: AudioStreamPlayer, pitch_scale: float = 1.0) -> void:
	if audio_player == null or not audio_player.is_inside_tree():
		return
	audio_player.pitch_scale = pitch_scale
	audio_player.play()


func attach_button_audio(button: Button, hover_enabled: bool = true) -> void:
	button.pressed.connect(func() -> void:
		ui_hover_audio_block_until = Time.get_ticks_msec() + 120
		play_audio(ui_click_player, 1.0)
	)
	if hover_enabled:
		button.mouse_entered.connect(func() -> void:
			if Time.get_ticks_msec() < ui_hover_audio_block_until:
				return
			play_audio(ui_hover_player, 1.16)
		)


func configure_sun_root() -> void:
	if sun_root == null:
		return
	sun_root.visible = is_solar_map()
	if not sun_root.visible:
		return
	var star_type := str(current_system_data.get("star_type", "Primary Star"))
	if star_type.findn("White") != -1:
		sun_root.set("body_core_color", Color(0.94, 0.96, 1.0, 1.0))
		sun_root.set("body_mid_color", Color(0.58, 0.8, 1.0, 1.0))
		sun_root.set("body_edge_color", Color(0.34, 0.56, 0.92, 1.0))
		sun_root.set("corona_color", Color(0.86, 0.94, 1.0, 0.92))
		sun_root.set("flare_color", Color(0.9, 0.98, 1.0, 0.82))
	elif star_type.findn("Blue") != -1:
		sun_root.set("body_core_color", Color(0.84, 0.94, 1.0, 1.0))
		sun_root.set("body_mid_color", Color(0.42, 0.68, 1.0, 1.0))
		sun_root.set("body_edge_color", Color(0.16, 0.38, 0.88, 1.0))
		sun_root.set("corona_color", Color(0.76, 0.9, 1.0, 0.9))
		sun_root.set("flare_color", Color(0.74, 0.92, 1.0, 0.78))
	elif star_type.findn("Red") != -1:
		sun_root.set("body_core_color", Color(1.0, 0.58, 0.38, 1.0))
		sun_root.set("body_mid_color", Color(0.96, 0.28, 0.12, 1.0))
		sun_root.set("body_edge_color", Color(0.62, 0.08, 0.02, 1.0))
		sun_root.set("corona_color", Color(1.0, 0.64, 0.42, 0.9))
		sun_root.set("flare_color", Color(1.0, 0.72, 0.46, 0.8))
	else:
		sun_root.set("body_core_color", Color(1.0, 0.95, 0.78, 1.0))
		sun_root.set("body_mid_color", Color(1.0, 0.66, 0.3, 1.0))
		sun_root.set("body_edge_color", Color(0.96, 0.2, 0.04, 1.0))
		sun_root.set("corona_color", Color(1.0, 0.72, 0.28, 0.92))
		sun_root.set("flare_color", Color(1.0, 0.78, 0.34, 0.82))


# --- Engine lifecycle ---
func _ready() -> void:
	rng.randomize()
	cargo = make_empty_item_store()
	reset_onboarding_progress()
	system_registry = build_system_registry()
	reload_current_map_metadata()
	ensure_system_discovery(current_system_id)
	initialize_skill_tree_data()
	initialize_use_skill_progress()
	initialize_market_prices()
	seed_starfield()
	create_item_icons()
	build_inventory_slots()
	build_field_skill_rows()
	build_ship_storage_slots()
	build_storage_slots()
	connect_buttons()
	if DisplayServer.get_name() != "headless":
		setup_audio()
	setup_world_lighting()
	apply_ui_polish()
	refresh_options_from_settings()
	refresh_mission_offers()
	recalculate_ship_stats()
	current_fuel = ship_stats["fuel_capacity"]
	player_shield = player_shield_cap()
	last_piloting_position = player.global_position
	initialize_faction_rank_tracking()
	var pending_loaded_data: Dictionary = save_manager().consume_pending_load()
	if pending_loaded_data.is_empty():
		push_telemetry_event("Telemetry uplink established.", "system")
		push_telemetry_event("Prospector Mk-I cleared for extraction duty.", "system")
		push_telemetry_event("Flight training available. Accept the guided mission to learn the core loop.", "system")
		enter_current_map(true)
		place_player_for_new_game_start()
	else:
		apply_save_data(pending_loaded_data)
		push_telemetry_event("Saved flight state restored.", "system")
	configure_sun_root()
	apply_user_settings()
	update_hud()


func _process(delta: float) -> void:
	world_fx_time += delta
	onboarding_highlight_pulse += delta
	if station_ring != null and station_ring.visible:
		station_ring.rotation += delta * 0.12
	if research_tree_drag_active and not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		research_tree_drag_active = false
		research_tree_dragging = false
		research_tree_click_candidate = ""
	maintain_resource_field()
	handle_popup_input()
	update_guided_onboarding(delta)
	if pause_popup.visible:
		player.set_controls_enabled(false)
		popup_backdrop.visible = true
		update_tooltip_position()
		queue_redraw()
		return
	handle_flight_systems(delta)
	update_use_skill_progress(delta)
	handle_market_fluctuation(delta)
	handle_mission_offer_rotation(delta)
	handle_combat_systems(delta)
	handle_ambient_map_events(delta)
	update_refinery_job(delta)
	if not is_dock_open() and not docking_pull_in_progress:
		handle_resource_gathering(delta)
		handle_scan_input()
		handle_world_scan_input()
		handle_station_interaction()
	elif not is_dock_open():
		handle_station_interaction()
	update_docking_sequence(delta)
	player.set_controls_enabled(not is_any_overlay_open())
	popup_backdrop.visible = is_any_overlay_open()
	update_telemetry(delta)
	update_world_effects(delta)
	handle_map_transitions()
	update_tooltip_position()
	queue_redraw()


func update_use_skill_progress(_delta: float) -> void:
	if player == null:
		return
	if dock_screen.visible or field_console_popup.visible or pause_popup.visible:
		last_piloting_position = player.global_position
		return
	var distance_traveled: float = player.global_position.distance_to(last_piloting_position)
	last_piloting_position = player.global_position
	if docking_pull_in_progress or docked_at_station:
		return
	if distance_traveled < 1.0:
		return
	piloting_distance_accumulator += distance_traveled
	while piloting_distance_accumulator >= 180.0:
		piloting_distance_accumulator -= 180.0
		award_use_skill_xp("piloting", 1.0)


func _draw() -> void:
	var background_rect := Rect2(Vector2(-3200, -3200), Vector2(6400, 6400))
	var focus: Vector2 = player.global_position
	draw_rect(background_rect, Color(0.02, 0.03, 0.06))
	draw_star_layer(starfield_far, focus)
	draw_star_layer(starfield_mid, focus)
	draw_star_layer(starfield_near, focus)
	draw_debris_layer(ambient_debris, focus)
	draw_scan_pulses()
	draw_mining_effects()
	draw_mission_indicator()
	draw_hostile_contacts()
	draw_shield_hit_effects()
	draw_hostile_weapons()
	draw_player_missiles()
	draw_loot_pickups()
	draw_combat_reticle()


# --- Background / world rendering ---
func seed_starfield() -> void:
	starfield_far.clear()
	starfield_mid.clear()
	starfield_near.clear()
	ambient_debris.clear()

	for _i in range(120):
		starfield_far.append({
			"position": Vector2(rng.randf_range(-3200.0, 3200.0), rng.randf_range(-3200.0, 3200.0)),
			"radius": rng.randf_range(0.7, 1.4),
			"color": Color(0.58 + rng.randf_range(0.0, 0.12), 0.68 + rng.randf_range(0.0, 0.1), 0.82 + rng.randf_range(0.0, 0.12), rng.randf_range(0.28, 0.52)),
			"depth": 0.16,
		})

	for _i in range(90):
		starfield_mid.append({
			"position": Vector2(rng.randf_range(-3200.0, 3200.0), rng.randf_range(-3200.0, 3200.0)),
			"radius": rng.randf_range(1.0, 1.9),
			"color": Color(0.75 + rng.randf_range(0.0, 0.12), 0.82 + rng.randf_range(0.0, 0.08), 0.9 + rng.randf_range(0.0, 0.08), rng.randf_range(0.48, 0.72)),
			"depth": 0.28,
		})

	for _i in range(55):
		starfield_near.append({
			"position": Vector2(rng.randf_range(-3200.0, 3200.0), rng.randf_range(-3200.0, 3200.0)),
			"radius": rng.randf_range(1.5, 2.5),
			"color": Color(0.88 + rng.randf_range(0.0, 0.08), 0.9 + rng.randf_range(0.0, 0.06), 0.96 + rng.randf_range(0.0, 0.04), rng.randf_range(0.68, 0.92)),
			"depth": 0.42,
		})

	for _i in range(18):
		ambient_debris.append({
			"position": Vector2(rng.randf_range(-2600.0, 2600.0), rng.randf_range(-2600.0, 2600.0)),
			"size": rng.randf_range(8.0, 18.0),
			"color": Color(0.22, 0.34, 0.46, rng.randf_range(0.08, 0.16)),
			"depth": 0.2,
		})


func wrap_world_position(point: Vector2, focus: Vector2, span: float) -> Vector2:
	return Vector2(
		wrapf(point.x, focus.x - span, focus.x + span),
		wrapf(point.y, focus.y - span, focus.y + span)
	)


func get_parallax_point(point: Vector2, focus: Vector2, depth: float, span: float = 3200.0) -> Vector2:
	var parallax_strength: float = settings_manager().parallax_strength_scalar()
	var adjusted_depth: float = lerpf(1.0, depth, parallax_strength)
	var parallax_origin := focus + (point - focus) * adjusted_depth
	return wrap_world_position(parallax_origin, focus, span)


func draw_star_layer(layer: Array[Dictionary], focus: Vector2) -> void:
	for star in layer:
		var point := get_parallax_point(star["position"], focus, float(star["depth"]))
		draw_circle(point, float(star["radius"]), star["color"])


func draw_debris_layer(layer: Array[Dictionary], focus: Vector2) -> void:
	for debris in layer:
		var point := get_parallax_point(debris["position"], focus, float(debris["depth"]))
		var size := float(debris["size"])
		draw_colored_polygon(PackedVector2Array([
			point + Vector2(-size, -size * 0.35),
			point + Vector2(size * 0.15, -size),
			point + Vector2(size, -size * 0.1),
			point + Vector2(size * 0.4, size),
			point + Vector2(-size * 0.9, size * 0.55),
		]), debris["color"])


func draw_scan_pulses() -> void:
	var glow_strength: float = settings_manager().glow_strength_scalar()
	for pulse in scan_pulses:
		var age := 1.0 - float(pulse["time_left"]) / float(pulse["duration"])
		var radius := lerpf(24.0, 130.0, age)
		var alpha := (1.0 - age) * 0.38 * glow_strength
		draw_circle(pulse["position"], 14.0 + age * 18.0, Color(0.22, 0.8, 1.0, alpha * 0.28))
		draw_arc(pulse["position"], radius, 0.0, TAU, 48, Color(0.44, 0.9, 1.0, alpha), 2.0)


func draw_mining_effects() -> void:
	var glow_strength: float = settings_manager().glow_strength_scalar()
	for effect in mining_effects:
		var age := 1.0 - float(effect["time_left"]) / float(effect["duration"])
		var alpha := (1.0 - age) * 0.9 * glow_strength
		var base_radius := 9.0 + age * 20.0
		draw_circle(effect["position"], base_radius, Color(effect["color"].r, effect["color"].g, effect["color"].b, alpha * 0.14))
		draw_arc(effect["position"], base_radius + 6.0, 0.0, TAU, 28, Color(effect["color"].r, effect["color"].g, effect["color"].b, alpha * 0.42), 1.6)
		for spark in effect["sparks"]:
			var spark_dir: Vector2 = spark["direction"]
			var spark_len := lerpf(6.0, 18.0, age)
			var start := Vector2(effect["position"]) + spark_dir * (2.0 + age * 4.0)
			var finish := start + spark_dir * spark_len
			draw_line(start, finish, Color(1.0, 0.96, 0.82, alpha * 0.78), 1.6)


func draw_mission_indicator() -> void:
	if is_any_overlay_open():
		return

	if has_active_mission():
		var mission_target: Variant = get_mission_target_position()
		if mission_target != null:
			draw_direction_indicator(mission_target, Color(0.84, 0.98, 0.62, 0.92) if mission_needs_turn_in(current_mission) else Color(0.46, 0.88, 1.0, 0.9), 64.0)

	var scan_target: Variant = get_tracked_scan_contact_position()
	if scan_target != null:
		var scan_color: Color = tracked_scan_contact.get("color", Color(1.0, 0.82, 0.4, 0.9))
		draw_direction_indicator(scan_target, scan_color, 82.0)


func draw_direction_indicator(target: Vector2, color: Color, distance_from_player: float) -> void:
	var to_target: Vector2 = target - player.global_position
	if to_target.length() < 28.0:
		return

	var direction := to_target.normalized()
	var arrow_center: Vector2 = player.global_position + direction * distance_from_player
	var tip: Vector2 = arrow_center + direction * 13.0
	var side := direction.orthogonal() * 6.0
	var back: Vector2 = arrow_center - direction * 8.0
	draw_circle(arrow_center, 13.0, Color(color.r, color.g, color.b, 0.09))
	draw_colored_polygon(PackedVector2Array([tip, back + side, back - side]), color)
	draw_arc(player.global_position, max(distance_from_player - 16.0, 28.0), direction.angle() - 0.18, direction.angle() + 0.18, 12, Color(color.r, color.g, color.b, 0.4), 1.8)


func draw_hostile_contacts() -> void:
	for hostile in hostile_contacts:
		var contact_position: Vector2 = hostile["position"]
		var disabled := bool(hostile.get("disabled", false))
		var color: Color = hostile.get("body_color", Color(0.92, 0.28, 0.28, 0.94))
		var ring_color: Color = hostile.get("ring_color", Color(0.38, 0.08, 0.08, 0.16))
		if disabled:
			color = Color(1.0, 0.78, 0.34, 0.96)
			ring_color = Color(0.64, 0.42, 0.08, 0.2)
		var radius: float = float(hostile.get("radius", 22.0))
		var hull_ratio := clampf(float(hostile["hull"]) / float(hostile["max_hull"]), 0.0, 1.0)
		draw_circle(contact_position, radius, ring_color)
		var hostile_texture: Texture2D = hostile.get("texture", null)
		var texture_scale: float = float(hostile.get("texture_scale", 0.5))
		var hostile_velocity: Vector2 = hostile.get("velocity", Vector2.ZERO)
		if not disabled and hostile_velocity.length() > 8.0:
			var thrust_alpha: float = clampf(hostile_velocity.length() / max(float(hostile.get("speed_far", 95.0)), 1.0), 0.2, 0.9)
			var thrust_length: float = 8.0 + 8.0 * thrust_alpha
			var back_direction := Vector2.RIGHT.rotated(float(hostile["rotation"]) + PI)
			var exhaust_center := contact_position + back_direction * 8.0
			var left_offset := back_direction.orthogonal() * 3.5
			draw_line(exhaust_center + left_offset, exhaust_center + left_offset + back_direction * thrust_length, Color(1.0, 0.56, 0.2, 0.75 * thrust_alpha), 1.8)
			draw_line(exhaust_center - left_offset, exhaust_center - left_offset + back_direction * thrust_length, Color(1.0, 0.56, 0.2, 0.75 * thrust_alpha), 1.8)
			draw_circle(exhaust_center + left_offset + back_direction * thrust_length, 2.0, Color(1.0, 0.82, 0.42, 0.26 * thrust_alpha))
			draw_circle(exhaust_center - left_offset + back_direction * thrust_length, 2.0, Color(1.0, 0.82, 0.42, 0.26 * thrust_alpha))
		if hostile_texture != null:
			var texture_size: Vector2 = hostile_texture.get_size() * texture_scale
			draw_set_transform(contact_position, float(hostile["rotation"]) + PI, Vector2.ONE)
			draw_texture_rect(hostile_texture, Rect2(-texture_size * 0.5, texture_size), false, color)
			draw_set_transform(Vector2.ZERO, 0.0, Vector2.ONE)
		else:
			var hostile_role := str(hostile.get("role", "scout"))
			if hostile_role == "interceptor":
				draw_colored_polygon(PackedVector2Array([
					contact_position + Vector2(13, 0).rotated(float(hostile["rotation"])),
					contact_position + Vector2(2, 7).rotated(float(hostile["rotation"])),
					contact_position + Vector2(-8, 5).rotated(float(hostile["rotation"])),
					contact_position + Vector2(-10, 0).rotated(float(hostile["rotation"])),
					contact_position + Vector2(-8, -5).rotated(float(hostile["rotation"])),
					contact_position + Vector2(2, -7).rotated(float(hostile["rotation"])),
				]), color)
			elif hostile_role == "breacher":
				draw_colored_polygon(PackedVector2Array([
					contact_position + Vector2(15, 0).rotated(float(hostile["rotation"])),
					contact_position + Vector2(5, 8).rotated(float(hostile["rotation"])),
					contact_position + Vector2(-7, 8).rotated(float(hostile["rotation"])),
					contact_position + Vector2(-14, 3).rotated(float(hostile["rotation"])),
					contact_position + Vector2(-11, 0).rotated(float(hostile["rotation"])),
					contact_position + Vector2(-14, -3).rotated(float(hostile["rotation"])),
					contact_position + Vector2(-7, -8).rotated(float(hostile["rotation"])),
					contact_position + Vector2(5, -8).rotated(float(hostile["rotation"])),
				]), color)
			else:
				draw_colored_polygon(PackedVector2Array([
					contact_position + Vector2(11, 0).rotated(float(hostile["rotation"])),
					contact_position + Vector2(-7, 6).rotated(float(hostile["rotation"])),
					contact_position + Vector2(-5, 0).rotated(float(hostile["rotation"])),
					contact_position + Vector2(-7, -6).rotated(float(hostile["rotation"])),
				]), color)
		draw_rect(Rect2(contact_position + Vector2(-14, -20), Vector2(28, 3)), Color(0.16, 0.04, 0.04, 0.8))
		draw_rect(Rect2(contact_position + Vector2(-14, -20), Vector2(28 * hull_ratio, 3)), Color(1.0, 0.32, 0.32, 0.92))

		if hostile["id"] == lock_target_id:
			var lock_alpha := 0.3 + 0.7 * clampf(lock_progress / COMBAT_LOCK_TIME, 0.0, 1.0)
			draw_arc(contact_position, 18.0, world_fx_time * 1.8, world_fx_time * 1.8 + TAU * clampf(lock_progress / COMBAT_LOCK_TIME, 0.15, 1.0), 28, Color(1.0, 0.32, 0.32, lock_alpha), 2.0)

	if hostile_contacts.is_empty():
		return

	var nearest := get_nearest_hostile()
	if nearest.is_empty():
		return
	var target_position: Vector2 = nearest["position"]
	var to_target: Vector2 = target_position - player.global_position
	if to_target.length() < 24.0:
		return
	var direction := to_target.normalized()
	var arrow_center: Vector2 = player.global_position + direction * 72.0
	var tip: Vector2 = arrow_center + direction * 14.0
	var side := direction.orthogonal() * 6.0
	var back: Vector2 = arrow_center - direction * 8.0
	var arrow_color := Color(1.0, 0.22, 0.22, 0.92)
	draw_circle(arrow_center, 13.0, Color(arrow_color.r, arrow_color.g, arrow_color.b, 0.08))
	draw_colored_polygon(PackedVector2Array([tip, back + side, back - side]), arrow_color)
	draw_arc(player.global_position, 52.0, direction.angle() - 0.15, direction.angle() + 0.15, 12, Color(arrow_color.r, arrow_color.g, arrow_color.b, 0.44), 1.8)


func draw_player_missiles() -> void:
	for missile in player_missiles:
		var missile_position: Vector2 = missile["position"]
		var rotation_value: float = missile["rotation"]
		draw_colored_polygon(PackedVector2Array([
			missile_position + Vector2(12, 0).rotated(rotation_value),
			missile_position + Vector2(-8, 4).rotated(rotation_value),
			missile_position + Vector2(-8, -4).rotated(rotation_value),
		]), Color(1.0, 0.74, 0.42, 0.94))
		draw_circle(missile_position + Vector2(-10, 0).rotated(rotation_value), 5.0, Color(1.0, 0.34, 0.12, 0.34))

	for beam in active_laser_beams:
		draw_line(beam["from"], beam["to"], beam["color"], 2.4)


func draw_hostile_weapons() -> void:
	for missile in hostile_missiles:
		var missile_position: Vector2 = missile["position"]
		var rotation_value: float = missile["rotation"]
		draw_colored_polygon(PackedVector2Array([
			missile_position + Vector2(10, 0).rotated(rotation_value),
			missile_position + Vector2(-6, 3).rotated(rotation_value),
			missile_position + Vector2(-6, -3).rotated(rotation_value),
		]), Color(1.0, 0.48, 0.24, 0.92))
		draw_circle(missile_position + Vector2(-8, 0).rotated(rotation_value), 4.0, Color(1.0, 0.28, 0.1, 0.3))

	for beam in hostile_laser_beams:
		draw_line(beam["from"], beam["to"], beam["color"], 2.0)


func draw_shield_hit_effects() -> void:
	for effect in shield_hit_effects:
		var entity_type: String = str(effect.get("entity_type", ""))
		var center: Vector2
		var radius: float = float(effect.get("radius", 16.0))
		if entity_type == "player":
			center = player.global_position
		else:
			var hostile_id: int = int(effect.get("hostile_id", -1))
			var hostile: Dictionary = get_hostile_by_id(hostile_id)
			if hostile.is_empty():
				continue
			center = hostile["position"]
			radius = float(hostile.get("radius", radius)) + 4.0
		var alpha: float = clampf(float(effect["time_left"]) / float(effect["duration"]), 0.0, 1.0)
		var impact_angle: float = float(effect.get("angle", 0.0))
		var arc_half_width: float = 0.58
		var shield_color: Color = effect.get("color", Color(0.42, 0.82, 1.0, 1.0))
		draw_arc(center, radius, impact_angle - arc_half_width, impact_angle + arc_half_width, 24, Color(shield_color.r, shield_color.g, shield_color.b, alpha), 3.6)
		draw_arc(center, radius + 3.0, impact_angle - arc_half_width * 0.7, impact_angle + arc_half_width * 0.7, 20, Color(0.92, 0.98, 1.0, alpha * 0.72), 1.8)
		var glow_position: Vector2 = center + Vector2.RIGHT.rotated(impact_angle) * radius
		draw_circle(glow_position, 5.0, Color(shield_color.r, shield_color.g, shield_color.b, alpha * 0.42))


func draw_loot_pickups() -> void:
	for drop in loot_pickups:
		var loot_position: Vector2 = drop["position"]
		var pulse := 0.82 + 0.18 * sin(world_fx_time * 4.0 + float(drop["pulse_offset"]))
		draw_circle(loot_position, 10.0 + pulse * 3.0, Color(0.9, 0.78, 0.38, 0.12))
		draw_circle(loot_position, 6.0, drop["color"])


func draw_combat_reticle() -> void:
	if not combat_mode or is_any_overlay_open():
		return

	var mouse_world := get_global_mouse_position()
	var reticle_color := Color(1.0, 0.24, 0.24, 0.92)
	var size := 10.0
	draw_line(mouse_world + Vector2(-size, 0), mouse_world + Vector2(-3, 0), reticle_color, 1.6)
	draw_line(mouse_world + Vector2(size, 0), mouse_world + Vector2(3, 0), reticle_color, 1.6)
	draw_line(mouse_world + Vector2(0, -size), mouse_world + Vector2(0, -3), reticle_color, 1.6)
	draw_line(mouse_world + Vector2(0, size), mouse_world + Vector2(0, 3), reticle_color, 1.6)
	draw_arc(mouse_world, 14.0, 0.0, TAU, 28, Color(reticle_color.r, reticle_color.g, reticle_color.b, 0.3), 1.0)


# --- UI wiring / setup ---
func connect_buttons() -> void:
	field_console_close_button.pressed.connect(close_field_console)
	field_mission_tab_button.pressed.connect(func() -> void: set_field_console_tab("mission"))
	field_cargo_tab_button.pressed.connect(func() -> void: set_field_console_tab("cargo"))
	field_map_tab_button.pressed.connect(func() -> void: set_field_console_tab("map"))
	field_pilot_tab_button.pressed.connect(func() -> void: set_field_console_tab("pilot"))
	field_skills_tab_button.pressed.connect(func() -> void: set_field_console_tab("skills"))
	for button in [field_console_close_button, field_mission_tab_button, field_cargo_tab_button, field_map_tab_button, field_pilot_tab_button, field_skills_tab_button]:
		attach_button_audio(button)
	engine_button.pressed.connect(func() -> void: try_buy_upgrade("engine"))
	cargo_button.pressed.connect(func() -> void: try_buy_upgrade("cargo"))
	mining_button.pressed.connect(func() -> void: try_buy_upgrade("mining"))
	fuel_button.pressed.connect(func() -> void: try_buy_upgrade("fuel"))
	shield_button.pressed.connect(func() -> void: try_buy_upgrade("shield"))
	hull_button.pressed.connect(func() -> void: try_buy_upgrade("hull"))
	laser_button.pressed.connect(func() -> void: try_buy_upgrade("laser"))
	special_button.pressed.connect(func() -> void: try_buy_upgrade("special"))
	repair_button.pressed.connect(repair_hull)
	restock_button.pressed.connect(restock_missiles)
	sell_button.pressed.connect(sell_cargo)
	refuel_button.pressed.connect(refuel_ship)
	bounty_turn_in_button.pressed.connect(turn_in_blackwake_bounties)
	storage_expand_button.pressed.connect(purchase_storage_slots)
	refine_button.pressed.connect(refine_selected_input)
	crafting_detail_button.pressed.connect(open_selected_crafting_confirmation)
	refinery_ship_tab_button.pressed.connect(func() -> void: set_refinery_source("ship"))
	refinery_station_tab_button.pressed.connect(func() -> void: set_refinery_source("station"))
	refinery_input_card.pressed.connect(request_selected_refinery_amount_change)
	transfer_cancel_button.pressed.connect(close_transfer_popup)
	transfer_confirm_button.pressed.connect(confirm_transfer_popup)
	dock_prompt_no_button.pressed.connect(decline_docking_prompt)
	dock_prompt_yes_button.pressed.connect(confirm_docking_prompt)
	boarding_prompt_board_button.pressed.connect(confirm_boarding_action)
	boarding_prompt_destroy_button.pressed.connect(confirm_destroy_boarding_target)
	general_scan_button.pressed.connect(func() -> void: choose_scan_mode("anomalies"))
	hostile_scan_button.pressed.connect(func() -> void: choose_scan_mode("hostiles"))
	derelict_scan_button.pressed.connect(func() -> void: choose_scan_mode("derelicts"))
	resource_scan_button.pressed.connect(open_resource_scan_menu)
	bounty_scan_button.pressed.connect(func() -> void: choose_scan_mode("bounties"))
	resource_scan_back_button.pressed.connect(show_scan_mode_root)
	close_scan_mode_button.pressed.connect(close_scan_mode_popup)
	build_resource_scan_menu()
	reorder_scan_mode_buttons()
	exchange_room_button.pressed.connect(func() -> void: open_station_room("exchange"))
	storage_room_button.pressed.connect(func() -> void: open_station_room("storage"))
	refinery_room_button.pressed.connect(func() -> void: open_station_room("refinery"))
	crafting_room_button.pressed.connect(func() -> void: open_station_room("crafting"))
	shipyard_room_button.pressed.connect(func() -> void: open_station_room("shipyard"))
	crew_room_button.pressed.connect(func() -> void: open_station_room("crew"))
	research_room_button.pressed.connect(func() -> void: open_station_room("research"))
	faction_room_button.pressed.connect(func() -> void: open_station_room("factions"))
	pilot_profile_button.pressed.connect(func() -> void: open_station_room("factions"))
	mission_room_button.pressed.connect(func() -> void: open_station_room("mission"))
	cargo_room_button.pressed.connect(func() -> void:
		dock_screen.visible = false
		return_to_dock_on_popup_close = true
		show_station_main_menu()
		open_field_console("cargo")
	)
	dock_back_button.pressed.connect(show_station_main_menu)
	dock_close_button.pressed.connect(close_dock_screen)
	mission_available_button.pressed.connect(func() -> void: set_mission_board_view("available"))
	mission_active_button.pressed.connect(func() -> void: set_mission_board_view("active"))
	research_upload_button.pressed.connect(upload_scan_data)
	research_unlock_button.pressed.connect(purchase_selected_research_node)
	close_mission_button.pressed.connect(close_mission_popup)
	close_inventory_button.pressed.connect(close_inventory_popup)
	close_tactical_map_button.pressed.connect(close_tactical_map)
	resume_button.pressed.connect(close_pause_menu)
	save_button.pressed.connect(save_game_to_slot)
	load_button.pressed.connect(load_game_from_slot)
	options_button.pressed.connect(open_options_popup)
	pause_main_menu_button.pressed.connect(return_to_startup_menu)
	pause_quit_button.pressed.connect(func() -> void: get_tree().quit())
	options_visuals_button.pressed.connect(func() -> void: set_options_tab("visuals"))
	options_audio_button.pressed.connect(func() -> void: set_options_tab("audio"))
	options_gameplay_button.pressed.connect(func() -> void: set_options_tab("gameplay"))
	options_close_button.pressed.connect(close_options_popup)
	options_fullscreen_check.toggled.connect(func(toggled: bool) -> void:
		settings_manager().set_value("visuals", "fullscreen", toggled)
		apply_user_settings()
	)
	options_vsync_check.toggled.connect(func(toggled: bool) -> void:
		settings_manager().set_value("visuals", "vsync", toggled)
	)
	options_show_fps_check.toggled.connect(func(toggled: bool) -> void:
		settings_manager().set_value("visuals", "show_fps", toggled)
		apply_user_settings()
	)
	options_camera_zoom_slider.value_changed.connect(func(value: float) -> void:
		settings_manager().set_value("visuals", "camera_zoom", snappedf(value, 0.01))
		refresh_options_labels()
		apply_user_settings()
	)
	options_brightness_slider.value_changed.connect(func(value: float) -> void:
		settings_manager().set_value("visuals", "brightness", snappedf(value, 0.01))
		refresh_options_labels()
		apply_user_settings()
	)
	options_screen_shake_slider.value_changed.connect(func(value: float) -> void:
		settings_manager().set_value("visuals", "screen_shake", snappedf(value, 0.01))
		refresh_options_labels()
		apply_user_settings()
	)
	options_parallax_strength_slider.value_changed.connect(func(value: float) -> void:
		settings_manager().set_value("visuals", "parallax_strength", snappedf(value, 0.01))
		refresh_options_labels()
	)
	options_glow_strength_slider.value_changed.connect(func(value: float) -> void:
		settings_manager().set_value("visuals", "glow_strength", snappedf(value, 0.01))
		refresh_options_labels()
	)
	options_master_volume_slider.value_changed.connect(func(value: float) -> void:
		settings_manager().set_value("audio", "master", snappedf(value, 0.01))
		refresh_options_labels()
		apply_audio_settings()
	)
	options_music_volume_slider.value_changed.connect(func(value: float) -> void:
		settings_manager().set_value("audio", "music", snappedf(value, 0.01))
		refresh_options_labels()
		apply_audio_settings()
	)
	options_sfx_volume_slider.value_changed.connect(func(value: float) -> void:
		settings_manager().set_value("audio", "sfx", snappedf(value, 0.01))
		refresh_options_labels()
		apply_audio_settings()
	)
	options_ui_volume_slider.value_changed.connect(func(value: float) -> void:
		settings_manager().set_value("audio", "ui", snappedf(value, 0.01))
		refresh_options_labels()
		apply_audio_settings()
	)
	options_engine_volume_slider.value_changed.connect(func(value: float) -> void:
		settings_manager().set_value("audio", "engine", snappedf(value, 0.01))
		refresh_options_labels()
		apply_audio_settings()
	)
	options_onboarding_check.toggled.connect(func(toggled: bool) -> void:
		if not onboarding_can_be_reenabled():
			refresh_options_from_settings()
			return
		settings_manager().set_value("gameplay", "show_onboarding", toggled)
		if toggled and onboarding_completed_count() < ONBOARDING_STEP_ORDER.size():
			onboarding_active = false
			onboarding_declined = false
			onboarding_offer_pending = true
		elif not toggled:
			onboarding_active = false
			onboarding_offer_pending = false
		update_hud()
	)
	options_docking_prompt_check.toggled.connect(func(toggled: bool) -> void:
		settings_manager().set_value("gameplay", "docking_prompt", toggled)
	)
	research_tree_canvas.gui_input.connect(handle_research_tree_gui_input)
	research_tree_canvas.mouse_exited.connect(hide_tooltip)
	guided_mission_popup_primary_button.pressed.connect(func() -> void:
		if onboarding_popup_mode == "offer":
			accept_onboarding_mission()
		elif onboarding_popup_mode == "completion":
			finalize_onboarding_mission_accept()
		elif onboarding_popup_mode == "intro_complete":
			complete_intro_popup_mission()
		elif onboarding_popup_mode == "finished":
			acknowledge_onboarding_completion()
		else:
			close_guided_mission_popup()
	)
	guided_mission_popup_secondary_button.pressed.connect(func() -> void:
		if onboarding_popup_mode == "offer":
			decline_onboarding_mission()
		else:
			close_guided_mission_popup()
	)

	connect_room_button_tooltip(exchange_room_button, "exchange")
	connect_room_button_tooltip(storage_room_button, "storage")
	connect_room_button_tooltip(refinery_room_button, "refinery")
	connect_room_button_tooltip(crafting_room_button, "crafting")
	connect_room_button_tooltip(shipyard_room_button, "shipyard")
	connect_room_button_tooltip(crew_room_button, "crew")
	connect_room_button_tooltip(research_room_button, "research")
	connect_room_button_tooltip(faction_room_button, "factions")
	connect_room_button_tooltip(mission_room_button, "mission")
	connect_room_button_tooltip(cargo_room_button, "cargo")
	connect_simple_tooltip(engine_button, "Engine Upgrade", "+45 speed and +95 acceleration per tier.")
	connect_simple_tooltip(cargo_button, "Cargo Upgrade", "+16 cargo capacity per tier.")
	connect_simple_tooltip(mining_button, "Mining Upgrade", "+0.34 mining power per tier.")
	connect_simple_tooltip(fuel_button, "Fuel Upgrade", "+30 fuel capacity per tier.")
	connect_simple_tooltip(shield_button, "Shield Upgrade", "+5 shield health per tier.")
	connect_simple_tooltip(hull_button, "Hull Upgrade", "+7 hull health per tier.")
	connect_simple_tooltip(laser_button, "Laser Upgrade", "+0.8 laser damage per tier.")
	connect_simple_tooltip(special_button, "Special Upgrade", "+1.4 special weapon damage per tier.")

	for button in [
		engine_button, cargo_button, mining_button, fuel_button, repair_button, restock_button, sell_button, refuel_button,
		shield_button, hull_button, laser_button, special_button,
		bounty_turn_in_button, storage_expand_button, refine_button, crafting_detail_button, transfer_cancel_button, transfer_confirm_button,
		refinery_ship_tab_button, refinery_station_tab_button, refinery_input_card,
		dock_prompt_no_button, dock_prompt_yes_button, boarding_prompt_board_button, boarding_prompt_destroy_button,
		general_scan_button, hostile_scan_button, derelict_scan_button, resource_scan_button, bounty_scan_button,
		close_scan_mode_button, exchange_room_button, storage_room_button, refinery_room_button, crafting_room_button, shipyard_room_button,
		crew_room_button, research_room_button, faction_room_button, pilot_profile_button, mission_room_button, cargo_room_button,
		dock_back_button, dock_close_button, mission_available_button, mission_active_button, close_mission_button,
		close_inventory_button, close_tactical_map_button, resume_button, save_button, load_button, options_button,
		pause_main_menu_button, pause_quit_button, options_visuals_button, options_audio_button, options_gameplay_button, options_close_button,
		guided_mission_popup_primary_button, guided_mission_popup_secondary_button
	]:
		attach_button_audio(button)


func create_item_icons() -> void:
	for item_type in ITEM_ORDER:
		var data: Dictionary = item_data[item_type]
		item_icons[item_type] = create_icon_texture(data["fill"], data["accent"])
	item_icons[ORE] = IRON_ORE_ITEM_ICON
	item_icons[NICKEL] = NICKEL_ORE_ITEM_ICON
	item_icons[COPPER] = COPPER_ORE_ITEM_ICON
	item_icons[TITANIUM] = TITANIUM_ORE_ITEM_ICON


func create_icon_texture(fill: Color, accent: Color) -> ImageTexture:
	var image := Image.create(48, 48, false, Image.FORMAT_RGBA8)
	image.fill(Color(0.06, 0.08, 0.12, 0.0))

	for y in range(48):
		for x in range(48):
			var delta := Vector2(x - 24, y - 24)
			var dist := delta.length()
			if dist <= 18.0:
				image.set_pixel(x, y, fill)
			elif dist <= 22.0:
				image.set_pixel(x, y, accent)

	return ImageTexture.create_from_image(image)


func create_tinted_ui_texture(source_texture: Texture2D, tint: Color) -> Texture2D:
	if source_texture == null:
		return null
	var image: Image = source_texture.get_image()
	if image == null:
		return source_texture
	image.convert(Image.FORMAT_RGBA8)
	for y in range(image.get_height()):
		for x in range(image.get_width()):
			var pixel: Color = image.get_pixel(x, y)
			if pixel.a <= 0.0:
				continue
			image.set_pixel(x, y, Color(tint.r, tint.g, tint.b, pixel.a))
	return ImageTexture.create_from_image(image)


func create_shipyard_placeholder_icon(kind: String, tint: Color) -> ImageTexture:
	var image := Image.create(128, 128, false, Image.FORMAT_RGBA8)
	image.fill(Color(0.0, 0.0, 0.0, 0.0))
	var stroke: Color = tint
	var faint: Color = Color(tint.r, tint.g, tint.b, 0.24)
	for y in range(12, 116):
		for x in range(12, 116):
			var border := x == 12 or x == 115 or y == 12 or y == 115
			if border:
				image.set_pixel(x, y, faint)
	match kind:
		"shield":
			for y in range(22, 94):
				for x in range(26, 102):
					var local_x: float = float(x - 64) / 34.0
					var local_y: float = float(y - 58) / 36.0
					var arc_value: float = local_x * local_x + local_y * local_y
					if arc_value <= 1.0 and y <= 72:
						if abs(arc_value - 1.0) < 0.08 or y >= 66:
							image.set_pixel(x, y, stroke)
		"hull":
			for x in range(28, 100):
				image.set_pixel(x, 42, stroke)
				image.set_pixel(x, 86, stroke)
			for y in range(42, 87):
				image.set_pixel(28, y, stroke)
				image.set_pixel(99, y, stroke)
			for x in range(44, 84):
				image.set_pixel(x, 56, stroke)
				image.set_pixel(x, 72, stroke)
		"laser":
			for x in range(28, 98):
				image.set_pixel(x, 64, stroke)
				if x > 72:
					image.set_pixel(x, 63, stroke)
					image.set_pixel(x, 65, stroke)
			for y in range(48, 81):
				image.set_pixel(32, y, stroke)
				image.set_pixel(44, y, stroke)
			for x in range(24, 52):
				image.set_pixel(x, 48, stroke)
				image.set_pixel(x, 80, stroke)
		"special":
			for x in range(30, 96):
				image.set_pixel(x, 64, stroke)
			for y in range(36, 92):
				image.set_pixel(64, y, stroke)
			for offset in range(0, 18):
				image.set_pixel(96 + offset, 64 - offset, stroke)
				image.set_pixel(96 + offset, 64 + offset, stroke)
				image.set_pixel(32 - offset, 64 - offset, stroke)
				image.set_pixel(32 - offset, 64 + offset, stroke)
	return ImageTexture.create_from_image(image)


# --- Economy / market state ---
func initialize_market_prices() -> void:
	market_price_multipliers.clear()
	for item_type in ITEM_ORDER:
		market_price_multipliers[item_type] = rand_market_multiplier()
	market_update_timer = rng.randf_range(10.0, 18.0)


func rand_market_multiplier() -> float:
	return snappedf(clampf(rng.randf_range(0.78, 1.28), 0.7, 1.35), 0.01)


func make_empty_item_store() -> Dictionary:
	var store := {}
	for item_type in ITEM_ORDER:
		store[item_type] = 0
	return store


# --- Guided onboarding mission flow ---
func reset_onboarding_progress() -> void:
	onboarding_active = false
	onboarding_completion_announced = false
	onboarding_completion_acknowledged = false
	onboarding_declined = false
	onboarding_offer_pending = true
	onboarding_current_step_popup = ""
	onboarding_popup_mode = ""
	onboarding_last_guidance_time = 0.0
	onboarding_mine_target_id = -1
	pending_onboarding_mission_offer_index = -1
	onboarding_move_progress = 0.0
	completed_intro_missions.clear()
	intro_tab_visits.clear()
	onboarding_completed_steps.clear()
	for step_id in ONBOARDING_STEP_ORDER:
		onboarding_completed_steps[step_id] = false


func onboarding_completed_count() -> int:
	var completed := 0
	for mission_id in all_intro_mission_ids():
		if intro_mission_completed(mission_id):
			completed += 1
	return completed


func next_onboarding_step_id() -> String:
	for mission_id in ["intro_flight_controls", "intro_head_to_board"]:
		if not intro_mission_completed(mission_id):
			return mission_id
	return ""


func current_onboarding_step_data() -> Dictionary:
	return {}


func should_show_onboarding() -> bool:
	return bool(settings_manager().get_value("gameplay", "show_onboarding"))


func has_incomplete_onboarding() -> bool:
	return onboarding_completed_count() < all_intro_mission_ids().size()


func onboarding_fully_completed() -> bool:
	return onboarding_completed_count() >= all_intro_mission_ids().size()


func onboarding_can_be_reenabled() -> bool:
	return not onboarding_completion_acknowledged


func should_show_onboarding_completion_popup() -> bool:
	return onboarding_fully_completed() and not onboarding_completion_acknowledged


func open_guided_mission_popup(title_text: String, badge_text: String, step_text: String, body_text: String, primary_text: String, secondary_text: String = "", mode: String = "") -> void:
	guided_mission_popup_title.text = title_text
	guided_mission_popup_badge.text = badge_text
	guided_mission_popup_step.text = step_text
	guided_mission_popup_body.text = body_text
	guided_mission_popup_primary_button.text = primary_text
	guided_mission_popup_secondary_button.visible = not secondary_text.is_empty()
	guided_mission_popup_secondary_button.text = secondary_text
	guided_mission_popup.visible = true
	if guided_mission_popup.get_parent() != null:
		guided_mission_popup.get_parent().move_child(guided_mission_popup, -1)
	onboarding_popup_mode = mode
	onboarding_last_guidance_time = 0.0
	call_deferred("resize_guided_mission_popup_to_content")
	hide_tooltip()
	update_hud()


func close_guided_mission_popup() -> void:
	guided_mission_popup.visible = false
	if onboarding_popup_mode == "intro_complete":
		pending_intro_popup_complete_mission_id = ""
	onboarding_popup_mode = ""
	update_hud()


func complete_intro_popup_mission() -> void:
	var mission_id: String = pending_intro_popup_complete_mission_id
	pending_intro_popup_complete_mission_id = ""
	close_guided_mission_popup()
	var mission_index: int = find_active_mission_index_by_id(mission_id)
	if mission_index < 0:
		return
	var mission: Dictionary = active_missions[mission_index]
	if not is_intro_mission(mission):
		return
	mission["progress"] = int(mission.get("goal", 1))
	handle_intro_mission_completion(mission_index)


func resize_guided_mission_popup_to_content() -> void:
	if guided_mission_popup == null:
		return
	var popup_width: float = 520.0
	var inner_width: float = popup_width - float(guided_mission_popup_margin.get_theme_constant("margin_left") + guided_mission_popup_margin.get_theme_constant("margin_right"))
	guided_mission_popup_title.custom_minimum_size = Vector2(inner_width * 0.68, 0.0)
	guided_mission_popup_badge.custom_minimum_size = Vector2(inner_width * 0.24, 0.0)
	guided_mission_popup_step.custom_minimum_size = Vector2(inner_width, 0.0)
	guided_mission_popup_body.custom_minimum_size = Vector2(inner_width, 0.0)
	guided_mission_popup_title.reset_size()
	guided_mission_popup_badge.reset_size()
	guided_mission_popup_step.reset_size()
	guided_mission_popup_body.reset_size()
	guided_mission_popup_primary_button.reset_size()
	guided_mission_popup_secondary_button.reset_size()
	var separation: float = float(guided_mission_popup_vbox.get_theme_constant("separation"))
	var margin_total: float = float(guided_mission_popup_margin.get_theme_constant("margin_top") + guided_mission_popup_margin.get_theme_constant("margin_bottom"))
	var content_height: float = 0.0
	var visible_children: int = 0
	for child in guided_mission_popup_vbox.get_children():
		if child is Control and child.visible:
			content_height += (child as Control).get_combined_minimum_size().y
			visible_children += 1
	content_height += separation * max(visible_children - 1, 0)
	var popup_height: float = ceil(content_height + margin_total)
	guided_mission_popup.custom_minimum_size = Vector2(popup_width, popup_height)
	guided_mission_popup.size = Vector2(popup_width, popup_height)


func open_onboarding_offer_popup() -> void:
	open_guided_mission_popup(
		"INTRODUCTION MISSIONS",
		"OFFER",
		"Optional guided mission set",
		"Would you like to begin the introduction mission flow? It starts with a short forced setup, then unlocks gold-highlighted tutorial contracts on the mission board.",
		"BEGIN",
		"NOT NOW",
		"offer"
	)


func open_onboarding_step_popup(step_id: String, reminder: bool = false) -> void:
	if step_id.is_empty():
		return
	var step_data: Dictionary = ONBOARDING_STEP_DATA.get(step_id, {})
	if step_id == "mine":
		ensure_onboarding_mine_target()
	onboarding_current_step_popup = step_id
	open_guided_mission_popup(
		str(step_data.get("brief_title", "Mission Briefing")),
		"REMINDER" if reminder else "BRIEF",
		str(step_data.get("title", step_id)),
		str(step_data.get("brief_body", step_data.get("hint", ""))),
		"CONTINUE",
		"",
		"step"
	)


func accept_onboarding_mission() -> void:
	begin_intro_mission_flow()


func decline_onboarding_mission() -> void:
	onboarding_offer_pending = false
	onboarding_declined = true
	onboarding_active = false
	close_guided_mission_popup()


func open_onboarding_completion_popup() -> void:
	open_guided_mission_popup(
		"FLIGHT TRAINING COMPLETE",
		"COMPLETE",
		"Pilot clearance granted",
		"You completed the full onboarding run and proved you can fly, extract, dock, trade, and navigate station services. Your first real contract is ready to go live. Take a breath, then head out and make the lane yours.",
		"ACCEPT CONTRACT",
		"",
		"completion"
	)


func open_onboarding_finished_popup() -> void:
	open_guided_mission_popup(
		"INTRODUCTION COMPLETE",
		"COMPLETE",
		"Core tutorials archived",
		"You completed all introduction missions. They will now stay archived, and the replay option for the intro set will be locked for this save.",
		"CLOSE",
		"",
		"finished"
	)


func acknowledge_onboarding_completion() -> void:
	onboarding_completion_acknowledged = true
	settings_manager().set_value("gameplay", "show_onboarding", false)
	onboarding_active = false
	onboarding_offer_pending = false
	onboarding_declined = false
	close_guided_mission_popup()
	refresh_options_from_settings()
	update_hud()


func assign_mission_from_offer(offer_index: int) -> void:
	if offer_index < 0 or offer_index >= mission_offers.size():
		return
	var accepted_offer: Dictionary = sanitize_mission_definition(mission_offers[offer_index])
	var mission: Dictionary = accepted_offer
	mission["progress"] = 0
	mission["ready_to_turn_in"] = false
	if is_intro_mission(mission):
		mission = configure_intro_mission_instance(mission)
		apply_intro_mission_start_grants(mission)
	else:
		mission["target_system_id"] = current_system_id
		mission["target_map_coord"] = pick_mission_target_map(mission)
		if is_derelict_contract(mission):
			mission["mission_derelict_position"] = random_position_in_map_local(false)
	if mission_requires_delivery(mission):
		var delivery_item: StringName = mission["deliver_item"]
		var delivery_goal: int = int(mission.get("goal", 0))
		var available_delivery_count: int = total_accessible_item_count(delivery_item)
		mission["progress"] = min(available_delivery_count, delivery_goal)
		if int(mission["progress"]) >= delivery_goal:
			mission["ready_to_turn_in"] = true
	mission_offers.remove_at(offer_index)
	active_missions.append(mission)
	set_tracked_mission_index(active_missions.size() - 1)
	ensure_active_mission_derelict_spawned()
	mission_board_view = "active"
	last_status_message = "Accepted %s contract: %s." % [faction_name(str(current_mission.get("faction", ""))), current_mission["short_name"]]
	push_telemetry_event("%s contract accepted: %s. Target map: %s." % [faction_name(str(current_mission.get("faction", ""))), current_mission["short_name"], mission_map_label(current_mission)], "mission")
	if bool(current_mission.get("important", false)):
		if bool(current_mission.get("intro_complete_on_continue", false)):
			pending_intro_popup_complete_mission_id = str(current_mission.get("id", ""))
			open_intro_stage_popup(
				current_mission,
				str(current_mission.get("intro_accept_badge", "IMPORTANT")),
				str(current_mission.get("intro_accept_step", "Mission accepted")),
				str(current_mission.get("intro_accept_body", current_mission.get("description", ""))),
				str(current_mission.get("intro_accept_primary", "UNDERSTOOD")),
				"intro_complete"
			)
		else:
			open_intro_stage_popup(
				current_mission,
				"IMPORTANT",
				"Mission accepted",
				"%s\n\nTarget: %s" % [str(current_mission.get("description", "")), mission_target_label(current_mission)]
			)
	update_hud()


func finalize_onboarding_mission_accept() -> void:
	var offer_index: int = pending_onboarding_mission_offer_index
	pending_onboarding_mission_offer_index = -1
	close_guided_mission_popup()
	mark_onboarding_step("mission")
	assign_mission_from_offer(offer_index)


func guided_onboarding_overlay_blocked() -> bool:
	return transfer_popup.visible or dock_prompt_popup.visible or boarding_prompt_popup.visible or scan_mode_popup.visible or field_console_popup.visible or pause_popup.visible or options_popup.visible


func update_guided_onboarding(_delta: float) -> void:
	if should_show_onboarding_completion_popup():
		clear_onboarding_guidance_contact()
		if not guided_onboarding_overlay_blocked() and onboarding_popup_mode != "finished":
			open_onboarding_finished_popup()
		return
	if not should_show_onboarding() or not has_incomplete_onboarding():
		clear_onboarding_guidance_contact()
		return
	if guided_mission_popup.visible or guided_onboarding_overlay_blocked():
		return
	if onboarding_offer_pending and not onboarding_declined:
		clear_onboarding_guidance_contact()
		open_onboarding_offer_popup()
		return
	clear_onboarding_guidance_contact()


func clear_onboarding_guidance_contact() -> void:
	if str(tracked_scan_contact.get("kind", "")) == "onboarding_dock":
		tracked_scan_contact = {}


func refresh_onboarding_guidance_contact() -> void:
	clear_onboarding_guidance_contact()


func onboarding_mine_target():
	if onboarding_mine_target_id == -1:
		return null
	for child in resource_layer.get_children():
		if child.get_instance_id() == onboarding_mine_target_id:
			return child
	return null


func ensure_onboarding_mine_target() -> void:
	if not onboarding_active or next_onboarding_step_id() != "mine":
		onboarding_mine_target_id = -1
		return
	var current_target = onboarding_mine_target()
	if current_target != null and is_instance_valid(current_target) and not node_requires_higher_mining_stage(current_target):
		tracked_scan_contact = {
			"kind": "training_mine",
			"label": "Training Resource Node",
			"position": current_target.global_position,
		}
		return

	var best_resource = null
	var best_distance: float = INF
	for child in resource_layer.get_children():
		if node_requires_higher_mining_stage(child):
			continue
		if int(child.max_amount) > 5:
			continue
		if bool(child.is_derelict_ship):
			continue
		var distance: float = player.global_position.distance_to(child.global_position)
		if distance < best_distance:
			best_distance = distance
			best_resource = child

	if best_resource == null:
		var resource = RESOURCE_SCENE.instantiate()
		var template: Dictionary = apply_resource_trait(pick_resource_template())
		template["amount_min"] = 3
		template["amount_max"] = 4
		template["primary_resource"] = ORE
		template["rare_chance"] = 0.0
		template["node_name"] = "Training Ore Node"
		template["scan_description"] = "A small low-yield ore node flagged for flight training extraction."
		var texture_variant: Dictionary = pick_resource_texture_variant(template)
		resource.configure({
			"primary_resource": template["primary_resource"],
			"primary_label": get_item_definition(template["primary_resource"])["name"],
			"rare_resource": StringName(),
			"rare_label": "",
			"rare_chance": 0.0,
			"node_name": template["node_name"],
			"scan_description": template["scan_description"],
			"body_color": template["body_color"],
			"texture": texture_variant.get("texture", null),
			"texture_scale_bonus": float(texture_variant.get("scale_bonus", 1.0)),
			"texture_tint": template.get("texture_tint", Color(1.0, 1.0, 1.0, 1.0)),
			"trait_name": "Training Mark",
			"trait_description": "A low-yield node marked for supervised extraction drills.",
			"required_mining_stage": 0,
			"extraction_hint": template["scan_description"],
			"amount": 4,
			"interval": 0.7,
			"scale_multiplier": 0.9,
		})
		resource.position = random_position_in_current_map(300.0, true)
		resource_layer.add_child(resource)
		best_resource = resource

	onboarding_mine_target_id = best_resource.get_instance_id()
	tracked_scan_contact = {
		"kind": "training_mine",
		"label": str(best_resource.node_name),
		"position": best_resource.global_position,
	}


func guided_station_highlight_targets() -> Array[Button]:
	var targets: Array[Button] = []
	if not dock_screen.visible:
		return targets

	if onboarding_active:
		match next_onboarding_step_id():
			"sell":
				if current_dock_room == "":
					targets.append(exchange_room_button)
				elif current_dock_room != "exchange":
					targets.append(dock_back_button)
				else:
					targets.append(sell_button)
			"mission":
				if current_dock_room == "":
					targets.append(mission_room_button)
				elif current_dock_room != "mission":
					targets.append(dock_back_button)
		if not targets.is_empty():
			return targets

	if has_active_mission():
		var mission_targets: Array[Button] = active_mission_guidance_buttons()
		for target_button in mission_targets:
			if target_button != null and not targets.has(target_button):
				targets.append(target_button)
	return targets


func mission_target_station_room(mission: Dictionary = current_mission) -> String:
	if mission.is_empty():
		return ""
	if mission_needs_turn_in(mission):
		return "mission"
	match str(mission.get("id", "")):
		"intro_head_to_board":
			return "mission"
		"intro_station_inventory":
			return "storage"
		"intro_refining":
			return "refinery"
		"intro_market", "intro_market_prices":
			return "exchange"
		"intro_crafting_explained":
			return "crafting"
		"intro_research":
			return "research"
		"intro_spec_training":
			return "crew"
		"intro_ship_maintenance", "intro_restock_explained":
			return "shipyard"
		"sell_value", "trade_circuit":
			return "exchange"
		"refine_goods", "fuel_exchange":
			return "refinery"
		"bulk_alloy_order":
			return "crafting"
		"buy_upgrade":
			return "shipyard"
		_:
			return ""


func active_mission_station_action_buttons() -> Array[Button]:
	var buttons: Array[Button] = []
	if not has_active_mission():
		return buttons
	if mission_needs_turn_in(current_mission):
		if mission_board_view != "active":
			buttons.append(mission_active_button)
			return buttons
		for action_button in mission_board_action_buttons:
			if action_button != null and is_instance_valid(action_button) and not action_button.disabled:
				buttons.append(action_button)
		if buttons.is_empty():
			buttons.append(mission_active_button)
		return buttons

	match mission_target_station_room(current_mission):
		"exchange":
			buttons.append(sell_button)
		"refinery":
			buttons.append(refine_button)
		"research":
			buttons.append(research_room_button)
		"crafting":
			buttons.append(crafting_detail_button)
		"shipyard":
			for upgrade_button in [engine_button, cargo_button, mining_button, fuel_button]:
				if upgrade_button != null and is_instance_valid(upgrade_button) and not upgrade_button.disabled:
					buttons.append(upgrade_button)
			if buttons.is_empty():
				buttons.append(engine_button)
	return buttons


func active_mission_guidance_buttons() -> Array[Button]:
	var targets: Array[Button] = []
	if not has_active_mission():
		return targets
	var target_room: String = mission_target_station_room(current_mission)
	if target_room.is_empty():
		return targets
	if current_dock_room == "":
		match target_room:
			"exchange":
				targets.append(exchange_room_button)
			"storage":
				targets.append(storage_room_button)
			"refinery":
				targets.append(refinery_room_button)
			"research":
				targets.append(research_room_button)
			"crafting":
				targets.append(crafting_room_button)
			"shipyard":
				targets.append(shipyard_room_button)
			"crew":
				targets.append(crew_room_button)
			"mission":
				targets.append(mission_room_button)
		return targets
	if current_dock_room != target_room:
		targets.append(dock_back_button)
		return targets
	for action_button in active_mission_station_action_buttons():
		if action_button != null and not targets.has(action_button):
			targets.append(action_button)
	return targets


func apply_guided_station_highlights() -> void:
	style_button_secondary(dock_back_button)
	style_button_secondary(exchange_room_button)
	style_button_secondary(storage_room_button)
	style_button_secondary(refinery_room_button)
	style_button_secondary(crafting_room_button)
	style_button_secondary(shipyard_room_button)
	style_button_secondary(crew_room_button)
	style_button_secondary(research_room_button)
	style_button_secondary(faction_room_button)
	style_button_secondary(pilot_profile_button)
	style_button_secondary(mission_room_button)
	style_button_secondary(cargo_room_button)
	style_button_secondary(mission_available_button)
	style_button_secondary(mission_active_button)
	style_button_secondary(sell_button)
	style_button_secondary(refine_button)
	style_button_primary(crafting_detail_button, Color(0.68, 0.45, 0.16, 0.95), Color(0.88, 0.6, 0.22, 0.98))
	style_button_secondary(engine_button)
	style_button_secondary(cargo_button)
	style_button_secondary(mining_button)
	style_button_secondary(fuel_button)
	var pulse: float = 0.6 + 0.4 * (0.5 + 0.5 * sin(onboarding_highlight_pulse * 3.2))
	for button in guided_station_highlight_targets():
		button.add_theme_stylebox_override("normal", make_panel_style(Color(0.22, 0.18, 0.08, 0.98), Color(1.0, 0.84, 0.34, 0.5 + pulse * 0.35), 16, 2))
		button.add_theme_stylebox_override("hover", make_panel_style(Color(0.28, 0.22, 0.08, 0.98), Color(1.0, 0.9, 0.46, 0.72 + pulse * 0.2), 16, 2))
		button.add_theme_stylebox_override("pressed", make_panel_style(Color(0.18, 0.14, 0.06, 0.98), Color(1.0, 0.78, 0.28, 0.7 + pulse * 0.18), 16, 2))


func resize_onboarding_panel_to_content() -> void:
	if onboarding_panel == null:
		return
	var panel_width: float = TRACKER_PANEL_WIDTH
	var margin_total: float = float(onboarding_margin.get_theme_constant("margin_top") + onboarding_margin.get_theme_constant("margin_bottom"))
	var body_width: float = max(panel_width - float(onboarding_margin.get_theme_constant("margin_left") + onboarding_margin.get_theme_constant("margin_right")), 180.0)
	onboarding_title.custom_minimum_size = Vector2(body_width, 0.0)
	onboarding_status.custom_minimum_size = Vector2(body_width, 0.0)
	onboarding_body.custom_minimum_size = Vector2(body_width, 0.0)
	onboarding_title.reset_size()
	onboarding_status.reset_size()
	onboarding_body.reset_size()
	onboarding_panel.reset_size()
	var separation: float = float(onboarding_vbox.get_theme_constant("separation"))
	var content_height: float = onboarding_title.get_combined_minimum_size().y + onboarding_status.get_combined_minimum_size().y + onboarding_body.get_combined_minimum_size().y + separation * 2.0
	var desired_height: float = ceil(content_height + margin_total)
	onboarding_panel.custom_minimum_size = Vector2(panel_width, desired_height)
	onboarding_panel.size = Vector2(panel_width, desired_height)


func refresh_onboarding_panel() -> void:
	if onboarding_panel == null:
		return
	var gameplay_overlay_hidden: bool = dock_screen.visible or field_console_popup.visible or transfer_popup.visible or dock_prompt_popup.visible or boarding_prompt_popup.visible or scan_mode_popup.visible or pause_popup.visible or guided_mission_popup.visible
	var show_tracker: bool = has_active_mission() and not gameplay_overlay_hidden
	onboarding_panel.visible = show_tracker
	if not show_tracker:
		return

	onboarding_title.text = "MISSION TRACKER"
	onboarding_status.text = "Tracked: %s" % str(current_mission.get("short_name", "No active contract"))
	var mission_lines: Array[String] = []
	mission_lines.append("Issuer: %s" % faction_name(str(current_mission.get("faction", ""))))
	mission_lines.append("Progress: %s" % mission_progress_label(current_mission))
	if mission_needs_turn_in(current_mission):
		mission_lines.append("Status: Ready to turn in at station")
	if active_missions.size() > 1:
		mission_lines.append("")
		mission_lines.append("Other active contracts:")
		for mission_index in range(active_missions.size()):
			if mission_index == current_mission_index:
				continue
			mission_lines.append("- %s" % str(active_missions[mission_index].get("short_name", "Contract")))
	onboarding_body.text = "\n".join(mission_lines)
	apply_tracker_scale()
	call_deferred("apply_tracker_scale")


func rebuild_field_mission_list() -> void:
	if field_mission_list == null:
		return
	for child in field_mission_list.get_children():
		child.queue_free()
	if active_missions.is_empty():
		field_mission_list_title.visible = false
		return
	field_mission_list_title.visible = true
	for mission_index in range(active_missions.size()):
		var mission: Dictionary = active_missions[mission_index]
		var mission_button := Button.new()
		mission_button.text = "TRACKED  |  %s" % str(mission.get("short_name", "Contract")) if mission_index == current_mission_index else "TRACK  |  %s" % str(mission.get("short_name", "Contract"))
		mission_button.custom_minimum_size = Vector2(0.0, 42.0)
		mission_button.alignment = HORIZONTAL_ALIGNMENT_LEFT
		mission_button.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
		mission_button.tooltip_text = "Switch tracked contract to %s" % str(mission.get("short_name", "Contract")) if mission_index != current_mission_index else "Currently tracked contract"
		if mission_index == current_mission_index:
			mission_button.disabled = true
			mission_button.add_theme_stylebox_override("normal", make_panel_style(Color(0.16, 0.22, 0.3, 0.96), Color(1.0, 0.74, 0.34, 0.55), 14, 2))
			mission_button.add_theme_stylebox_override("hover", make_panel_style(Color(0.16, 0.22, 0.3, 0.96), Color(1.0, 0.74, 0.34, 0.55), 14, 2))
			mission_button.add_theme_stylebox_override("pressed", make_panel_style(Color(0.16, 0.22, 0.3, 0.96), Color(1.0, 0.74, 0.34, 0.55), 14, 2))
		else:
			style_button_secondary(mission_button)
			mission_button.pressed.connect(func(target_index := mission_index) -> void:
				set_tracked_mission_index(target_index)
				update_hud()
			)
		field_mission_list.add_child(mission_button)


func mark_onboarding_step(step_id: String) -> void:
	if not onboarding_active:
		return
	if not onboarding_completed_steps.has(step_id):
		return
	if bool(onboarding_completed_steps.get(step_id, false)):
		return

	onboarding_completed_steps[step_id] = true
	onboarding_last_guidance_time = 0.0
	if step_id == "move":
		onboarding_move_progress = 0.0
	var step_data: Dictionary = ONBOARDING_STEP_DATA.get(step_id, {})
	push_telemetry_event("Flight training updated: %s complete." % str(step_data.get("title", step_id)), "system")

	var next_step := next_onboarding_step_id()
	if next_step.is_empty():
		onboarding_active = false
		onboarding_current_step_popup = ""
		if not onboarding_completion_announced:
			onboarding_completion_announced = true
			onboarding_offer_pending = false
			last_status_message = "Flight training complete. You are cleared for open operations."
			push_telemetry_event("Flight training complete. Core operations unlocked.", "mission")
	else:
		var next_data: Dictionary = ONBOARDING_STEP_DATA.get(next_step, {})
		onboarding_current_step_popup = ""
		last_status_message = "Flight training updated. Next: %s." % str(next_data.get("title", next_step))

	refresh_onboarding_panel()
	update_hud()


# --- Save / load serialization ---
func sanitize_save_value(value):
	match typeof(value):
		TYPE_DICTIONARY:
			var sanitized := {}
			for key in value.keys():
				sanitized[str(key)] = sanitize_save_value(value[key])
			return sanitized
		TYPE_ARRAY:
			var sanitized_array: Array = []
			for entry in value:
				sanitized_array.append(sanitize_save_value(entry))
			return sanitized_array
		TYPE_VECTOR2:
			return {"__type": "Vector2", "x": value.x, "y": value.y}
		TYPE_VECTOR2I:
			return {"__type": "Vector2i", "x": value.x, "y": value.y}
		TYPE_STRING_NAME:
			return str(value)
		_:
			return value


func restore_save_value(value):
	match typeof(value):
		TYPE_DICTIONARY:
			if value.has("__type"):
				match str(value["__type"]):
					"Vector2":
						return Vector2(float(value.get("x", 0.0)), float(value.get("y", 0.0)))
					"Vector2i":
						return Vector2i(int(value.get("x", 0)), int(value.get("y", 0)))
			var restored := {}
			for key in value.keys():
				restored[str(key)] = restore_save_value(value[key])
			return restored
		TYPE_ARRAY:
			var restored_array: Array = []
			for entry in value:
				restored_array.append(restore_save_value(entry))
			return restored_array
		_:
			return value


func build_save_data() -> Dictionary:
	ensure_tracked_mission_valid()
	return {
		"saved_at": Time.get_datetime_string_from_system(),
		"profile": {
			"credits": credits,
			"experience": experience,
			"level": level,
			"skill_points": skill_points,
		},
		"progression": {
			"upgrades": sanitize_save_value(upgrades),
			"skill_node_ranks": sanitize_save_value(skill_node_ranks),
			"use_skill_progress": sanitize_save_value(use_skill_progress),
			"research_node_ranks": sanitize_save_value(research_node_ranks),
			"research_units": research_units,
			"data_fragments": data_fragments,
			"claimed_scan_data": sanitize_save_value(claimed_scan_data),
			"faction_reputation": sanitize_save_value(faction_reputation),
			"total_stats": sanitize_save_value(total_stats),
		},
		"ship": {
			"current_fuel": current_fuel,
			"player_hull": player_hull,
			"player_shield": player_shield,
			"special_ammo": special_ammo,
			"combat_mode": combat_mode,
		},
		"location": {
			"current_system_id": current_system_id,
			"current_map_coord": sanitize_save_value(current_map_coord),
			"player_position": sanitize_save_value(player.global_position),
			"system_name": current_system_name(),
			"map_name": current_map_name(),
			"docked_at_station": docked_at_station,
			"current_dock_room": current_dock_room,
		},
		"inventory": {
			"cargo": sanitize_save_value(cargo),
			"station_storage": sanitize_save_value(station_storage),
			"station_storage_capacity": station_storage_capacity,
			"station_storage_upgrades": station_storage_upgrades,
		},
		"missions": {
			"current_mission": sanitize_save_value(current_mission),
			"active_missions": sanitize_save_value(active_missions),
			"current_mission_index": current_mission_index,
			"mission_offers": sanitize_save_value(mission_offers),
			"mission_board_view": mission_board_view,
			"next_offer_uid": next_mission_offer_uid,
		},
		"systems": {
			"discovered_maps": sanitize_save_value(discovered_maps),
			"last_scan_mode": last_scan_mode,
		},
		"onboarding": {
			"active": onboarding_active,
			"completed_steps": sanitize_save_value(onboarding_completed_steps),
			"completed_intro_missions": sanitize_save_value(completed_intro_missions),
			"intro_tab_visits": sanitize_save_value(intro_tab_visits),
			"completion_announced": onboarding_completion_announced,
			"completion_acknowledged": onboarding_completion_acknowledged,
			"declined": onboarding_declined,
			"offer_pending": onboarding_offer_pending,
			"current_step_popup": onboarding_current_step_popup,
		},
		"market": {
			"price_multipliers": sanitize_save_value(market_price_multipliers),
		},
		"debug": {
			"combat_test_spawned": combat_test_spawned,
			"combat_test_spawn_timer": combat_test_spawn_timer,
		},
	}


func apply_save_data(data: Dictionary) -> void:
	var profile: Dictionary = restore_save_value(data.get("profile", {}))
	var progression: Dictionary = restore_save_value(data.get("progression", {}))
	var ship_state: Dictionary = restore_save_value(data.get("ship", {}))
	var location: Dictionary = restore_save_value(data.get("location", {}))
	var inventory: Dictionary = restore_save_value(data.get("inventory", {}))
	var missions: Dictionary = restore_save_value(data.get("missions", {}))
	var systems: Dictionary = restore_save_value(data.get("systems", {}))
	var onboarding_state: Dictionary = restore_save_value(data.get("onboarding", {}))
	var market_state: Dictionary = restore_save_value(data.get("market", {}))
	var debug_state: Dictionary = restore_save_value(data.get("debug", {}))

	credits = int(profile.get("credits", credits))
	experience = int(profile.get("experience", experience))
	level = clampi(int(profile.get("level", level)), 1, MAX_PLAYER_LEVEL)
	skill_points = int(profile.get("skill_points", skill_points))

	var saved_upgrades: Dictionary = progression.get("upgrades", {})
	for upgrade_type in upgrades.keys():
		upgrades[upgrade_type] = int(saved_upgrades.get(upgrade_type, upgrades[upgrade_type]))

	skill_node_ranks = {}
	for node_id in progression.get("skill_node_ranks", {}).keys():
		skill_node_ranks[str(node_id)] = int(progression["skill_node_ranks"][node_id])
	initialize_use_skill_progress()
	for skill_id in progression.get("use_skill_progress", {}).keys():
		var saved_skill: Dictionary = progression["use_skill_progress"][skill_id]
		if not use_skill_progress.has(str(skill_id)):
			continue
		use_skill_progress[str(skill_id)] = {
			"level": max(int(saved_skill.get("level", 0)), 0),
			"xp": float(saved_skill.get("xp", 0.0)),
			"total_xp": float(saved_skill.get("total_xp", 0.0)),
		}
	research_node_ranks = {}
	for node_id in progression.get("research_node_ranks", {}).keys():
		research_node_ranks[str(node_id)] = int(progression["research_node_ranks"][node_id])
	research_units = int(progression.get("research_units", 0))
	data_fragments = int(progression.get("data_fragments", 0))
	claimed_scan_data = progression.get("claimed_scan_data", {})

	for faction_id in faction_reputation.keys():
		faction_reputation[faction_id] = int(progression.get("faction_reputation", {}).get(faction_id, faction_reputation[faction_id]))

	for stat_key in total_stats.keys():
		total_stats[stat_key] = int(progression.get("total_stats", {}).get(stat_key, total_stats[stat_key]))

	cargo = make_empty_item_store()
	for item_type in inventory.get("cargo", {}).keys():
		if cargo.has(StringName(item_type)):
			cargo[StringName(item_type)] = int(inventory["cargo"][item_type])

	station_storage.clear()
	for slot_data in inventory.get("station_storage", []):
		if typeof(slot_data) != TYPE_DICTIONARY:
			continue
		station_storage.append({
			"type": StringName(str(slot_data.get("type", ""))),
			"count": int(slot_data.get("count", 0)),
		})
	station_storage_capacity = max(int(inventory.get("station_storage_capacity", STARTING_STORAGE_SLOTS)), STARTING_STORAGE_SLOTS)
	station_storage_upgrades = int(inventory.get("station_storage_upgrades", 0))

	active_missions.clear()
	for mission_variant in missions.get("active_missions", []):
		if typeof(mission_variant) == TYPE_DICTIONARY:
			active_missions.append(sanitize_mission_definition(mission_variant))
	if active_missions.is_empty():
		var legacy_mission: Dictionary = sanitize_mission_definition(missions.get("current_mission", {}))
		if not legacy_mission.is_empty():
			active_missions.append(legacy_mission)
	mission_offers.clear()
	for offer in missions.get("mission_offers", []):
		if typeof(offer) == TYPE_DICTIONARY:
			mission_offers.append(sanitize_mission_definition(offer))
	mission_board_view = str(missions.get("mission_board_view", "available"))
	next_mission_offer_uid = max(int(missions.get("next_offer_uid", next_mission_offer_uid)), 1)
	set_tracked_mission_index(int(missions.get("current_mission_index", 0 if not active_missions.is_empty() else -1)))

	discovered_maps = systems.get("discovered_maps", {})
	last_scan_mode = str(systems.get("last_scan_mode", last_scan_mode))

	if onboarding_state.is_empty():
		var should_skip_onboarding: bool = level > 1 or credits > 90 or total_stats["ore_mined"] > 0 or total_stats["missions_completed"] > 0
		if should_skip_onboarding:
			for step_id in ONBOARDING_STEP_ORDER:
				onboarding_completed_steps[step_id] = true
			for mission_id in all_intro_mission_ids():
				completed_intro_missions[mission_id] = true
			onboarding_active = false
			onboarding_completion_announced = true
			onboarding_completion_acknowledged = true
		else:
			reset_onboarding_progress()
	else:
		onboarding_active = bool(onboarding_state.get("active", true))
		onboarding_completion_announced = bool(onboarding_state.get("completion_announced", false))
		onboarding_declined = bool(onboarding_state.get("declined", false))
		onboarding_offer_pending = bool(onboarding_state.get("offer_pending", false))
		onboarding_current_step_popup = str(onboarding_state.get("current_step_popup", ""))
		onboarding_popup_mode = ""
		onboarding_last_guidance_time = 0.0
		for step_id in ONBOARDING_STEP_ORDER:
			onboarding_completed_steps[step_id] = bool(onboarding_state.get("completed_steps", {}).get(step_id, false))
		completed_intro_missions = restore_save_value(onboarding_state.get("completed_intro_missions", {}))
		intro_tab_visits = restore_save_value(onboarding_state.get("intro_tab_visits", {}))
		onboarding_completion_acknowledged = bool(onboarding_state.get("completion_acknowledged", onboarding_completion_announced and onboarding_fully_completed()))
	if onboarding_completion_acknowledged:
		settings_manager().set_value("gameplay", "show_onboarding", false)

	for item_type in market_price_multipliers.keys():
		market_price_multipliers[item_type] = float(market_state.get("price_multipliers", {}).get(str(item_type), market_price_multipliers[item_type]))

	current_system_id = str(location.get("current_system_id", current_system_id))
	current_map_coord = Vector2i(location.get("current_map_coord", current_map_coord))
	recalculate_ship_stats()
	current_fuel = clampf(float(ship_state.get("current_fuel", ship_stats["fuel_capacity"])), 0.0, ship_stats["fuel_capacity"])
	player_hull = clampi(int(ship_state.get("player_hull", player_hull)), 0, player_hull_cap())
	player_shield = clampf(float(ship_state.get("player_shield", player_shield_cap())), 0.0, player_shield_cap())
	if not ship_state.has("player_shield"):
		player_shield = player_shield_cap()
	player_shield_recharge_delay = 0.0
	special_ammo = clampi(int(ship_state.get("special_ammo", special_ammo)), 0, SPECIAL_MISSILE_MAX_AMMO)
	combat_mode = bool(ship_state.get("combat_mode", false))

	docked_at_station = bool(location.get("docked_at_station", false))
	current_dock_room = str(location.get("current_dock_room", ""))
	docking_pull_in_progress = false
	docking_menu_delay = -1.0
	docking_prompt_suppressed = false
	return_to_dock_on_popup_close = false
	tracked_scan_contact = {}
	lock_target_id = -1
	lock_progress = 0.0
	last_lock_target_id = -1
	shield_hit_effects.clear()
	pending_boarding_hostile_id = -1
	pending_boarding_derelict_id = 0
	pending_boarding_mode = ""
	boarding_prompt_popup.visible = false
	dock_prompt_popup.visible = false
	scan_mode_popup.visible = false
	transfer_popup.visible = false
	field_console_popup.visible = false
	guided_mission_popup.visible = false
	combat_test_spawned = bool(debug_state.get("combat_test_spawned", true))
	combat_test_spawn_timer = float(debug_state.get("combat_test_spawn_timer", 3.5))

	enter_current_map(false)

	var loaded_position: Vector2 = location.get("player_position", Vector2.ZERO)
	player.global_position = loaded_position
	player.force_stop()
	player.reset_camera_to_ship()
	last_piloting_position = player.global_position
	piloting_distance_accumulator = 0.0

	if docked_at_station and has_station_in_current_map():
		player.global_position = station.global_position
		dock_screen.visible = true
		show_station_main_menu()
		if not current_dock_room.is_empty():
			open_station_room(current_dock_room)
	else:
		docked_at_station = false
		dock_screen.visible = false

	last_status_message = "Flight state restored."
	close_pause_menu()
	refresh_onboarding_panel()
	update_hud()


# --- Inventory / cargo UI ---
func get_item_definition(item_type: StringName) -> Dictionary:
	return item_data.get(item_type, {
		"name": str(item_type).capitalize(),
		"description": "Unknown cargo.",
		"value": 0,
		"fill": Color(0.6, 0.6, 0.6),
		"accent": Color(0.3, 0.3, 0.3),
	})


func build_item_entry(item_type: StringName, count: int) -> Dictionary:
	var data := get_item_definition(item_type)
	return {
		"type": item_type,
		"name": data["name"],
		"count": count,
		"description": data["description"],
		"value": data["value"],
		"weight": data["weight"],
	}


func initialize_use_skill_progress() -> void:
	use_skill_progress.clear()
	for skill_id in USE_SKILL_ORDER:
		use_skill_progress[skill_id] = {
			"level": 0,
			"xp": 0.0,
			"total_xp": 0.0,
		}


func build_field_skill_rows() -> void:
	for child in field_skills_list.get_children():
		child.queue_free()
	field_skill_rows.clear()
	for skill_id in USE_SKILL_ORDER:
		var row_panel := PanelContainer.new()
		var row_margin := MarginContainer.new()
		var row_vbox := VBoxContainer.new()
		var header := HBoxContainer.new()
		var name_label := Label.new()
		var level_label := Label.new()
		var progress_bar := ProgressBar.new()
		var detail_label := Label.new()
		row_margin.add_theme_constant_override("margin_left", 12)
		row_margin.add_theme_constant_override("margin_top", 10)
		row_margin.add_theme_constant_override("margin_right", 12)
		row_margin.add_theme_constant_override("margin_bottom", 10)
		row_vbox.add_theme_constant_override("separation", 6)
		header.add_theme_constant_override("separation", 10)
		name_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		progress_bar.max_value = 100.0
		progress_bar.show_percentage = false
		detail_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		row_panel.add_child(row_margin)
		row_margin.add_child(row_vbox)
		row_vbox.add_child(header)
		header.add_child(name_label)
		header.add_child(level_label)
		row_vbox.add_child(progress_bar)
		row_vbox.add_child(detail_label)
		field_skills_list.add_child(row_panel)
		field_skill_rows[skill_id] = {
			"panel": row_panel,
			"name": name_label,
			"level": level_label,
			"bar": progress_bar,
			"detail": detail_label,
		}


func use_skill_xp_to_next_level(skill_level: int) -> float:
	return 20.0 + float(skill_level * 8) + pow(float(skill_level), 1.35) * 4.0


func use_skill_level(skill_id: String) -> int:
	return int(use_skill_progress.get(skill_id, {}).get("level", 0))


func piloting_travel_fuel_bonus() -> float:
	var piloting_level: int = use_skill_level("piloting")
	var unlocked_milestones := 0
	for milestone_level in PILOTING_TRAVEL_FUEL_MILESTONES:
		if piloting_level >= milestone_level:
			unlocked_milestones += 1
	return float(unlocked_milestones) * 0.02


func piloting_boost_fuel_bonus() -> float:
	var piloting_level: int = use_skill_level("piloting")
	var unlocked_milestones := 0
	for milestone_level in PILOTING_BOOST_FUEL_MILESTONES:
		if piloting_level >= milestone_level:
			unlocked_milestones += 1
	return float(unlocked_milestones) * 0.02


func piloting_license_name() -> String:
	var piloting_level: int = use_skill_level("piloting")
	var current_license := "Basic Flight License I"
	for entry in PILOTING_LICENSE_MILESTONES:
		if piloting_level >= int(entry.get("level", USE_SKILL_MAX_LEVEL)):
			current_license = str(entry.get("name", current_license))
	return current_license


func next_piloting_license_text() -> String:
	var piloting_level: int = use_skill_level("piloting")
	for entry in PILOTING_LICENSE_MILESTONES:
		var required_level: int = int(entry.get("level", USE_SKILL_MAX_LEVEL))
		if piloting_level < required_level:
			return "%s at Piloting %d" % [str(entry.get("name", "Unknown License")), required_level]
	return "All current flight licenses earned"


func mining_extraction_speed_bonus() -> float:
	var mining_level: int = use_skill_level("mining")
	var unlocked_milestones := 0
	for milestone_level in MINING_EXTRACTION_SPEED_MILESTONES:
		if mining_level >= milestone_level:
			unlocked_milestones += 1
	return float(unlocked_milestones) * 0.03


func mining_bonus_yield_chance() -> float:
	var mining_level: int = use_skill_level("mining")
	var unlocked_milestones := 0
	for milestone_level in MINING_BONUS_YIELD_MILESTONES:
		if mining_level >= milestone_level:
			unlocked_milestones += 1
	return float(unlocked_milestones) * 0.015


func current_mining_unlock_label() -> String:
	var mining_level: int = use_skill_level("mining")
	var current_unlock := "Iron"
	for entry in MINING_RESOURCE_UNLOCKS:
		if mining_level >= int(entry.get("level", 0)):
			current_unlock = str(entry.get("label", current_unlock))
	return current_unlock


func next_mining_unlock_text() -> String:
	var mining_level: int = use_skill_level("mining")
	for entry in MINING_RESOURCE_UNLOCKS:
		var required_level: int = int(entry.get("level", USE_SKILL_MAX_LEVEL))
		if mining_level < required_level:
			return "%s at Mining %d" % [str(entry.get("label", "Unknown Resource")), required_level]
	return "All planned mining resource tiers earned"


func next_mining_milestone_text() -> String:
	var mining_level: int = use_skill_level("mining")
	var next_level := USE_SKILL_MAX_LEVEL + 1
	var next_label := "All current mining milestones earned"
	for entry in MINING_RESOURCE_UNLOCKS:
		var required_level: int = int(entry.get("level", USE_SKILL_MAX_LEVEL + 1))
		if mining_level < required_level and required_level < next_level:
			next_level = required_level
			next_label = "%s unlock" % str(entry.get("label", "Resource"))
	for milestone_level in MINING_EXTRACTION_SPEED_MILESTONES:
		if mining_level < milestone_level and milestone_level < next_level:
			next_level = milestone_level
			next_label = "+3%% extraction speed"
	for milestone_level in MINING_BONUS_YIELD_MILESTONES:
		if mining_level < milestone_level and milestone_level < next_level:
			next_level = milestone_level
			next_label = "+1.5%% bonus yield chance"
	if next_level <= USE_SKILL_MAX_LEVEL:
		return "%s at Mining %d" % [next_label, next_level]
	return next_label


func surveying_df_bonus() -> float:
	var surveying_level: int = use_skill_level("surveying")
	var unlocked_milestones := 0
	for milestone_level in SURVEYING_DF_MILESTONES:
		if surveying_level >= milestone_level:
			unlocked_milestones += 1
	return float(unlocked_milestones) * 0.04


func surveying_scan_cooldown_bonus() -> float:
	var surveying_level: int = use_skill_level("surveying")
	var unlocked_milestones := 0
	for milestone_level in SURVEYING_COOLDOWN_MILESTONES:
		if surveying_level >= milestone_level:
			unlocked_milestones += 1
	return float(unlocked_milestones) * 0.04


func surveying_resource_sweep_reliability() -> float:
	var surveying_level: int = use_skill_level("surveying")
	var unlocked_milestones := 0
	for milestone_level in SURVEYING_RELIABILITY_MILESTONES:
		if surveying_level >= milestone_level:
			unlocked_milestones += 1
	return float(unlocked_milestones) * 0.04


func next_surveying_milestone_text() -> String:
	var surveying_level: int = use_skill_level("surveying")
	var next_level := USE_SKILL_MAX_LEVEL + 1
	var next_label := "All current surveying milestones earned"
	for milestone_level in SURVEYING_DF_MILESTONES:
		if surveying_level < milestone_level and milestone_level < next_level:
			next_level = milestone_level
			next_label = "+4%% DF yield"
	for milestone_level in SURVEYING_COOLDOWN_MILESTONES:
		if surveying_level < milestone_level and milestone_level < next_level:
			next_level = milestone_level
			next_label = "-4%% scan cooldown"
	for milestone_level in SURVEYING_RELIABILITY_MILESTONES:
		if surveying_level < milestone_level and milestone_level < next_level:
			next_level = milestone_level
			next_label = "+4%% sweep reliability"
	if next_level <= USE_SKILL_MAX_LEVEL:
		return "%s at Surveying %d" % [next_label, next_level]
	return next_label


func surveying_reliability_target(resource_filter: StringName = StringName()):
	var best_node = null
	var best_distance := INF
	for child in resource_layer.get_children():
		if resource_filter != StringName() and StringName(child.resource_type) != resource_filter:
			continue
		if bool(child.is_derelict_ship):
			continue
		var distance: float = player.global_position.distance_to(child.global_position)
		if distance < best_distance:
			best_distance = distance
			best_node = child
	return best_node


func combat_laser_damage_bonus() -> float:
	var combat_level: int = use_skill_level("combat")
	var unlocked_milestones := 0
	for milestone_level in COMBAT_LASER_DAMAGE_MILESTONES:
		if combat_level >= milestone_level:
			unlocked_milestones += 1
	return float(unlocked_milestones) * 0.02


func combat_lock_speed_bonus() -> float:
	var combat_level: int = use_skill_level("combat")
	var unlocked_milestones := 0
	for milestone_level in COMBAT_LOCK_SPEED_MILESTONES:
		if combat_level >= milestone_level:
			unlocked_milestones += 1
	return float(unlocked_milestones) * 0.04


func combat_special_cooldown_bonus() -> float:
	var combat_level: int = use_skill_level("combat")
	var unlocked_milestones := 0
	for milestone_level in COMBAT_SPECIAL_COOLDOWN_MILESTONES:
		if combat_level >= milestone_level:
			unlocked_milestones += 1
	return float(unlocked_milestones) * 0.03


func next_combat_milestone_text() -> String:
	var combat_level: int = use_skill_level("combat")
	var next_level := USE_SKILL_MAX_LEVEL + 1
	var next_label := "All current combat milestones earned"
	for milestone_level in COMBAT_LASER_DAMAGE_MILESTONES:
		if combat_level < milestone_level and milestone_level < next_level:
			next_level = milestone_level
			next_label = "+2%% laser damage"
	for milestone_level in COMBAT_LOCK_SPEED_MILESTONES:
		if combat_level < milestone_level and milestone_level < next_level:
			next_level = milestone_level
			next_label = "+4%% target lock speed"
	for milestone_level in COMBAT_SPECIAL_COOLDOWN_MILESTONES:
		if combat_level < milestone_level and milestone_level < next_level:
			next_level = milestone_level
			next_label = "-3%% special cooldown"
	if next_level <= USE_SKILL_MAX_LEVEL:
		return "%s at Combat %d" % [next_label, next_level]
	return next_label


func salvage_speed_bonus() -> float:
	var salvage_level: int = use_skill_level("salvage")
	var unlocked_milestones := 0
	for milestone_level in SALVAGE_SPEED_MILESTONES:
		if salvage_level >= milestone_level:
			unlocked_milestones += 1
	return float(unlocked_milestones) * 0.03


func salvage_yield_skill_bonus() -> float:
	var salvage_level: int = use_skill_level("salvage")
	var unlocked_milestones := 0
	for milestone_level in SALVAGE_YIELD_MILESTONES:
		if salvage_level >= milestone_level:
			unlocked_milestones += 1
	return float(unlocked_milestones) * 0.02


func salvage_cache_quality_bonus() -> float:
	var salvage_level: int = use_skill_level("salvage")
	var unlocked_milestones := 0
	for milestone_level in SALVAGE_CACHE_MILESTONES:
		if salvage_level >= milestone_level:
			unlocked_milestones += 1
	return float(unlocked_milestones) * 0.03


func industry_refining_speed_bonus() -> float:
	var industry_level: int = use_skill_level("industry")
	var unlocked_milestones := 0
	for milestone_level in INDUSTRY_REFINING_SPEED_MILESTONES:
		if industry_level >= milestone_level:
			unlocked_milestones += 1
	return float(unlocked_milestones) * 0.03


func industry_refining_quality_bonus() -> float:
	var industry_level: int = use_skill_level("industry")
	var unlocked_milestones := 0
	for milestone_level in INDUSTRY_REFINING_QUALITY_MILESTONES:
		if industry_level >= milestone_level:
			unlocked_milestones += 1
	return float(unlocked_milestones) * 0.02


func industry_crafting_cost_bonus() -> float:
	var industry_level: int = use_skill_level("industry")
	var unlocked_milestones := 0
	for milestone_level in INDUSTRY_CRAFTING_COST_MILESTONES:
		if industry_level >= milestone_level:
			unlocked_milestones += 1
	return float(unlocked_milestones) * 0.03


func industry_refining_fee_bonus() -> float:
	var industry_level: int = use_skill_level("industry")
	var unlocked_milestones := 0
	for milestone_level in INDUSTRY_REFINING_FEE_MILESTONES:
		if industry_level >= milestone_level:
			unlocked_milestones += 1
	return float(unlocked_milestones) * 0.02


func next_industry_milestone_text() -> String:
	var industry_level: int = use_skill_level("industry")
	var next_level := USE_SKILL_MAX_LEVEL + 1
	var next_label := "All current industry milestones earned"
	for milestone_level in INDUSTRY_REFINING_SPEED_MILESTONES:
		if industry_level < milestone_level and milestone_level < next_level:
			next_level = milestone_level
			next_label = "+3%% refining speed"
	for milestone_level in INDUSTRY_REFINING_QUALITY_MILESTONES:
		if industry_level < milestone_level and milestone_level < next_level:
			next_level = milestone_level
			next_label = "+2%% refining quality"
	for milestone_level in INDUSTRY_CRAFTING_COST_MILESTONES:
		if industry_level < milestone_level and milestone_level < next_level:
			next_level = milestone_level
			next_label = "-3%% crafting cost"
	for milestone_level in INDUSTRY_REFINING_FEE_MILESTONES:
		if industry_level < milestone_level and milestone_level < next_level:
			next_level = milestone_level
			next_label = "-2%% refinery fee"
	if next_level <= USE_SKILL_MAX_LEVEL:
		return "%s at Industry %d" % [next_label, next_level]
	return next_label


func trade_sell_value_bonus() -> float:
	var trade_level: int = use_skill_level("trade")
	var unlocked_milestones := 0
	for milestone_level in TRADE_SELL_VALUE_MILESTONES:
		if trade_level >= milestone_level:
			unlocked_milestones += 1
	return float(unlocked_milestones) * 0.02


func trade_mission_payout_bonus() -> float:
	var trade_level: int = use_skill_level("trade")
	var unlocked_milestones := 0
	for milestone_level in TRADE_MISSION_PAYOUT_MILESTONES:
		if trade_level >= milestone_level:
			unlocked_milestones += 1
	return float(unlocked_milestones) * 0.02


func trade_bounty_payout_bonus() -> float:
	var trade_level: int = use_skill_level("trade")
	var unlocked_milestones := 0
	for milestone_level in TRADE_BOUNTY_PAYOUT_MILESTONES:
		if trade_level >= milestone_level:
			unlocked_milestones += 1
	return float(unlocked_milestones) * 0.02


func next_trade_milestone_text() -> String:
	var trade_level: int = use_skill_level("trade")
	var next_level := USE_SKILL_MAX_LEVEL + 1
	var next_label := "All current trade milestones earned"
	for milestone_level in TRADE_SELL_VALUE_MILESTONES:
		if trade_level < milestone_level and milestone_level < next_level:
			next_level = milestone_level
			next_label = "+2%% sell value"
	for milestone_level in TRADE_MISSION_PAYOUT_MILESTONES:
		if trade_level < milestone_level and milestone_level < next_level:
			next_level = milestone_level
			next_label = "+2%% mission payout"
	for milestone_level in TRADE_BOUNTY_PAYOUT_MILESTONES:
		if trade_level < milestone_level and milestone_level < next_level:
			next_level = milestone_level
			next_label = "+2%% bounty payout"
	if next_level <= USE_SKILL_MAX_LEVEL:
		return "%s at Trade %d" % [next_label, next_level]
	return next_label


func next_salvage_milestone_text() -> String:
	var salvage_level: int = use_skill_level("salvage")
	var next_level := USE_SKILL_MAX_LEVEL + 1
	var next_label := "All current salvage milestones earned"
	for milestone_level in SALVAGE_SPEED_MILESTONES:
		if salvage_level < milestone_level and milestone_level < next_level:
			next_level = milestone_level
			next_label = "+3%% salvage speed"
	for milestone_level in SALVAGE_YIELD_MILESTONES:
		if salvage_level < milestone_level and milestone_level < next_level:
			next_level = milestone_level
			next_label = "+2%% salvage yield"
	for milestone_level in SALVAGE_CACHE_MILESTONES:
		if salvage_level < milestone_level and milestone_level < next_level:
			next_level = milestone_level
			next_label = "+3%% cache quality"
	if next_level <= USE_SKILL_MAX_LEVEL:
		return "%s at Salvage %d" % [next_label, next_level]
	return next_label


func salvage_boarding_access_label() -> String:
	var salvage_level: int = use_skill_level("salvage")
	if salvage_level >= SALVAGE_HOSTILE_BOARDING_LEVEL:
		return "Disabled hostiles"
	if salvage_level >= SALVAGE_STANDARD_DERELICT_BOARDING_LEVEL:
		return "Standard derelicts"
	if salvage_level >= SALVAGE_SMALL_DERELICT_BOARDING_LEVEL:
		return "Small derelicts"
	return "No boarding access"


func next_salvage_boarding_unlock_text() -> String:
	var salvage_level: int = use_skill_level("salvage")
	if salvage_level < SALVAGE_SMALL_DERELICT_BOARDING_LEVEL:
		return "Small derelict boarding at Salvage %d" % SALVAGE_SMALL_DERELICT_BOARDING_LEVEL
	if salvage_level < SALVAGE_STANDARD_DERELICT_BOARDING_LEVEL:
		return "Standard derelict boarding at Salvage %d" % SALVAGE_STANDARD_DERELICT_BOARDING_LEVEL
	if salvage_level < SALVAGE_HOSTILE_BOARDING_LEVEL:
		return "Disabled hostile boarding at Salvage %d" % SALVAGE_HOSTILE_BOARDING_LEVEL
	return "All current boarding unlocks earned"


func derelict_boarding_tier(resource_node) -> int:
	if resource_node == null or not bool(resource_node.is_derelict_ship):
		return 0
	return 1 if str(resource_node.derelict_profile_id) == "small_hulk" else 2


func can_board_derelict(resource_node) -> bool:
	var boarding_tier: int = derelict_boarding_tier(resource_node)
	if boarding_tier <= 0:
		return false
	var salvage_level: int = use_skill_level("salvage")
	if boarding_tier == 1:
		return salvage_level >= SALVAGE_SMALL_DERELICT_BOARDING_LEVEL
	return salvage_level >= SALVAGE_STANDARD_DERELICT_BOARDING_LEVEL


func can_board_disabled_hostiles() -> bool:
	return use_skill_level("salvage") >= SALVAGE_HOSTILE_BOARDING_LEVEL


func use_skill_bonus_summary(skill_id: String) -> String:
	match skill_id:
		"piloting":
			return "Travel fuel -%d%%  |  Boost fuel -%d%%  |  License %s" % [
				int(round(piloting_travel_fuel_bonus() * 100.0)),
				int(round(piloting_boost_fuel_bonus() * 100.0)),
				piloting_license_name(),
			]
		"mining":
			return "Ore tier: %s  |  Extraction +%d%%  |  Bonus yield +%.1f%%" % [
				current_mining_unlock_label(),
				int(round(mining_extraction_speed_bonus() * 100.0)),
				mining_bonus_yield_chance() * 100.0,
			]
		"surveying":
			return "DF yield +%d%%  |  Scan cooldown -%d%%  |  Sweep reliability +%d%%" % [
				int(round(surveying_df_bonus() * 100.0)),
				int(round(surveying_scan_cooldown_bonus() * 100.0)),
				int(round(surveying_resource_sweep_reliability() * 100.0)),
			]
		"combat":
			return "Laser damage +%d%%  |  Lock speed +%d%%  |  Special cooldown -%d%%" % [
				int(round(combat_laser_damage_bonus() * 100.0)),
				int(round(combat_lock_speed_bonus() * 100.0)),
				int(round(combat_special_cooldown_bonus() * 100.0)),
			]
		"salvage":
			return "Salvage speed +%d%%  |  Yield +%d%%  |  Cache quality +%d%%  |  Boarding %s" % [
				int(round(salvage_speed_bonus() * 100.0)),
				int(round(salvage_yield_skill_bonus() * 100.0)),
				int(round(salvage_cache_quality_bonus() * 100.0)),
				salvage_boarding_access_label(),
			]
		"industry":
			return "Refining speed +%d%%  |  Quality +%d%%  |  Craft cost -%d%%  |  Refinery fee -%d%%" % [
				int(round(industry_refining_speed_bonus() * 100.0)),
				int(round(industry_refining_quality_bonus() * 100.0)),
				int(round(industry_crafting_cost_bonus() * 100.0)),
				int(round(industry_refining_fee_bonus() * 100.0)),
			]
		"trade":
			return "Sell value +%d%%  |  Mission payout +%d%%  |  Bounty payout +%d%%" % [
				int(round(trade_sell_value_bonus() * 100.0)),
				int(round(trade_mission_payout_bonus() * 100.0)),
				int(round(trade_bounty_payout_bonus() * 100.0)),
			]
		_:
			return "Bonuses pending future skill pass."


func use_skill_next_unlock_text(skill_id: String) -> String:
	match skill_id:
		"piloting":
			return "Next license: %s" % next_piloting_license_text()
		"mining":
			return "Next milestone: %s" % next_mining_milestone_text()
		"surveying":
			return "Next milestone: %s" % next_surveying_milestone_text()
		"combat":
			return "Next milestone: %s" % next_combat_milestone_text()
		"salvage":
			return "Next milestone: %s  |  %s" % [next_salvage_milestone_text(), next_salvage_boarding_unlock_text()]
		"industry":
			return "Next milestone: %s" % next_industry_milestone_text()
		"trade":
			return "Next milestone: %s" % next_trade_milestone_text()
		_:
			return "More milestone rewards coming soon."


func mining_level_required_for_stage(stage: int) -> int:
	if stage <= 0:
		return 0
	if stage >= MINING_STAGE_LEVEL_REQUIREMENTS.size():
		return MINING_STAGE_LEVEL_REQUIREMENTS[MINING_STAGE_LEVEL_REQUIREMENTS.size() - 1]
	return MINING_STAGE_LEVEL_REQUIREMENTS[stage]


func use_skill_progress_ratio(skill_id: String) -> float:
	var skill_data: Dictionary = use_skill_progress.get(skill_id, {})
	var skill_level: int = int(skill_data.get("level", 0))
	var skill_xp: float = float(skill_data.get("xp", 0.0))
	return clampf(skill_xp / max(use_skill_xp_to_next_level(skill_level), 0.01), 0.0, 1.0)


func total_use_skill_levels() -> int:
	var total: int = 0
	for skill_id in USE_SKILL_ORDER:
		total += use_skill_level(skill_id)
	return total


func award_use_skill_xp(skill_id: String, amount: float, announce: bool = false) -> void:
	if amount <= 0.0 or not use_skill_progress.has(skill_id):
		return
	var skill_data: Dictionary = use_skill_progress[skill_id]
	if int(skill_data.get("level", 0)) >= USE_SKILL_MAX_LEVEL:
		skill_data["level"] = USE_SKILL_MAX_LEVEL
		skill_data["xp"] = 0.0
		use_skill_progress[skill_id] = skill_data
		return
	skill_data["xp"] = float(skill_data.get("xp", 0.0)) + amount
	skill_data["total_xp"] = float(skill_data.get("total_xp", 0.0)) + amount
	var leveled_up := false
	while int(skill_data.get("level", 0)) < USE_SKILL_MAX_LEVEL and float(skill_data.get("xp", 0.0)) >= use_skill_xp_to_next_level(int(skill_data.get("level", 0))):
		var current_level: int = int(skill_data.get("level", 0))
		skill_data["xp"] = float(skill_data.get("xp", 0.0)) - use_skill_xp_to_next_level(current_level)
		skill_data["level"] = current_level + 1
		leveled_up = true
	if int(skill_data.get("level", 0)) >= USE_SKILL_MAX_LEVEL:
		skill_data["level"] = USE_SKILL_MAX_LEVEL
		skill_data["xp"] = 0.0
	use_skill_progress[skill_id] = skill_data
	if leveled_up and skill_id == "mining":
		refresh_mission_offers()
	if leveled_up and announce:
		var skill_name: String = str(USE_SKILL_DEFINITIONS.get(skill_id, {}).get("name", skill_id.capitalize()))
		push_telemetry_event("%s increased to %d." % [skill_name, int(skill_data.get("level", 0))], "system")


func refresh_field_skills_panel() -> void:
	field_skills_summary.text = ""
	for skill_id in USE_SKILL_ORDER:
		if not field_skill_rows.has(skill_id):
			continue
		var row: Dictionary = field_skill_rows[skill_id]
		var skill_info: Dictionary = USE_SKILL_DEFINITIONS.get(skill_id, {})
		var skill_data: Dictionary = use_skill_progress.get(skill_id, {})
		var skill_level: int = int(skill_data.get("level", 0))
		var skill_xp: float = float(skill_data.get("xp", 0.0))
		var xp_needed: float = use_skill_xp_to_next_level(skill_level)
		var panel: PanelContainer = row["panel"]
		var name_label: Label = row["name"]
		var level_label: Label = row["level"]
		var progress_bar: ProgressBar = row["bar"]
		var detail_label: Label = row["detail"]
		panel.add_theme_stylebox_override("panel", make_panel_style(Color(0.05, 0.08, 0.12, 0.94), Color(0.34, 0.82, 1.0, 0.16), 14, 1))
		name_label.text = str(skill_info.get("name", skill_id.capitalize()))
		level_label.text = "L%d" % skill_level
		progress_bar.value = clampf((skill_xp / max(xp_needed, 0.01)) * 100.0, 0.0, 100.0)
		var progress_text := "%.0f / %.0f progress" % [skill_xp, xp_needed]
		if skill_level >= USE_SKILL_MAX_LEVEL:
			progress_text = "MAX LEVEL"
			progress_bar.value = 100.0
		detail_label.text = "%s\n%s\n%s\n%s" % [
			str(skill_info.get("description", "")),
			use_skill_bonus_summary(skill_id),
			use_skill_next_unlock_text(skill_id),
			progress_text,
		]
		name_label.add_theme_font_size_override("font_size", 16)
		name_label.add_theme_color_override("font_color", Color(0.95, 0.97, 1.0))
		level_label.add_theme_font_size_override("font_size", 14)
		level_label.add_theme_color_override("font_color", Color(1.0, 0.82, 0.42))
		detail_label.add_theme_font_size_override("font_size", 12)
		detail_label.add_theme_color_override("font_color", Color(0.74, 0.84, 0.94))
		progress_bar.add_theme_stylebox_override("fill", make_panel_style(Color(0.28, 0.72, 0.96, 0.95), Color(0.28, 0.72, 0.96, 0.95), 6, 0))
		progress_bar.add_theme_stylebox_override("background", make_panel_style(Color(0.08, 0.11, 0.16, 0.95), Color(0.2, 0.34, 0.46, 0.5), 6, 0))


func build_inventory_slots() -> void:
	for child in field_cargo_grid.get_children():
		child.queue_free()

	field_inventory_slots.clear()

	for slot_index in range(INVENTORY_SLOT_COUNT):
		var slot := Button.new()
		slot.custom_minimum_size = Vector2(102, 102)
		slot.focus_mode = Control.FOCUS_NONE
		slot.icon_alignment = HORIZONTAL_ALIGNMENT_CENTER
		slot.expand_icon = true
		slot.alignment = HORIZONTAL_ALIGNMENT_CENTER
		slot.vertical_icon_alignment = VERTICAL_ALIGNMENT_TOP
		slot.text = "\n\nEmpty"
		slot.mouse_entered.connect(func() -> void: show_tooltip_for_slot(slot_index))
		slot.mouse_exited.connect(hide_tooltip)
		attach_button_audio(slot, false)
		field_cargo_grid.add_child(slot)
		style_inventory_slot(slot)
		field_inventory_slots.append(slot)


func build_ship_storage_slots() -> void:
	for child in ship_storage_grid.get_children():
		child.queue_free()

	ship_storage_slots.clear()

	for slot_index in range(INVENTORY_SLOT_COUNT):
		var slot := Button.new()
		configure_storage_slot_button(slot, Vector2(86, 86))
		slot.text = "\nEmpty"
		slot.gui_input.connect(func(event: InputEvent) -> void: handle_ship_storage_input(slot_index, event))
		slot.mouse_entered.connect(func() -> void: show_ship_storage_tooltip_for_slot(slot_index))
		slot.mouse_exited.connect(hide_tooltip)
		attach_button_audio(slot, false)
		ship_storage_grid.add_child(slot)
		style_inventory_slot(slot)
		ship_storage_slots.append(slot)


func build_storage_slots() -> void:
	for child in storage_grid.get_children():
		child.queue_free()

	storage_slots.clear()

	for slot_index in range(station_storage_capacity):
		var slot := Button.new()
		configure_storage_slot_button(slot, Vector2(82, 82))
		slot.text = "\nEmpty"
		slot.gui_input.connect(func(event: InputEvent) -> void: handle_station_storage_input(slot_index, event))
		slot.mouse_entered.connect(func() -> void: show_storage_tooltip_for_slot(slot_index))
		slot.mouse_exited.connect(hide_tooltip)
		attach_button_audio(slot, false)
		storage_grid.add_child(slot)
		style_inventory_slot(slot)
		storage_slots.append(slot)


func configure_storage_slot_button(slot: Button, size: Vector2) -> void:
	slot.custom_minimum_size = size
	slot.focus_mode = Control.FOCUS_NONE
	slot.icon_alignment = HORIZONTAL_ALIGNMENT_CENTER
	slot.expand_icon = true
	slot.alignment = HORIZONTAL_ALIGNMENT_CENTER
	slot.vertical_icon_alignment = VERTICAL_ALIGNMENT_TOP
	slot.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND


# --- HUD / dock styling ---
func apply_ui_polish() -> void:
	var ship_panel := $HUD/MarginContainer/RootLayout/TopBar/ShipPanel
	var stats_panel := $HUD/MarginContainer/RootLayout/TopBar/StatsPanel
	var level_caption: Label = $HUD/MarginContainer/RootLayout/TopBar/StatsPanel/StatsMargin/StatsRow/LevelBlock/LevelCaption
	var credits_caption: Label = $HUD/MarginContainer/RootLayout/TopBar/StatsPanel/StatsMargin/StatsRow/CreditsBlock/CreditsCaption
	var cargo_caption: Label = $HUD/MarginContainer/RootLayout/TopBar/StatsPanel/StatsMargin/StatsRow/CargoBlock/CargoCaption
	var fuel_caption: Label = $HUD/MarginContainer/RootLayout/TopBar/StatsPanel/StatsMargin/StatsRow/FuelBlock/FuelCaption
	var hull_caption: Label = $HUD/MarginContainer/RootLayout/TopBar/StatsPanel/StatsMargin/StatsRow/HullBlock/HullCaption
	var dock_shell: PanelContainer = $HUD/DockScreen/Center/Shell
	var combat_panel_local: PanelContainer = $HUD/CombatPanel
	var field_console_panel: PanelContainer = $HUD/FieldConsolePopup
	var dock_title: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/Header/HeaderLeft/Title
	var dock_subtitle_label: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/Header/HeaderLeft/Subtitle
	var dock_status_caption: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/TopRow/DockStatusPanel/DockStatusMargin/DockStatusVBox/DockStatusCaption
	var ship_summary_caption: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/TopRow/ShipSummaryPanel/ShipSummaryMargin/ShipSummaryVBox/ShipSummaryCaption
	var pilot_caption: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/TopRow/PilotPanel/PilotMargin/PilotVBox/PilotCaption
	var credits_panel_caption: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/Header/CreditsPanel/CreditsMargin/CreditsVBox/CreditsCaption
	var main_menu_panel_local: PanelContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/MainMenuPanel
	var main_menu_caption: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/MainMenuPanel/MainMenuMargin/MainMenuCenter/MainMenuVBox/MainMenuCaption
	var market_caption: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/MarketPanel/MarketMargin/MarketVBox/MarketCaption
	var cargo_market_caption: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/MarketPanel/MarketMargin/MarketVBox/MarketColumns/CargoMarketPanel/CargoMarketMargin/CargoMarketVBox/CargoMarketCaption
	var market_status_caption: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/MarketPanel/MarketMargin/MarketVBox/MarketColumns/MarketStatusPanel/MarketStatusMargin/MarketStatusVBox/MarketStatusCaption
	var storage_caption: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/StoragePanel/StorageMargin/StorageVBox/StorageCaption
	var ship_storage_caption: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/StoragePanel/StorageMargin/StorageVBox/StorageColumns/ShipStoragePanel/ShipStorageMargin/ShipStorageVBox/ShipStorageCaption
	var refinery_caption: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/RefineryPanel/RefineryMargin/RefineryVBox/RefineryCaption
	var mission_board_caption: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/MissionBoardPanel/MissionBoardMargin/MissionBoardVBox/MissionBoardCaption
	var shipyard_label: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ShipyardPanel/ShipyardMargin/ShipyardVBox/ShipyardCaption
	var shipyard_info_label: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ShipyardPanel/ShipyardMargin/ShipyardVBox/ShipyardInfo
	var skills_label: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/SkillsPanel/SkillsMargin/SkillsVBox/SkillsCaption
	var factions_caption: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/FactionsPanel/FactionsMargin/FactionsVBox/FactionsCaption
	var pilot_detail_caption: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/FactionsPanel/FactionsMargin/FactionsVBox/ProfileColumns/PilotDetailPanel/PilotDetailMargin/PilotDetailVBox/PilotDetailCaption
	var faction_detail_caption: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/FactionsPanel/FactionsMargin/FactionsVBox/ProfileColumns/FactionDetailPanel/FactionDetailMargin/FactionDetailVBox/FactionDetailCaption
	var mission_popup_title: Label = $HUD/MissionPopup/MissionPopupMargin/MissionPopupVBox/MissionPopupHeader/MissionPopupTitle
	var inventory_popup_title: Label = $HUD/InventoryPopup/InventoryPopupMargin/InventoryPopupVBox/InventoryPopupHeader/InventoryPopupTitle
	var market_panel_local: PanelContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/MarketPanel
	var cargo_market_panel: PanelContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/MarketPanel/MarketMargin/MarketVBox/MarketColumns/CargoMarketPanel
	var market_status_panel: PanelContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/MarketPanel/MarketMargin/MarketVBox/MarketColumns/MarketStatusPanel
	var storage_panel_local: PanelContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/StoragePanel
	var ship_storage_panel_local: PanelContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/StoragePanel/StorageMargin/StorageVBox/StorageColumns/ShipStoragePanel
	var station_storage_panel_local: PanelContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/StoragePanel/StorageMargin/StorageVBox/StorageColumns/StationStoragePanel
	var refinery_panel_local: PanelContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/RefineryPanel
	var mission_board_panel_local: PanelContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/MissionBoardPanel
	var shipyard_panel_local: PanelContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ShipyardPanel
	var skills_panel_local: PanelContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/SkillsPanel
	var factions_panel_local: PanelContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/FactionsPanel
	var dock_status_panel: PanelContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/TopRow/DockStatusPanel
	var ship_summary_panel: PanelContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/TopRow/ShipSummaryPanel
	var pilot_panel: PanelContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/TopRow/PilotPanel
	var credits_panel: PanelContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/Header/CreditsPanel
	var pilot_detail_panel: PanelContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/FactionsPanel/FactionsMargin/FactionsVBox/ProfileColumns/PilotDetailPanel
	var faction_detail_panel: PanelContainer = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/FactionsPanel/FactionsMargin/FactionsVBox/ProfileColumns/FactionDetailPanel
	var field_mission_panel_local: PanelContainer = $HUD/FieldConsolePopup/FieldConsoleMargin/FieldConsoleVBox/FieldConsoleBody/FieldMissionPanel
	var field_cargo_panel_local: PanelContainer = $HUD/FieldConsolePopup/FieldConsoleMargin/FieldConsoleVBox/FieldConsoleBody/FieldCargoPanel
	var field_map_panel_local: PanelContainer = $HUD/FieldConsolePopup/FieldConsoleMargin/FieldConsoleVBox/FieldConsoleBody/FieldMapPanel
	var field_pilot_panel_local: PanelContainer = $HUD/FieldConsolePopup/FieldConsoleMargin/FieldConsoleVBox/FieldConsoleBody/FieldPilotPanel
	var field_skills_panel_local: PanelContainer = $HUD/FieldConsolePopup/FieldConsoleMargin/FieldConsoleVBox/FieldConsoleBody/FieldSkillsPanel

	ship_panel.add_theme_stylebox_override("panel", make_panel_style(Color(0.05, 0.1, 0.16, 0.9), Color(0.25, 0.8, 1.0, 0.22), 18, 1))
	stats_panel.add_theme_stylebox_override("panel", make_panel_style(Color(0.07, 0.09, 0.15, 0.9), Color(0.25, 0.8, 1.0, 0.2), 16, 1))
	monitor_panel.add_theme_stylebox_override("panel", make_panel_style(Color(0.04, 0.08, 0.13, 0.92), Color(0.25, 0.8, 1.0, 0.2), 18, 1))
	combat_panel_local.add_theme_stylebox_override("panel", make_panel_style(Color(0.09, 0.06, 0.08, 0.94), Color(0.94, 0.3, 0.3, 0.26), 18, 1))
	dock_shell.add_theme_stylebox_override("panel", make_panel_style(Color(0.04, 0.06, 0.1, 0.98), Color(0.25, 0.8, 1.0, 0.28), 24, 2))
	dock_status_panel.add_theme_stylebox_override("panel", make_panel_style(Color(0.05, 0.1, 0.14, 0.92), Color(0.27, 0.82, 1.0, 0.18), 16, 1))
	ship_summary_panel.add_theme_stylebox_override("panel", make_panel_style(Color(0.06, 0.09, 0.15, 0.92), Color(0.25, 0.8, 1.0, 0.16), 16, 1))
	pilot_panel.add_theme_stylebox_override("panel", make_panel_style(Color(0.06, 0.09, 0.14, 0.92), Color(0.36, 0.86, 1.0, 0.16), 16, 1))
	credits_panel.add_theme_stylebox_override("panel", make_panel_style(Color(0.1, 0.1, 0.14, 0.94), Color(1.0, 0.77, 0.35, 0.24), 16, 1))
	onboarding_panel.add_theme_stylebox_override("panel", make_panel_style(Color(0.04, 0.07, 0.11, 0.97), Color(0.34, 0.67, 0.96, 0.2), 18, 1))
	main_menu_panel_local.add_theme_stylebox_override("panel", make_panel_style(Color(0.05, 0.08, 0.12, 0.94), Color(0.25, 0.8, 1.0, 0.16), 20, 1))
	main_menu_summary_panel.add_theme_stylebox_override("panel", make_panel_style(Color(0.08, 0.11, 0.16, 0.94), Color(0.25, 0.8, 1.0, 0.14), 16, 1))
	market_panel_local.add_theme_stylebox_override("panel", make_panel_style(Color(0.05, 0.08, 0.12, 0.94), Color(0.36, 0.86, 1.0, 0.14), 18, 1))
	cargo_market_panel.add_theme_stylebox_override("panel", make_panel_style(Color(0.06, 0.09, 0.14, 0.92), Color(0.36, 0.86, 1.0, 0.14), 16, 1))
	market_status_panel.add_theme_stylebox_override("panel", make_panel_style(Color(0.08, 0.1, 0.14, 0.92), Color(1.0, 0.77, 0.35, 0.16), 16, 1))
	storage_panel_local.add_theme_stylebox_override("panel", make_panel_style(Color(0.05, 0.08, 0.12, 0.94), Color(0.64, 0.83, 1.0, 0.16), 18, 1))
	ship_storage_panel_local.add_theme_stylebox_override("panel", make_panel_style(Color(0.06, 0.09, 0.14, 0.92), Color(0.25, 0.8, 1.0, 0.14), 16, 1))
	station_storage_panel_local.add_theme_stylebox_override("panel", make_panel_style(Color(0.06, 0.09, 0.14, 0.92), Color(0.64, 0.83, 1.0, 0.14), 16, 1))
	refinery_panel_local.add_theme_stylebox_override("panel", make_panel_style(Color(0.08, 0.08, 0.12, 0.94), Color(1.0, 0.74, 0.34, 0.18), 18, 1))
	mission_board_panel_local.add_theme_stylebox_override("panel", make_panel_style(Color(0.08, 0.08, 0.12, 0.94), Color(0.95, 0.72, 0.27, 0.18), 18, 1))
	shipyard_panel_local.add_theme_stylebox_override("panel", make_panel_style(Color(0.06, 0.08, 0.13, 0.94), Color(0.48, 0.74, 1.0, 0.14), 18, 1))
	$HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ShipyardPanel/ShipyardMargin/ShipyardVBox/ShipyardColumns/ShipUpgradePanel.add_theme_stylebox_override("panel", make_panel_style(Color(0.06, 0.09, 0.14, 0.92), Color(0.36, 0.78, 1.0, 0.16), 16, 1))
	$HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ShipyardPanel/ShipyardMargin/ShipyardVBox/ShipyardColumns/CombatUpgradePanel.add_theme_stylebox_override("panel", make_panel_style(Color(0.08, 0.09, 0.14, 0.92), Color(0.98, 0.76, 0.36, 0.16), 16, 1))
	skills_panel_local.add_theme_stylebox_override("panel", make_panel_style(Color(0.06, 0.08, 0.13, 0.94), Color(0.73, 0.59, 1.0, 0.16), 18, 1))
	research_panel.add_theme_stylebox_override("panel", make_panel_style(Color(0.06, 0.08, 0.13, 0.94), Color(0.38, 0.82, 1.0, 0.18), 18, 1))
	$HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ResearchPanel/ResearchMargin/ResearchVBox/ResearchTabsPanel.add_theme_stylebox_override("panel", make_panel_style(Color(0.05, 0.09, 0.14, 0.94), Color(0.34, 0.78, 1.0, 0.18), 16, 1))
	$HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ResearchPanel/ResearchMargin/ResearchVBox/ResearchHeaderRow/ResearchUploadPanel.add_theme_stylebox_override("panel", make_panel_style(Color(0.05, 0.09, 0.14, 0.96), Color(0.3, 0.76, 0.98, 0.18), 14, 1))
	research_tree_frame.add_theme_stylebox_override("panel", make_panel_style(Color(0.03, 0.05, 0.09, 0.98), Color(0.28, 0.74, 1.0, 0.18), 18, 1))
	$HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ResearchPanel/ResearchMargin/ResearchVBox/ResearchBodyRow/ResearchViewportPanel.add_theme_stylebox_override("panel", make_panel_style(Color(0.05, 0.08, 0.12, 0.94), Color(0.24, 0.72, 0.96, 0.16), 18, 1))
	$HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ResearchPanel/ResearchMargin/ResearchVBox/ResearchBodyRow/ResearchInspectorPanel.add_theme_stylebox_override("panel", make_panel_style(Color(0.05, 0.08, 0.12, 0.96), Color(0.34, 0.82, 1.0, 0.2), 18, 1))
	$HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ResearchPanel/ResearchMargin/ResearchVBox/ResearchFooterPanel.add_theme_stylebox_override("panel", make_panel_style(Color(0.04, 0.07, 0.11, 0.96), Color(0.24, 0.72, 0.96, 0.16), 16, 1))
	crafting_panel.add_theme_stylebox_override("panel", make_panel_style(Color(0.06, 0.08, 0.13, 0.94), Color(0.99, 0.82, 0.45, 0.16), 18, 1))
	factions_panel_local.add_theme_stylebox_override("panel", make_panel_style(Color(0.06, 0.09, 0.13, 0.94), Color(0.32, 0.86, 0.72, 0.16), 18, 1))
	pilot_detail_panel.add_theme_stylebox_override("panel", make_panel_style(Color(0.06, 0.09, 0.14, 0.92), Color(0.36, 0.86, 1.0, 0.14), 16, 1))
	faction_detail_panel.add_theme_stylebox_override("panel", make_panel_style(Color(0.06, 0.09, 0.14, 0.92), Color(0.32, 0.86, 0.72, 0.14), 16, 1))
	$HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ShipyardPanel/ShipyardMargin/ShipyardVBox/ShipyardColumns/ShipyardServicePanel.add_theme_stylebox_override("panel", make_panel_style(Color(0.08, 0.09, 0.14, 0.92), Color(0.96, 0.66, 0.34, 0.16), 16, 1))
	$HUD/PromptPanel.add_theme_stylebox_override("panel", make_panel_style(Color(0.04, 0.06, 0.1, 0.86), Color(0.2, 0.7, 1.0, 0.18), 14, 1))
	field_console_panel.add_theme_stylebox_override("panel", make_panel_style(Color(0.05, 0.08, 0.12, 0.98), Color(0.28, 0.72, 0.96, 0.34), 24, 2))
	field_mission_panel_local.add_theme_stylebox_override("panel", make_panel_style(Color(0.05, 0.08, 0.12, 0.96), Color(0.95, 0.72, 0.27, 0.18), 18, 1))
	field_cargo_panel_local.add_theme_stylebox_override("panel", make_panel_style(Color(0.05, 0.08, 0.12, 0.96), Color(0.28, 0.86, 1.0, 0.18), 18, 1))
	field_map_panel_local.add_theme_stylebox_override("panel", make_panel_style(Color(0.04, 0.07, 0.12, 0.96), Color(0.28, 0.72, 0.96, 0.18), 18, 1))
	field_pilot_panel_local.add_theme_stylebox_override("panel", make_panel_style(Color(0.04, 0.07, 0.11, 0.98), Color(0.36, 0.9, 0.76, 0.28), 20, 2))
	field_skills_panel_local.add_theme_stylebox_override("panel", make_panel_style(Color(0.05, 0.08, 0.12, 0.96), Color(0.5, 0.82, 1.0, 0.18), 18, 1))
	mission_popup.add_theme_stylebox_override("panel", make_panel_style(Color(0.05, 0.08, 0.12, 0.98), Color(0.95, 0.72, 0.27, 0.42), 24, 2))
	inventory_popup.add_theme_stylebox_override("panel", make_panel_style(Color(0.05, 0.08, 0.12, 0.98), Color(0.28, 0.86, 1.0, 0.34), 24, 2))
	guided_mission_popup.add_theme_stylebox_override("panel", make_panel_style(Color(0.06, 0.08, 0.12, 0.98), Color(1.0, 0.82, 0.32, 0.4), 24, 2))
	inventory_tooltip.add_theme_stylebox_override("panel", make_panel_style(Color(0.03, 0.05, 0.08, 0.96), Color(0.25, 0.8, 1.0, 0.22), 12, 1))
	transfer_popup.add_theme_stylebox_override("panel", make_panel_style(Color(0.05, 0.08, 0.12, 0.98), Color(0.25, 0.8, 1.0, 0.24), 18, 1))
	dock_prompt_popup.add_theme_stylebox_override("panel", make_panel_style(Color(0.05, 0.08, 0.12, 0.98), Color(0.25, 0.8, 1.0, 0.26), 18, 1))
	boarding_prompt_popup.add_theme_stylebox_override("panel", make_panel_style(Color(0.08, 0.06, 0.08, 0.98), Color(0.94, 0.34, 0.34, 0.3), 18, 1))
	scan_mode_popup.add_theme_stylebox_override("panel", make_panel_style(Color(0.05, 0.08, 0.12, 0.98), Color(0.25, 0.8, 1.0, 0.24), 18, 1))
	tactical_map_popup.add_theme_stylebox_override("panel", make_panel_style(Color(0.04, 0.07, 0.12, 0.98), Color(0.28, 0.72, 0.96, 0.26), 18, 1))
	pause_popup.add_theme_stylebox_override("panel", make_panel_style(Color(0.05, 0.07, 0.11, 0.98), Color(0.92, 0.74, 0.28, 0.22), 18, 1))
	options_popup.add_theme_stylebox_override("panel", make_panel_style(Color(0.05, 0.07, 0.11, 0.98), Color(0.34, 0.67, 0.96, 0.28), 18, 1))

	style_button_primary(close_mission_button)
	style_button_primary(close_inventory_button)
	style_button_secondary(field_console_close_button)
	style_button_secondary(field_mission_tab_button)
	style_button_secondary(field_cargo_tab_button)
	style_button_secondary(field_map_tab_button)
	style_button_secondary(field_pilot_tab_button)
	style_button_secondary(guided_mission_popup_secondary_button)
	style_button_primary(guided_mission_popup_primary_button, Color(0.84, 0.58, 0.16, 0.95), Color(0.98, 0.72, 0.24, 0.98))
	style_button_secondary(dock_back_button)
	style_button_primary(dock_close_button, Color(0.15, 0.46, 0.78, 0.96), Color(0.23, 0.6, 0.92, 0.96))
	style_button_secondary(arm_button)
	style_button_primary(sell_button, Color(0.2, 0.58, 0.33, 0.95), Color(0.29, 0.8, 0.46, 0.95))
	style_button_primary(refuel_button, Color(0.84, 0.58, 0.16, 0.95), Color(0.95, 0.69, 0.22, 0.95))
	refuel_button.icon = null
	style_button_primary(bounty_turn_in_button, Color(0.62, 0.18, 0.18, 0.96), Color(0.82, 0.24, 0.24, 0.96))
	style_button_primary(refine_button, Color(0.69, 0.44, 0.16, 0.95), Color(0.86, 0.56, 0.21, 0.95))
	style_button_primary(crafting_detail_button, Color(0.68, 0.45, 0.16, 0.95), Color(0.88, 0.6, 0.22, 0.98))
	style_button_secondary(refinery_ship_tab_button)
	style_button_secondary(refinery_station_tab_button)
	style_inventory_slot(refinery_input_card)
	style_inventory_slot(refinery_output_card)
	style_button_secondary(exchange_room_button)
	style_button_secondary(storage_room_button)
	style_button_secondary(refinery_room_button)
	style_button_secondary(crafting_room_button)
	style_button_secondary(shipyard_room_button)
	style_button_secondary(crew_room_button)
	style_button_secondary(research_room_button)
	style_button_primary(research_upload_button, Color(0.14, 0.44, 0.7, 0.96), Color(0.24, 0.6, 0.9, 0.98))
	style_button_primary(research_unlock_button, Color(0.76, 0.54, 0.18, 0.96), Color(0.94, 0.7, 0.24, 0.98))
	style_button_secondary(faction_room_button)
	style_button_secondary(pilot_profile_button)
	style_button_secondary(mission_room_button)
	style_button_secondary(cargo_room_button)
	style_shipyard_upgrade_button(engine_button, ENGINE_UPGRADE_ICON, Color(0.5, 0.82, 1.0))
	style_shipyard_upgrade_button(cargo_button, CARGO_UPGRADE_ICON, Color(0.58, 0.9, 0.98))
	style_shipyard_upgrade_button(mining_button, MINING_UPGRADE_ICON, Color(1.0, 0.78, 0.38))
	style_shipyard_upgrade_button(fuel_button, FUEL_UPGRADE_ICON, Color(0.96, 0.7, 0.34))
	style_shipyard_upgrade_button(shield_button, SHIELD_UPGRADE_ICON, Color(0.52, 0.84, 1.0))
	style_shipyard_upgrade_button(hull_button, HULL_UPGRADE_ICON, Color(0.76, 0.88, 1.0))
	style_shipyard_upgrade_button(laser_button, LASER_UPGRADE_ICON, Color(1.0, 0.74, 0.36))
	style_shipyard_upgrade_button(special_button, MISSILE_UPGRADE_ICON, Color(0.98, 0.64, 0.32))
	style_shipyard_upgrade_button(repair_button, REPAIR_HULL_ICON, Color(0.94, 0.72, 0.72))
	style_shipyard_upgrade_button(restock_button, MISSILE_UPGRADE_ICON, Color(0.98, 0.76, 0.54))
	style_button_secondary(storage_expand_button)
	style_button_secondary(transfer_cancel_button)
	style_button_primary(transfer_confirm_button)
	style_button_secondary(dock_prompt_no_button)
	style_button_primary(dock_prompt_yes_button)
	style_button_secondary(boarding_prompt_board_button)
	style_button_primary(boarding_prompt_destroy_button, Color(0.68, 0.2, 0.2, 0.96), Color(0.88, 0.26, 0.26, 0.96))
	style_button_secondary(general_scan_button)
	style_button_secondary(hostile_scan_button)
	style_button_secondary(derelict_scan_button)
	style_button_secondary(resource_scan_button)
	style_button_secondary(bounty_scan_button)
	style_button_secondary(resource_scan_back_button)
	style_button_secondary(close_scan_mode_button)
	style_button_secondary(close_tactical_map_button)
	style_button_secondary(resume_button)
	style_button_primary(save_button, Color(0.18, 0.5, 0.78, 0.96), Color(0.28, 0.64, 0.94, 0.96))
	style_button_secondary(load_button)
	style_button_secondary(options_button)
	style_button_secondary(pause_main_menu_button)
	style_button_secondary(pause_quit_button)
	style_button_secondary(options_visuals_button)
	style_button_secondary(options_audio_button)
	style_button_secondary(options_gameplay_button)
	style_button_secondary(options_close_button)

	style_label_caption(ship_caption)
	style_label_caption(monitor_caption)
	style_label_caption(combat_caption)
	style_label_caption(dock_status_caption)
	style_label_caption(ship_summary_caption)
	style_label_caption(pilot_caption)
	style_label_caption(credits_panel_caption)
	style_label_caption(main_menu_caption)
	style_label_caption(market_caption)
	style_label_caption(cargo_market_caption)
	style_label_caption(market_status_caption)
	style_label_caption(storage_caption)
	style_label_caption(ship_storage_caption)
	style_label_caption(refinery_caption)
	style_label_caption(mission_board_caption)
	style_label_caption(factions_caption)
	style_label_caption(pilot_detail_caption)
	style_label_caption(faction_detail_caption)
	ship_name.add_theme_font_size_override("font_size", 20)
	ship_name.add_theme_color_override("font_color", Color(0.96, 0.98, 1.0))
	ship_class.add_theme_font_size_override("font_size", 13)
	ship_class.add_theme_color_override("font_color", Color(0.58, 0.77, 0.96))
	style_label_caption(level_caption)
	style_label_caption(credits_caption)
	style_label_caption(cargo_caption)
	style_label_caption(fuel_caption)
	style_label_caption(hull_caption)
	style_label_caption(shipyard_label)
	var ship_category_label: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ShipyardPanel/ShipyardMargin/ShipyardVBox/ShipyardColumns/ShipUpgradePanel/ShipUpgradeMargin/ShipUpgradeVBox/ShipCategoryLabel
	var combat_category_label: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ShipyardPanel/ShipyardMargin/ShipyardVBox/ShipyardColumns/CombatUpgradePanel/CombatUpgradeMargin/CombatUpgradeVBox/CombatCategoryLabel
	var service_category_label: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/ShipyardPanel/ShipyardMargin/ShipyardVBox/ShipyardColumns/ShipyardServicePanel/ShipyardServiceMargin/ShipyardServiceVBox/ServiceCategoryLabel
	style_label_caption(ship_category_label)
	style_label_caption(combat_category_label)
	style_label_caption(service_category_label)
	style_label_caption(skills_label)
	style_heading(level_value)
	style_heading(credits_value)
	style_heading(cargo_value)
	style_heading(fuel_value)
	style_heading(hull_value)
	dock_title.add_theme_font_size_override("font_size", 26)
	dock_title.add_theme_color_override("font_color", Color(0.96, 0.98, 1.0))
	dock_subtitle_label.add_theme_font_size_override("font_size", 14)
	dock_subtitle_label.add_theme_color_override("font_color", Color(0.58, 0.72, 0.88))
	main_menu_summary.add_theme_font_size_override("font_size", 13)
	main_menu_summary.add_theme_color_override("font_color", Color(0.82, 0.88, 0.96))
	dock_status_value.add_theme_font_size_override("font_size", 18)
	dock_status_value.add_theme_color_override("font_color", Color(0.72, 0.96, 0.84))
	dock_status_body.add_theme_font_size_override("font_size", 14)
	dock_status_body.add_theme_color_override("font_color", Color(0.64, 0.77, 0.88))
	dock_ship_name.add_theme_font_size_override("font_size", 20)
	dock_ship_name.add_theme_color_override("font_color", Color(0.95, 0.98, 1.0))
	dock_ship_stats.add_theme_font_size_override("font_size", 13)
	dock_ship_stats.add_theme_color_override("font_color", Color(0.66, 0.79, 0.92))
	dock_credits_value.add_theme_font_size_override("font_size", 22)
	dock_credits_value.add_theme_color_override("font_color", Color(1.0, 0.86, 0.49))
	pilot_summary.add_theme_font_size_override("font_size", 13)
	pilot_summary.add_theme_color_override("font_color", Color(0.9, 0.96, 1.0))
	combat_live.add_theme_font_size_override("font_size", 12)
	combat_live.add_theme_color_override("font_color", Color(1.0, 0.58, 0.58))
	combat_mode_label.add_theme_font_size_override("font_size", 13)
	combat_mode_label.add_theme_color_override("font_color", Color(0.97, 0.98, 1.0))
	combat_weapons_label.add_theme_font_size_override("font_size", 12)
	combat_weapons_label.add_theme_color_override("font_color", Color(0.95, 0.78, 0.56))
	combat_lock_label.add_theme_font_size_override("font_size", 12)
	combat_lock_label.add_theme_color_override("font_color", Color(1.0, 0.66, 0.66))
	combat_target_label.add_theme_font_size_override("font_size", 12)
	combat_target_label.add_theme_color_override("font_color", Color(0.88, 0.92, 1.0))
	sell_summary.add_theme_font_size_override("normal_font_size", 13)
	sell_summary.add_theme_color_override("default_color", Color(0.97, 0.82, 0.48))
	storage_summary.add_theme_font_size_override("font_size", 13)
	storage_summary.add_theme_color_override("font_color", Color(0.88, 0.94, 1.0))
	ship_storage_summary.add_theme_font_size_override("font_size", 13)
	ship_storage_summary.add_theme_color_override("font_color", Color(0.88, 0.94, 1.0))
	storage_hint.add_theme_font_size_override("font_size", 12)
	storage_hint.add_theme_color_override("font_color", Color(0.64, 0.77, 0.88))
	ship_storage_hint.add_theme_font_size_override("font_size", 12)
	ship_storage_hint.add_theme_color_override("font_color", Color(0.64, 0.77, 0.88))
	refinery_summary.add_theme_font_size_override("font_size", 13)
	refinery_summary.add_theme_color_override("font_color", Color(0.96, 0.86, 0.68))
	refinery_selected_input.add_theme_font_size_override("font_size", 14)
	refinery_selected_input.add_theme_color_override("font_color", Color(0.92, 0.95, 1.0))
	refinery_selected_output.add_theme_font_size_override("font_size", 14)
	refinery_selected_output.add_theme_color_override("font_color", Color(0.96, 0.82, 0.48))
	refinery_inventory_caption.add_theme_font_size_override("font_size", 18)
	refinery_inventory_caption.add_theme_color_override("font_color", Color(0.74, 0.83, 0.94))
	refinery_inventory_header.add_theme_font_size_override("font_size", 12)
	refinery_inventory_header.add_theme_color_override("font_color", Color(0.58, 0.72, 0.88))
	refinery_inventory_hint.add_theme_font_size_override("font_size", 12)
	refinery_inventory_hint.add_theme_color_override("font_color", Color(0.64, 0.77, 0.88))
	refinery_machine_label.add_theme_font_size_override("font_size", 18)
	refinery_machine_label.add_theme_color_override("font_color", Color(0.96, 0.82, 0.48))
	refinery_input_readout.add_theme_font_size_override("font_size", 13)
	refinery_input_readout.add_theme_color_override("font_color", Color(0.9, 0.94, 1.0))
	refinery_output_readout.add_theme_font_size_override("font_size", 13)
	refinery_output_readout.add_theme_color_override("font_color", Color(0.96, 0.82, 0.48))
	$HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/RefineryPanel/RefineryMargin/RefineryVBox/RefineryColumns/RefineryControlPanel/RefineryControlMargin/RefineryControlVBox/RefineryVisualCenter/RefineryVisualVBox/RefineryBodyRow/RefineryCoreColumn/RefineryCorePanel.add_theme_stylebox_override("panel", make_panel_style(Color(0.07, 0.08, 0.11, 0.98), Color(0.96, 0.78, 0.38, 0.24), 16, 1))
	var refinery_core_text: Label = $HUD/DockScreen/Center/Shell/Margin/VBox/ContentRow/RefineryPanel/RefineryMargin/RefineryVBox/RefineryColumns/RefineryControlPanel/RefineryControlMargin/RefineryControlVBox/RefineryVisualCenter/RefineryVisualVBox/RefineryBodyRow/RefineryCoreColumn/RefineryCorePanel/RefineryCoreMargin/RefineryCoreVBox/RefineryCoreText
	refinery_core_text.add_theme_font_size_override("font_size", 16)
	refinery_core_text.add_theme_color_override("font_color", Color(0.92, 0.8, 0.48))
	refinery_core_icon.texture = create_tinted_ui_texture(REFINER_ROOM_ICON, Color(0.9, 0.76, 0.42))
	refinery_core_icon.modulate = Color(1, 1, 1, 0.9)
	refinery_progress.add_theme_stylebox_override("fill", make_panel_style(Color(0.62, 0.72, 0.16, 0.95), Color(0.62, 0.72, 0.16, 0.95), 6, 0))
	refinery_progress.add_theme_stylebox_override("background", make_panel_style(Color(0.18, 0.14, 0.08, 0.85), Color(0.36, 0.28, 0.12, 0.55), 6, 0))
	refinery_progress.value = 0.0
	mission_board_summary.add_theme_font_size_override("font_size", 13)
	mission_board_summary.add_theme_color_override("font_color", Color(0.82, 0.88, 0.96))
	shipyard_info_label.add_theme_font_size_override("font_size", 13)
	shipyard_info_label.add_theme_color_override("font_color", Color(0.67, 0.77, 0.88))
	skill_points_label.add_theme_font_size_override("font_size", 14)
	skill_points_label.add_theme_color_override("font_color", Color(0.98, 0.84, 0.5))
	skill_tree_hint.add_theme_font_size_override("font_size", 12)
	skill_tree_hint.add_theme_color_override("font_color", Color(0.72, 0.82, 0.92))
	training_soon_panel.add_theme_stylebox_override("panel", make_panel_style(Color(0.06, 0.09, 0.14, 0.94), Color(0.95, 0.72, 0.27, 0.18), 20, 1))
	training_soon_title.add_theme_font_size_override("font_size", 20)
	training_soon_title.add_theme_color_override("font_color", Color(0.98, 0.84, 0.5))
	training_soon_text.add_theme_font_size_override("font_size", 14)
	training_soon_text.add_theme_color_override("font_color", Color(0.82, 0.88, 0.96))
	research_summary.add_theme_font_size_override("font_size", 13)
	research_summary.add_theme_color_override("font_color", Color(0.82, 0.88, 0.96))
	research_units_label.add_theme_font_size_override("font_size", 13)
	research_units_label.add_theme_color_override("font_color", Color(0.94, 0.96, 1.0))
	research_canister_label.add_theme_font_size_override("font_size", 12)
	research_canister_label.add_theme_color_override("font_color", Color(0.66, 0.84, 0.98))
	research_branch_badge.add_theme_font_size_override("font_size", 13)
	research_hint.add_theme_font_size_override("font_size", 12)
	research_hint.add_theme_color_override("font_color", Color(0.72, 0.82, 0.92))
	research_inspector_title.add_theme_font_size_override("font_size", 20)
	research_inspector_title.add_theme_color_override("font_color", Color(0.95, 0.98, 1.0))
	research_inspector_meta.add_theme_font_size_override("font_size", 12)
	research_inspector_meta.add_theme_color_override("font_color", Color(0.55, 0.82, 1.0))
	research_inspector_summary.add_theme_font_size_override("font_size", 13)
	research_inspector_summary.add_theme_color_override("font_color", Color(0.8, 0.88, 0.96))
	research_inspector_description.add_theme_font_size_override("normal_font_size", 13)
	research_inspector_description.add_theme_color_override("default_color", Color(0.86, 0.92, 0.98))
	research_footer_status.add_theme_font_size_override("font_size", 12)
	research_footer_status.add_theme_color_override("font_color", Color(0.68, 0.82, 0.94))
	factions_summary.add_theme_font_size_override("font_size", 13)
	factions_summary.add_theme_color_override("font_color", Color(0.82, 0.88, 0.96))
	faction_list.add_theme_font_size_override("normal_font_size", 13)
	faction_list.add_theme_color_override("default_color", Color(0.88, 0.94, 1.0))
	factions_hint.add_theme_font_size_override("font_size", 12)
	factions_hint.add_theme_color_override("font_color", Color(0.64, 0.77, 0.88))
	dock_footer_status.add_theme_font_size_override("font_size", 13)
	dock_footer_status.add_theme_color_override("font_color", Color(0.68, 0.78, 0.9))
	monitor_live.add_theme_font_size_override("font_size", 11)
	monitor_live.add_theme_color_override("font_color", Color(0.54, 0.98, 0.74))
	monitor_log.add_theme_font_size_override("normal_font_size", 12)
	monitor_log.add_theme_color_override("default_color", Color(0.86, 0.92, 1.0))
	field_console_title.add_theme_font_size_override("font_size", 22)
	field_console_title.add_theme_color_override("font_color", Color(0.95, 0.97, 1.0))
	field_mission_name.add_theme_font_size_override("font_size", 20)
	field_mission_name.add_theme_color_override("font_color", Color(1.0, 0.94, 0.78))
	field_mission_list_title.add_theme_font_size_override("font_size", 12)
	field_mission_list_title.add_theme_color_override("font_color", Color(0.98, 0.82, 0.45))
	field_mission_description.add_theme_font_size_override("font_size", 15)
	field_mission_description.add_theme_color_override("font_color", Color(0.86, 0.9, 0.98))
	field_mission_progress.add_theme_font_size_override("font_size", 15)
	field_mission_progress.add_theme_color_override("font_color", Color(0.96, 0.77, 0.38))
	field_mission_rewards.add_theme_font_size_override("font_size", 14)
	field_mission_rewards.add_theme_color_override("font_color", Color(0.66, 0.87, 0.7))
	field_cargo_summary.add_theme_font_size_override("font_size", 16)
	field_cargo_summary.add_theme_color_override("font_color", Color(0.84, 0.9, 0.98))
	field_map_info.add_theme_font_size_override("font_size", 13)
	field_map_info.add_theme_color_override("font_color", Color(0.78, 0.86, 0.96))
	field_map_legend.add_theme_font_size_override("font_size", 12)
	field_map_legend.add_theme_color_override("font_color", Color(0.66, 0.82, 0.94))
	field_map_status.add_theme_font_size_override("font_size", 12)
	field_map_status.add_theme_color_override("font_color", Color(0.92, 0.86, 0.58))
	field_pilot_summary.add_theme_font_size_override("font_size", 17)
	field_pilot_summary.add_theme_color_override("font_color", Color(0.98, 0.99, 1.0))
	field_pilot_detail.add_theme_font_size_override("normal_font_size", 12)
	field_pilot_detail.add_theme_color_override("default_color", Color(0.88, 0.94, 0.99))
	field_skills_summary.add_theme_font_size_override("font_size", 14)
	field_skills_summary.add_theme_color_override("font_color", Color(0.84, 0.9, 0.98))
	prompt_label.add_theme_font_size_override("font_size", 14)
	prompt_label.add_theme_color_override("font_color", Color(0.89, 0.95, 1.0))
	onboarding_title.add_theme_font_size_override("font_size", 15)
	onboarding_title.add_theme_color_override("font_color", Color(0.94, 0.97, 1.0))
	onboarding_status.add_theme_font_size_override("font_size", 13)
	onboarding_status.add_theme_color_override("font_color", Color(0.68, 0.8, 0.95))
	onboarding_body.add_theme_font_size_override("font_size", 13)
	onboarding_body.add_theme_color_override("font_color", Color(0.84, 0.9, 0.98))
	fps_label.add_theme_font_size_override("font_size", 11)
	fps_label.add_theme_color_override("font_color", Color(0.74, 0.82, 0.92, 0.82))
	mission_popup_title.add_theme_font_size_override("font_size", 22)
	mission_popup_title.add_theme_color_override("font_color", Color(0.95, 0.97, 1.0))
	inventory_popup_title.add_theme_font_size_override("font_size", 22)
	inventory_popup_title.add_theme_color_override("font_color", Color(0.95, 0.97, 1.0))
	mission_popup_name.add_theme_font_size_override("font_size", 20)
	mission_popup_name.add_theme_color_override("font_color", Color(1.0, 0.94, 0.78))
	mission_popup_description.add_theme_font_size_override("font_size", 15)
	mission_popup_description.add_theme_color_override("font_color", Color(0.86, 0.9, 0.98))
	mission_popup_progress.add_theme_font_size_override("font_size", 15)
	mission_popup_progress.add_theme_color_override("font_color", Color(0.96, 0.77, 0.38))
	mission_popup_rewards.add_theme_font_size_override("font_size", 14)
	mission_popup_rewards.add_theme_color_override("font_color", Color(0.66, 0.87, 0.7))
	guided_mission_popup_title.add_theme_font_size_override("font_size", 22)
	guided_mission_popup_title.add_theme_color_override("font_color", Color(0.98, 0.96, 0.9))
	guided_mission_popup_badge.add_theme_font_size_override("font_size", 12)
	guided_mission_popup_badge.add_theme_color_override("font_color", Color(1.0, 0.84, 0.38))
	guided_mission_popup_step.add_theme_font_size_override("font_size", 18)
	guided_mission_popup_step.add_theme_color_override("font_color", Color(0.92, 0.95, 1.0))
	guided_mission_popup_body.add_theme_font_size_override("font_size", 14)
	guided_mission_popup_body.add_theme_color_override("font_color", Color(0.84, 0.9, 0.98))
	inventory_summary.add_theme_font_size_override("font_size", 16)
	inventory_summary.add_theme_color_override("font_color", Color(0.84, 0.9, 0.98))
	tooltip_name.add_theme_font_size_override("font_size", 13)
	tooltip_name.add_theme_color_override("font_color", Color(0.97, 0.98, 1.0))
	tooltip_body.add_theme_font_size_override("font_size", 11)
	tooltip_body.add_theme_color_override("font_color", Color(0.72, 0.82, 0.92))
	transfer_popup_title.add_theme_font_size_override("font_size", 18)
	transfer_popup_title.add_theme_color_override("font_color", Color(0.95, 0.97, 1.0))
	transfer_popup_info.add_theme_font_size_override("font_size", 12)
	transfer_popup_info.add_theme_color_override("font_color", Color(0.74, 0.82, 0.92))
	dock_prompt_title.add_theme_font_size_override("font_size", 18)
	dock_prompt_title.add_theme_color_override("font_color", Color(0.95, 0.97, 1.0))
	dock_prompt_info.add_theme_font_size_override("font_size", 13)
	dock_prompt_info.add_theme_color_override("font_color", Color(0.78, 0.86, 0.96))
	scan_mode_title.add_theme_font_size_override("font_size", 18)
	scan_mode_title.add_theme_color_override("font_color", Color(0.95, 0.97, 1.0))
	scan_mode_info.add_theme_font_size_override("font_size", 13)
	scan_mode_info.add_theme_color_override("font_color", Color(0.78, 0.86, 0.96))
	resource_scan_scroll.add_theme_stylebox_override("panel", make_panel_style(Color(0.04, 0.07, 0.1, 0.92), Color(0.95, 0.72, 0.27, 0.14), 14, 1))
	tactical_map_title.add_theme_font_size_override("font_size", 20)
	tactical_map_title.add_theme_color_override("font_color", Color(0.95, 0.97, 1.0))
	tactical_map_info.add_theme_font_size_override("font_size", 13)
	tactical_map_info.add_theme_color_override("font_color", Color(0.78, 0.86, 0.96))
	tactical_map_legend.add_theme_font_size_override("font_size", 12)
	tactical_map_legend.add_theme_color_override("font_color", Color(0.66, 0.82, 0.94))
	tactical_map_status.add_theme_font_size_override("font_size", 12)
	tactical_map_status.add_theme_color_override("font_color", Color(0.92, 0.86, 0.58))
	pause_title.add_theme_font_size_override("font_size", 20)
	pause_title.add_theme_color_override("font_color", Color(0.95, 0.97, 1.0))
	pause_status.add_theme_font_size_override("font_size", 13)
	pause_status.add_theme_color_override("font_color", Color(0.78, 0.86, 0.96))
	apply_field_console_tab_styles()


func make_panel_style(bg: Color, border: Color, radius: int, border_width: int) -> StyleBoxFlat:
	var style := StyleBoxFlat.new()
	style.bg_color = bg
	style.border_color = border
	style.set_border_width_all(border_width)
	style.set_corner_radius_all(radius)
	style.shadow_color = Color(0.0, 0.0, 0.0, 0.28)
	style.shadow_size = 10
	style.content_margin_left = 2
	style.content_margin_top = 2
	style.content_margin_right = 2
	style.content_margin_bottom = 2
	return style


func style_button_primary(button: Button, bg: Color = Color(0.16, 0.48, 0.78, 0.96), hover: Color = Color(0.24, 0.62, 0.94, 0.96)) -> void:
	var normal := make_panel_style(bg, Color(1, 1, 1, 0.08), 12, 1)
	var hover_style := make_panel_style(hover, Color(1, 1, 1, 0.16), 12, 1)
	var pressed := make_panel_style(bg.darkened(0.18), Color(1, 1, 1, 0.12), 12, 1)
	button.add_theme_stylebox_override("normal", normal)
	button.add_theme_stylebox_override("hover", hover_style)
	button.add_theme_stylebox_override("pressed", pressed)
	button.add_theme_stylebox_override("focus", hover_style)
	button.add_theme_font_size_override("font_size", 13)
	button.add_theme_color_override("font_color", Color(0.97, 0.99, 1.0))
	button.custom_minimum_size.y = max(button.custom_minimum_size.y, 34)


func style_button_secondary(button: Button) -> void:
	var normal := make_panel_style(Color(0.08, 0.12, 0.18, 0.96), Color(0.25, 0.8, 1.0, 0.12), 12, 1)
	var hover_style := make_panel_style(Color(0.11, 0.16, 0.24, 0.98), Color(0.25, 0.8, 1.0, 0.26), 12, 1)
	var pressed := make_panel_style(Color(0.06, 0.1, 0.16, 0.98), Color(0.25, 0.8, 1.0, 0.16), 12, 1)
	button.add_theme_stylebox_override("normal", normal)
	button.add_theme_stylebox_override("hover", hover_style)
	button.add_theme_stylebox_override("pressed", pressed)
	button.add_theme_stylebox_override("focus", hover_style)
	button.add_theme_font_size_override("font_size", 13)
	button.add_theme_color_override("font_color", Color(0.88, 0.94, 1.0))
	button.custom_minimum_size.y = max(button.custom_minimum_size.y, 36)


func style_shipyard_upgrade_button(button: Button, icon_texture: Texture2D, icon_color: Color) -> void:
	if button == null:
		return
	style_button_secondary(button)
	button.icon = create_tinted_ui_texture(icon_texture, icon_color)
	button.expand_icon = true
	button.icon_alignment = HORIZONTAL_ALIGNMENT_CENTER
	button.alignment = HORIZONTAL_ALIGNMENT_CENTER
	button.vertical_icon_alignment = VERTICAL_ALIGNMENT_TOP
	button.add_theme_constant_override("h_separation", 8)
	button.add_theme_color_override("icon_normal_color", Color(1.0, 1.0, 1.0, 1.0))
	button.add_theme_color_override("icon_hover_color", Color(1.0, 1.0, 1.0, 1.0))
	button.add_theme_color_override("icon_pressed_color", Color(1.0, 1.0, 1.0, 1.0))
	button.add_theme_color_override("icon_focus_color", Color(1.0, 1.0, 1.0, 1.0))
	button.add_theme_color_override("icon_disabled_color", Color(0.42, 0.47, 0.55, 0.72))
	button.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	button.custom_minimum_size = Vector2(max(button.custom_minimum_size.x, 152), max(button.custom_minimum_size.y, 152))


func style_arm_indicator(active: bool) -> void:
	if active:
		var normal := make_panel_style(Color(0.44, 0.08, 0.08, 0.98), Color(1.0, 0.34, 0.34, 0.88), 12, 1)
		var hover_style := make_panel_style(Color(0.56, 0.12, 0.12, 1.0), Color(1.0, 0.46, 0.46, 0.94), 12, 1)
		var pressed := make_panel_style(Color(0.36, 0.06, 0.06, 0.98), Color(1.0, 0.38, 0.38, 0.9), 12, 1)
		normal.shadow_color = Color(1.0, 0.18, 0.18, 0.5)
		hover_style.shadow_color = Color(1.0, 0.2, 0.2, 0.58)
		pressed.shadow_color = Color(0.94, 0.12, 0.12, 0.46)
		normal.shadow_size = 20
		hover_style.shadow_size = 22
		pressed.shadow_size = 18
		arm_button.add_theme_stylebox_override("normal", normal)
		arm_button.add_theme_stylebox_override("hover", hover_style)
		arm_button.add_theme_stylebox_override("pressed", pressed)
		arm_button.add_theme_stylebox_override("focus", hover_style)
		arm_button.add_theme_font_size_override("font_size", 13)
		arm_button.add_theme_color_override("font_color", Color(1.0, 0.94, 0.94))
	else:
		style_button_secondary(arm_button)


func style_inventory_slot(slot: Button) -> void:
	var normal := make_panel_style(Color(0.07, 0.1, 0.16, 0.96), Color(0.25, 0.8, 1.0, 0.12), 16, 1)
	var hover_style := make_panel_style(Color(0.11, 0.15, 0.24, 0.98), Color(0.25, 0.8, 1.0, 0.32), 16, 1)
	var disabled := make_panel_style(Color(0.05, 0.07, 0.11, 0.82), Color(1, 1, 1, 0.04), 16, 1)
	slot.add_theme_stylebox_override("normal", normal)
	slot.add_theme_stylebox_override("hover", hover_style)
	slot.add_theme_stylebox_override("focus", hover_style)
	slot.add_theme_stylebox_override("disabled", disabled)
	slot.add_theme_font_size_override("font_size", 12)
	slot.add_theme_color_override("font_color", Color(0.84, 0.9, 0.98))
	slot.add_theme_color_override("font_disabled_color", Color(0.38, 0.46, 0.56))


func style_label_caption(label: Label) -> void:
	label.add_theme_font_size_override("font_size", 11)
	label.add_theme_color_override("font_color", Color(0.55, 0.66, 0.78))


func style_heading(label: Label) -> void:
	label.add_theme_font_size_override("font_size", 20)
	label.add_theme_color_override("font_color", Color(0.96, 0.98, 1.0))


func connect_room_button_tooltip(button: Button, room_name: String) -> void:
	button.mouse_entered.connect(func() -> void: show_room_tooltip(room_name))
	button.mouse_exited.connect(hide_tooltip)


func connect_simple_tooltip(button: Button, title: String, body: String) -> void:
	button.mouse_entered.connect(func() -> void:
		tooltip_name.text = title
		tooltip_body.text = body
		inventory_tooltip.visible = true
		update_tooltip_position()
	)
	button.mouse_exited.connect(hide_tooltip)


# --- Station room flow ---
func is_dock_open() -> bool:
	return dock_screen.visible


func is_any_overlay_open() -> bool:
	return dock_screen.visible or field_console_popup.visible or transfer_popup.visible or dock_prompt_popup.visible or boarding_prompt_popup.visible or scan_mode_popup.visible or pause_popup.visible or options_popup.visible or guided_mission_popup.visible


func show_station_main_menu() -> void:
	current_dock_room = ""
	current_station_greeting = station_greetings[rng.randi_range(0, station_greetings.size() - 1)]
	close_transfer_popup()
	main_menu_panel.visible = true
	dock_rooms.visible = false
	dock_top_row.visible = true
	dock_back_button.visible = false
	for panel in [market_panel, storage_panel, refinery_panel, crafting_panel, mission_board_panel, shipyard_panel, skills_panel, research_panel, factions_panel]:
		panel.visible = false
	dock_subtitle.text = "%s directory" % current_station_name()
	hide_tooltip()
	if is_node_ready():
		update_hud()


func open_station_room(room_name: String) -> void:
	current_dock_room = room_name
	close_transfer_popup()
	main_menu_panel.visible = false
	dock_rooms.visible = true
	dock_top_row.visible = false
	dock_back_button.visible = true
	for panel in [market_panel, storage_panel, refinery_panel, crafting_panel, mission_board_panel, shipyard_panel, skills_panel, research_panel, factions_panel]:
		panel.visible = false

	match room_name:
		"exchange":
			market_panel.visible = true
			dock_subtitle.text = "%s exchange" % current_station_name()
			update_mission_progress("intro_open_exchange", 1)
		"storage":
			storage_panel.visible = true
			dock_subtitle.text = "%s storage" % current_station_name()
		"refinery":
			refinery_panel.visible = true
			dock_subtitle.text = "%s refinery" % current_station_name()
		"crafting":
			crafting_panel.visible = true
			dock_subtitle.text = "%s crafting" % current_station_name()
			update_mission_progress("intro_open_crafting", 1)
		"mission":
			mission_board_panel.visible = true
			mission_board_view = "active" if has_active_mission() else "available"
			dock_subtitle.text = "%s mission board" % current_station_name()
			update_mission_progress("intro_open_mission_board", 1)
		"shipyard":
			shipyard_panel.visible = true
			dock_subtitle.text = "%s shipyard" % current_station_name()
			update_mission_progress("intro_open_shipyard", 1)
			update_mission_progress("intro_restock_visit", 1)
		"crew":
			skills_panel.visible = true
			dock_subtitle.text = "%s training" % current_station_name()
			update_mission_progress("intro_open_training", 1)
		"research":
			research_panel.visible = true
			dock_subtitle.text = "%s research" % current_station_name()
			update_mission_progress("intro_open_research", 1)
		"factions":
			factions_panel.visible = true
			dock_subtitle.text = "%s records" % current_station_name()
		_:
			show_station_main_menu()
			return
	hide_tooltip()
	if is_node_ready():
		update_hud()


func open_dock_screen() -> void:
	if player.is_launching() or not is_station_docking_range() or not has_station_in_current_map():
		return

	dock_prompt_popup.visible = false
	docking_pull_in_progress = false
	docking_menu_delay = -1.0
	docking_phase = ""
	docked_at_station = true
	player.force_stop()
	player.global_position = docking_final_target if docking_final_target != Vector2.ZERO else station.global_position
	dock_screen.visible = true
	field_console_popup.visible = false
	mark_onboarding_step("dock")
	award_use_skill_xp("piloting", 2.0, true)
	hide_tooltip()
	show_station_main_menu()
	push_telemetry_event("%s interface engaged." % current_station_name(), "dock")
	update_hud()


func close_dock_screen() -> void:
	dock_screen.visible = false
	docked_at_station = false
	docking_prompt_suppressed = true
	docking_pull_in_progress = false
	docking_menu_delay = -1.0
	docking_phase = ""
	return_to_dock_on_popup_close = false
	close_transfer_popup()
	show_station_main_menu()
	var undock_plan: Dictionary
	if docking_approach_target != Vector2.ZERO and docking_final_target != Vector2.ZERO:
		undock_plan = {
			"approach": docking_approach_target,
			"berth": docking_final_target,
			"label": docking_side_label,
		}
	else:
		undock_plan = nearest_station_dock_plan(player.global_position)
		docking_approach_target = undock_plan.get("approach", station.global_position)
		docking_final_target = undock_plan.get("berth", station.global_position)
		docking_side_label = str(undock_plan.get("label", "dock"))
	player.global_position = docking_final_target
	player.launch_to(docking_approach_target)
	push_telemetry_event("%s launch clearance granted." % current_station_name(), "dock")


# --- Flight / station interaction ---
func handle_flight_systems(delta: float) -> void:
	var movement_input := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var moving := not is_any_overlay_open() and movement_input.length() > 0.05
	var boost_pressed := Input.is_key_pressed(KEY_SHIFT)
	var boost_allowed := moving and current_fuel > 0.0 and boost_pressed

	if str(current_mission.get("id", "")) == "intro_flight_controls":
		if moving:
			onboarding_move_progress = min(onboarding_move_progress + delta, ONBOARDING_MOVE_REQUIRED_TIME)
			if onboarding_move_progress >= ONBOARDING_MOVE_REQUIRED_TIME:
				update_mission_progress("intro_move", 1)
		else:
			onboarding_move_progress = max(onboarding_move_progress - delta * 0.5, 0.0)

	player.set_boost_active(boost_allowed)
	player.set_fuel_limited(current_fuel <= 0.0)

	if moving:
		current_fuel = max(current_fuel - (0.28 * (1.0 - fuel_burn_reduction()) * delta), 0.0)
		if boost_allowed:
			current_fuel = max(current_fuel - (0.38 * (1.0 - boost_burn_reduction()) * delta), 0.0)

	if current_fuel <= 0.0 and not low_fuel_warning_active:
		push_telemetry_event("Fuel reserves depleted. Thrusters output reduced.", "warning")
		low_fuel_warning_active = true
	elif current_fuel > ship_stats["fuel_capacity"] * 0.12:
		low_fuel_warning_active = false


func handle_market_fluctuation(delta: float) -> void:
	map_jump_cooldown = max(map_jump_cooldown - delta, 0.0)
	market_update_timer -= delta
	if market_update_timer > 0.0:
		return

	var changes := rng.randi_range(2, 4)
	for _i in range(changes):
		var item_type: StringName = ITEM_ORDER[rng.randi_range(0, ITEM_ORDER.size() - 1)]
		var current := float(market_price_multipliers.get(item_type, 1.0))
		var shift := rng.randf_range(-0.08, 0.08)
		market_price_multipliers[item_type] = snappedf(clampf(current + shift, 0.68, 1.38), 0.01)

	market_update_timer = rng.randf_range(10.0, 18.0)
	update_hud()


func handle_combat_systems(delta: float) -> void:
	if is_any_overlay_open():
		update_shield_systems(delta)
		update_damage_floaters(delta)
		return

	if Input.is_action_just_pressed("combat_toggle"):
		toggle_combat_mode()

	primary_laser_timer = max(primary_laser_timer - delta, 0.0)
	special_weapon_cooldown = max(special_weapon_cooldown - delta, 0.0)
	handle_combat_contract_spawns(delta)
	update_lock_state(delta)
	update_hostiles(delta)
	update_player_missiles(delta)
	update_hostile_missiles(delta)
	update_laser_beams(delta)
	update_shield_systems(delta)
	update_loot_pickups(delta)
	update_damage_floaters(delta)

	if not combat_mode or docking_pull_in_progress or docked_at_station:
		return

	update_combat_prompt()
	handle_player_weapons()


func update_combat_prompt() -> void:
	var target: Dictionary = targeted_hostile()
	if pending_boarding_hostile_id != -1:
		prompt_label.text = "Crippled hostile in range. Choose BOARD or DESTROY."
	elif not target.is_empty() and bool(target.get("disabled", false)) and can_board_disabled_hostiles():
		prompt_label.text = "Crippled hostile secured. Close in to decide its fate."
	elif not target.is_empty() and bool(target.get("disabled", false)):
		prompt_label.text = "Crippled hostile secured. Salvage Lv %d required to board." % SALVAGE_HOSTILE_BOARDING_LEVEL
	elif not target.is_empty():
		prompt_label.text = "Engage hostile contact. LMB fires lasers, RMB launches missiles."
	else:
		prompt_label.text = "Combat Mode active. Sweep for hostiles or return to Operations Mode."


func toggle_combat_mode() -> void:
	combat_mode = not combat_mode
	lock_target_id = -1
	lock_progress = 0.0
	last_lock_target_id = -1
	if combat_mode:
		update_mission_progress("intro_arm_weapons", 1)
		push_telemetry_event("Combat mode engaged. Weapons systems online.", "combat")
	else:
		push_telemetry_event("Operations mode engaged. Mining and scanning restored.", "system")
	update_hud()


func handle_combat_contract_spawns(delta: float) -> void:
	var combat_mission_index: int = first_active_mission_index_matching_ids([
		"blackwake_kills",
		"blackwake_hunt",
		"bounty_tags",
		"contested_recovery",
		"derelict_quarantine",
		"breacher_breakup",
		"hostile_probe",
	])
	if combat_mission_index < 0:
		combat_contract_spawn_timer = 0.0
		return
	var combat_mission: Dictionary = active_missions[combat_mission_index]
	var mission_id: String = str(combat_mission.get("id", ""))
	if docked_at_station:
		combat_contract_spawn_timer = 0.0
		return
	if find_nearest_hostile_for_faction("blackwake") != null and not ["contested_recovery", "derelict_quarantine"].has(mission_id):
		combat_contract_spawn_timer = 0.0
		return

	if combat_contract_spawn_timer <= 0.0:
		combat_contract_spawn_timer = rng.randf_range(4.5, 7.0)

	combat_contract_spawn_timer -= delta
	if combat_contract_spawn_timer > 0.0:
		return

	if mission_id == "contested_recovery":
		if nearby_derelict_ships_in_radius(2400.0).is_empty():
			spawn_derelict_ship_near_player()
		var hostile_count := 2 if rng.randf() < 0.45 else 1
		for hostile_index in range(hostile_count):
			var contested_spawn_offset := Vector2.RIGHT.rotated(rng.randf_range(0.0, TAU)) * rng.randf_range(300.0, 430.0 + 40.0 * hostile_index)
			var contested_enemy_role := "breacher" if hostile_index == 0 and rng.randf() < 0.45 else ("interceptor" if rng.randf() < 0.5 else "scout")
			spawn_hostile_contact(player.global_position + contested_spawn_offset, "blackwake", 1, contested_enemy_role)
		combat_contract_spawn_timer = rng.randf_range(7.5, 11.0)
		push_telemetry_event("Blackwake scavengers dropped into the derelict recovery zone.", "combat")
		return

	if mission_id == "derelict_quarantine":
		if nearby_derelict_ships_in_radius(2400.0).is_empty():
			spawn_derelict_ship_near_player()
		var quarantine_roles := ["interceptor", "breacher"]
		for quarantine_role in quarantine_roles:
			var quarantine_spawn_offset := Vector2.RIGHT.rotated(rng.randf_range(0.0, TAU)) * rng.randf_range(320.0, 460.0)
			spawn_hostile_contact(player.global_position + quarantine_spawn_offset, "blackwake", 1, quarantine_role)
		combat_contract_spawn_timer = rng.randf_range(8.0, 11.5)
		push_telemetry_event("Paladins quarantine ping updated. Blackwake scavengers are clustering around the derelict.", "combat")
		return

	if mission_id == "breacher_breakup":
		var breacher_pack := ["breacher", "marauder"]
		for breacher_role in breacher_pack:
			var breacher_spawn_offset := Vector2.RIGHT.rotated(rng.randf_range(0.0, TAU)) * rng.randf_range(340.0, 470.0)
			spawn_hostile_contact(player.global_position + breacher_spawn_offset, "blackwake", 1, breacher_role)
		combat_contract_spawn_timer = rng.randf_range(8.5, 12.0)
		push_telemetry_event("Heavy raider wing detected. Breacher element inbound.", "combat")
		return

	if mission_id == "hostile_probe":
		var probe_role := "interceptor" if rng.randf() < 0.6 else "scout"
		var probe_offset := Vector2.RIGHT.rotated(rng.randf_range(0.0, TAU)) * rng.randf_range(300.0, 420.0)
		spawn_hostile_contact(player.global_position + probe_offset, "blackwake", 1, probe_role)
		combat_contract_spawn_timer = rng.randf_range(6.0, 9.0)
		push_telemetry_event("Threat probe picked up an active Blackwake response. Telemetry lock updated.", "combat")
		return

	var spawn_offset := Vector2.RIGHT.rotated(rng.randf_range(0.0, TAU)) * rng.randf_range(320.0, 410.0)
	var enemy_role := "breacher" if rng.randf() < 0.12 else ("marauder" if rng.randf() < 0.28 else ("interceptor" if rng.randf() < 0.55 else "scout"))
	spawn_hostile_contact(player.global_position + spawn_offset, "blackwake", 1, enemy_role)
	combat_contract_spawn_timer = rng.randf_range(5.0, 8.0)
	push_telemetry_event("Blackwake %s warped into the contract zone." % enemy_role, "combat")


func hostile_profile(enemy_role: String, enemy_level: int) -> Dictionary:
	match enemy_role:
		"breacher":
			return {
				"role": "breacher",
				"display_name": "Blackwake Breacher",
				"hull": 64 + enemy_level * 10,
				"speed_far": 82.0,
				"speed_near": 34.0,
				"accel": 128.0,
				"fire_min": 0.52,
				"fire_max": 0.74,
				"damage_min": 7,
				"damage_max": 11,
				"body_color": Color(0.98, 0.42, 0.24, 0.97),
				"ring_color": Color(0.58, 0.14, 0.05, 0.22),
				"radius": 16.0,
				"texture": ENEMY_SHIP_TEXTURE_02,
				"texture_scale": 0.46,
				"weapon_type": "missile",
				"shield": 28.0,
				"shield_recharge_rate": 5.2,
			}
		"marauder":
			return {
				"role": "marauder",
				"display_name": "Blackwake Marauder",
				"hull": 52 + enemy_level * 8,
				"speed_far": 88.0,
				"speed_near": 38.0,
				"accel": 150.0,
				"fire_min": 0.62,
				"fire_max": 0.86,
				"damage_min": 6,
				"damage_max": 9,
				"body_color": Color(0.94, 0.52, 0.18, 0.96),
				"ring_color": Color(0.54, 0.18, 0.06, 0.2),
				"radius": 15.0,
				"texture": ENEMY_SHIP_TEXTURE_02,
				"texture_scale": 0.42,
				"weapon_type": "missile",
				"shield": 22.0,
				"shield_recharge_rate": 4.8,
			}
		"interceptor":
			return {
				"role": "interceptor",
				"display_name": "Blackwake Interceptor",
				"hull": 36 + enemy_level * 6,
				"speed_far": 138.0,
				"speed_near": 72.0,
				"accel": 220.0,
				"fire_min": 0.7,
				"fire_max": 1.0,
				"damage_min": 4,
				"damage_max": 7,
				"body_color": Color(1.0, 0.34, 0.3, 0.96),
				"ring_color": Color(0.52, 0.1, 0.1, 0.18),
				"radius": 13.0,
				"texture": ENEMY_SHIP_TEXTURE_01,
				"texture_scale": 0.38,
				"weapon_type": "laser",
				"shield": 16.0,
				"shield_recharge_rate": 4.2,
			}
		_:
			return {
				"role": "scout",
				"display_name": "Blackwake Scout",
				"hull": 26 + enemy_level * 4,
				"speed_far": 95.0,
				"speed_near": 48.0,
				"accel": 180.0,
				"fire_min": 0.95,
				"fire_max": 1.25,
				"damage_min": 3,
				"damage_max": 5,
				"body_color": Color(0.92, 0.28, 0.28, 0.94),
				"ring_color": Color(0.38, 0.08, 0.08, 0.16),
				"radius": 12.0,
				"texture": ENEMY_SHIP_TEXTURE_01,
				"texture_scale": 0.34,
				"weapon_type": "laser",
				"shield": 12.0,
				"shield_recharge_rate": 4.0,
			}


func hostile_display_name(hostile: Dictionary) -> String:
	return str(hostile.get("display_name", "Hostile Contact"))


func spawn_hostile_contact(world_position: Vector2, faction_id: String, enemy_level: int, enemy_role: String = "scout") -> void:
	var profile := hostile_profile(enemy_role, enemy_level)
	hostile_contacts.append({
		"id": next_hostile_id,
		"position": world_position,
		"velocity": Vector2.ZERO,
		"rotation": (player.global_position - world_position).angle(),
		"hull": profile["hull"],
		"max_hull": profile["hull"],
		"fire_timer": rng.randf_range(float(profile["fire_min"]), float(profile["fire_max"])),
		"faction": faction_id,
		"level": enemy_level,
		"role": profile["role"],
		"display_name": profile["display_name"],
		"speed_far": profile["speed_far"],
		"speed_near": profile["speed_near"],
		"accel": profile["accel"],
		"damage_min": profile["damage_min"],
		"damage_max": profile["damage_max"],
		"body_color": profile["body_color"],
		"ring_color": profile["ring_color"],
		"radius": profile["radius"],
		"fire_min": profile["fire_min"],
		"fire_max": profile["fire_max"],
		"weapon_type": profile.get("weapon_type", "laser"),
		"texture": profile.get("texture", null),
		"texture_scale": profile.get("texture_scale", 0.4),
		"shield": float(profile.get("shield", 0.0)),
		"max_shield": float(profile.get("shield", 0.0)),
		"shield_recharge_rate": float(profile.get("shield_recharge_rate", 0.0)),
		"shield_recharge_delay": 0.0,
		"disabled": false,
		"scan_alert_triggered": false,
		"boarding_announced": false,
	})
	next_hostile_id += 1


func update_lock_state(delta: float) -> void:
	if not combat_mode or hostile_contacts.is_empty():
		lock_target_id = -1
		lock_progress = 0.0
		last_lock_target_id = -1
		return

	var hovered_enemy := get_enemy_under_cursor()
	if hovered_enemy.is_empty():
		lock_target_id = -1
		lock_progress = 0.0
		last_lock_target_id = -1
		return

	var hovered_id: int = hovered_enemy["id"]
	if lock_target_id != hovered_id:
		lock_target_id = hovered_id
		lock_progress = 0.0
		last_lock_target_id = -1

	var required_lock_time := combat_lock_time()
	lock_progress = min(lock_progress + delta, required_lock_time)
	if lock_progress >= required_lock_time and last_lock_target_id != lock_target_id:
		last_lock_target_id = lock_target_id
		play_audio(lock_player, 1.0)
		push_telemetry_event("Missile lock confirmed on %s." % hostile_display_name(hovered_enemy), "combat")


func get_enemy_under_cursor() -> Dictionary:
	var mouse_world := get_global_mouse_position()
	var closest := {}
	var closest_distance := 28.0
	for hostile in hostile_contacts:
		var distance := mouse_world.distance_to(hostile["position"])
		if distance < closest_distance:
			closest_distance = distance
			closest = hostile
	return closest


func handle_player_weapons() -> void:
	if Input.is_action_pressed("scan") and primary_laser_timer <= 0.0:
		fire_primary_lasers()
		primary_laser_timer = PRIMARY_LASER_INTERVAL

	if Input.is_action_just_pressed("mine"):
		fire_special_missile()


func fire_primary_lasers() -> void:
	var target: Dictionary = get_primary_laser_target()
	var start: Vector2 = player.global_position + Vector2.RIGHT.rotated(player.rotation) * 16.0
	var finish: Vector2 = start + Vector2.RIGHT.rotated(player.rotation) * PRIMARY_LASER_RANGE
	play_audio(laser_player, 1.0 + rng.randf_range(-0.05, 0.05))
	if not target.is_empty():
		finish = target["position"]
		apply_damage_to_hostile(int(target["id"]), player_laser_damage(), false, player.global_position)
	active_laser_beams.push_back({
		"from": start,
		"to": finish,
		"time_left": 0.08,
		"color": Color(1.0, 0.26, 0.26, 0.88),
	})


func get_primary_laser_target() -> Dictionary:
	var best_target := {}
	var best_distance := PRIMARY_LASER_RANGE
	var forward := Vector2.RIGHT.rotated(player.rotation)
	for hostile in hostile_contacts:
		if bool(hostile.get("disabled", false)):
			continue
		var to_enemy: Vector2 = hostile["position"] - player.global_position
		var distance := to_enemy.length()
		if distance > best_distance:
			continue
		if forward.dot(to_enemy.normalized()) < 0.74:
			continue
		best_distance = distance
		best_target = hostile
	return best_target


func fire_special_missile() -> void:
	if special_weapon_cooldown > 0.0:
		push_telemetry_event("Missile rack cooling down.", "combat")
		return
	if special_ammo <= 0:
		push_telemetry_event("Missile racks empty. Rearm at station support.", "warning")
		return

	var target_id := -1
	if lock_target_id != -1 and lock_progress >= combat_lock_time():
		target_id = lock_target_id
		push_telemetry_event("Missile launched with active lock.", "combat")
	else:
		push_telemetry_event("Missile launched unguided.", "combat")
	play_audio(missile_player, 1.0)

	player_missiles.push_back({
		"position": player.global_position + Vector2.RIGHT.rotated(player.rotation) * 20.0,
		"velocity": Vector2.RIGHT.rotated(player.rotation) * 330.0,
		"rotation": player.rotation,
		"target_id": target_id,
		"time_left": 3.5,
	})
	special_ammo -= 1
	special_weapon_cooldown = missile_cooldown_duration()


func update_hostiles(delta: float) -> void:
	for hostile in hostile_contacts:
		if bool(hostile.get("disabled", false)):
			hostile["velocity"] = Vector2(hostile["velocity"]).move_toward(Vector2.ZERO, 220.0 * delta)
			hostile["position"] += hostile["velocity"] * delta
			try_prompt_boarding(hostile)
			continue

		var to_player: Vector2 = player.global_position - hostile["position"]
		var direction := to_player.normalized()
		var distance := to_player.length()
		var hostile_role := str(hostile.get("role", "scout"))
		var strafe_sign := 1.0 if int(hostile.get("id", 0)) % 2 == 0 else -1.0
		var desired_direction := direction
		var desired_speed := float(hostile.get("speed_far", 95.0)) if distance > 220.0 else float(hostile.get("speed_near", 48.0))
		match hostile_role:
			"scout":
				if distance < 180.0:
					desired_direction = direction.rotated(0.95 * strafe_sign)
					desired_speed = float(hostile.get("speed_far", 95.0))
			"interceptor":
				desired_direction = direction.rotated(0.42 * strafe_sign)
				if distance < 150.0:
					desired_direction = direction.rotated(1.15 * strafe_sign)
			"marauder":
				if distance < 230.0:
					desired_direction = -direction
					desired_speed = float(hostile.get("speed_far", 95.0)) * 0.72
				elif distance > 320.0:
					desired_direction = direction
			"breacher":
				if distance < 110.0:
					desired_direction = direction.rotated(0.22 * strafe_sign)
				desired_speed = float(hostile.get("speed_far", 95.0)) if distance > 140.0 else float(hostile.get("speed_near", 48.0)) * 1.16
		hostile["velocity"] = Vector2(hostile["velocity"]).move_toward(desired_direction * desired_speed, float(hostile.get("accel", 180.0)) * delta)
		hostile["position"] += hostile["velocity"] * delta
		hostile["rotation"] = desired_direction.angle()
		hostile["fire_timer"] = float(hostile["fire_timer"]) - delta

		var fire_range := 330.0
		if hostile_role == "marauder":
			fire_range = 360.0
		elif hostile_role == "breacher":
			fire_range = 250.0
		if distance < fire_range and float(hostile["fire_timer"]) <= 0.0:
			hostile["fire_timer"] = rng.randf_range(float(hostile.get("fire_min", 0.95)), float(hostile.get("fire_max", 1.25)))
			var weapon_type: String = str(hostile.get("weapon_type", "laser"))
			if weapon_type == "missile":
				spawn_hostile_missile(hostile)
			else:
				fire_hostile_laser(hostile)


func should_disable_hostile(hostile: Dictionary, damage: int) -> bool:
	if bool(hostile.get("disabled", false)):
		return false
	var remaining_hull: int = int(hostile["hull"]) - damage
	var critical_hull: int = int(ceil(float(hostile["max_hull"]) * 0.18))
	return remaining_hull <= critical_hull


func spawn_shield_hit_effect(entity_type: String, impact_center: Vector2, impact_source: Vector2, hostile_id: int = -1, radius: float = 16.0, effect_color: Color = Color(0.42, 0.82, 1.0, 1.0)) -> void:
	var hit_direction: Vector2 = (impact_source - impact_center).normalized()
	if hit_direction == Vector2.ZERO:
		hit_direction = Vector2.RIGHT
	shield_hit_effects.append({
		"entity_type": entity_type,
		"hostile_id": hostile_id,
		"angle": hit_direction.angle(),
		"radius": radius,
		"color": effect_color,
		"time_left": 0.36,
		"duration": 0.36,
	})


func update_shield_systems(delta: float) -> void:
	player_shield_recharge_delay = max(player_shield_recharge_delay - delta, 0.0)
	if player_shield_recharge_delay <= 0.0 and player_shield < player_shield_cap():
		player_shield = min(player_shield + player_shield_recharge_rate() * delta, player_shield_cap())
	for hostile in hostile_contacts:
		var hostile_delay: float = max(float(hostile.get("shield_recharge_delay", 0.0)) - delta, 0.0)
		hostile["shield_recharge_delay"] = hostile_delay
		var hostile_shield: float = float(hostile.get("shield", 0.0))
		var hostile_max_shield: float = float(hostile.get("max_shield", 0.0))
		if hostile_delay <= 0.0 and hostile_shield < hostile_max_shield:
			hostile["shield"] = min(hostile_shield + float(hostile.get("shield_recharge_rate", 0.0)) * delta, hostile_max_shield)
	for effect in shield_hit_effects:
		effect["time_left"] = float(effect["time_left"]) - delta
	shield_hit_effects = shield_hit_effects.filter(func(effect: Dictionary) -> bool:
		return float(effect["time_left"]) > 0.0
	)


func disable_hostile(index: int) -> void:
	var hostile: Dictionary = hostile_contacts[index]
	hostile["disabled"] = true
	hostile["boarding_announced"] = false
	hostile["velocity"] = Vector2.ZERO
	hostile["fire_timer"] = 999.0
	hostile["hull"] = max(int(ceil(float(hostile["max_hull"]) * 0.12)), 1)
	hostile_contacts[index] = hostile
	push_telemetry_event("%s crippled. Close in and choose to board or destroy." % hostile_display_name(hostile), "combat")


func try_prompt_boarding(hostile: Dictionary) -> void:
	if not can_board_disabled_hostiles():
		return
	if player.global_position.distance_to(hostile["position"]) > float(hostile.get("radius", 24.0)) + 18.0:
		return
	if pending_boarding_hostile_id == int(hostile["id"]) and boarding_prompt_popup.visible:
		return
	if is_any_overlay_open() and not boarding_prompt_popup.visible:
		return
	for index in range(hostile_contacts.size()):
		if int(hostile_contacts[index]["id"]) != int(hostile["id"]):
			continue
		hostile_contacts[index]["boarding_announced"] = true
		break
	open_hostile_boarding_prompt(hostile)


func resolve_boarding(hostile: Dictionary) -> void:
	var hostile_id: int = int(hostile["id"])
	if str(hostile.get("faction", "")) == "blackwake":
		update_mission_progress("blackwake_kills", 1)

	var hostile_role := str(hostile.get("role", "scout"))
	var scrap_amount := rng.randi_range(2, 5)
	var bonus_tags := 1 if rng.randf() < 0.7 else 0
	var array_amount := 0
	var coil_amount := 0
	var bonus_message := "general salvage"
	match hostile_role:
		"scout":
			scrap_amount = rng.randi_range(2, 4)
			bonus_tags = 1 if rng.randf() < 0.75 else 0
			array_amount = 1 if rng.randf() < 0.22 else 0
			bonus_message = "light scout telemetry"
		"interceptor":
			scrap_amount = rng.randi_range(3, 5)
			bonus_tags = 1 if rng.randf() < 0.8 else 0
			array_amount = 1 if rng.randf() < 0.45 else 0
			bonus_message = "interceptor avionics"
		"marauder":
			scrap_amount = rng.randi_range(4, 7)
			bonus_tags = 1 if rng.randf() < 0.85 else 0
			array_amount = 1 if rng.randf() < 0.4 else 0
			coil_amount = 1 if rng.randf() < 0.58 else 0
			bonus_message = "weapons locker salvage"
		"breacher":
			scrap_amount = rng.randi_range(5, 8)
			bonus_tags = 1 if rng.randf() < 0.9 else 0
			array_amount = 1 if rng.randf() < 0.5 else 0
			coil_amount = 1 if rng.randf() < 0.72 else 0
			bonus_message = "breach charges and heavy cores"
	scrap_amount += int(round(float(scrap_amount) * boarding_loot_bonus()))
	if rng.randf() < boarding_loot_bonus() * 0.35:
		bonus_tags += 1
	cargo[SCRAP] += scrap_amount
	if bonus_tags > 0:
		cargo[BLACKWAKE_TAG] += bonus_tags
	if array_amount > 0:
		cargo[TARGETING_ARRAY] += array_amount
	if coil_amount > 0:
		cargo[PLASMA_COIL] += coil_amount

	award_use_skill_xp("salvage", max(float(scrap_amount) * 0.7, 2.0), true)
	push_telemetry_event("Boarding action complete on %s. Recovery teams secured %s." % [hostile_display_name(hostile), bonus_message], "combat")
	remove_hostile_by_id(hostile_id)
	update_hud()


func get_derelict_by_id(object_id: int):
	if object_id == 0:
		return null
	for child in resource_layer.get_children():
		if not bool(child.is_derelict_ship):
			continue
		if child.get_instance_id() == object_id:
			return child
	return null


func resolve_derelict_boarding(resource_node) -> void:
	if resource_node == null or not bool(resource_node.is_derelict_ship):
		return
	var profile: Dictionary = derelict_profile_by_id(str(resource_node.derelict_profile_id))
	var cache_drops: Array = profile.get("cache_drops", [])
	var secured: Array[String] = []
	var drop_count: int = 1 + int(round(derelict_cache_bonus()))
	for drop_index in range(drop_count):
		if cache_drops.is_empty():
			break
		var total_weight := 0.0
		for drop in cache_drops:
			total_weight += float(drop["weight"])
		var roll := rng.randf() * total_weight
		var selected: Dictionary = cache_drops[0]
		for drop in cache_drops:
			roll -= float(drop["weight"])
			if roll <= 0.0:
				selected = drop
				break
		var item_type: Variant = selected["kind"]
		var amount: int = rng.randi_range(int(selected["amount_min"]), int(selected["amount_max"]))
		cargo[item_type] += amount
		var item_name := str(get_item_definition(item_type)["name"]) if item_data.has(item_type) else str(item_type)
		secured.append("%s x%d" % [item_name, amount])
	var scrap_amount: int = max(rng.randi_range(2, 4) + int(round(float(resource_node.remaining_amount) * 0.4)), 2)
	scrap_amount += int(round(float(scrap_amount) * salvage_yield_bonus()))
	cargo[SCRAP] += scrap_amount
	secured.insert(0, "Scrap x%d" % scrap_amount)
	total_stats["scrap_salvaged"] += scrap_amount
	update_mission_progress("salvage_derelict", scrap_amount)
	update_mission_progress("intro_salvage_scrap", scrap_amount)
	award_use_skill_xp("salvage", max(float(scrap_amount) * 0.9, 2.5), true)
	gain_experience(max(1, int(ceil(scrap_amount * 0.7))))
	push_telemetry_event("Boarding action complete on %s. Recovery teams secured %s." % [str(resource_node.node_name), ", ".join(secured)], "mission")
	resource_node.queue_free()
	update_hud()


func destroy_disabled_hostile(hostile_id: int) -> void:
	for index in range(hostile_contacts.size()):
		var hostile: Dictionary = hostile_contacts[index]
		if int(hostile["id"]) != hostile_id:
			continue
		var hostile_position: Vector2 = hostile["position"]
		var start: Vector2 = player.global_position + Vector2.RIGHT.rotated(player.rotation) * 16.0
		active_laser_beams.push_back({
			"from": start,
			"to": hostile_position,
			"time_left": 0.12,
			"color": Color(1.0, 0.26, 0.26, 0.9),
		})
		play_audio(laser_player, 0.92)
		push_telemetry_event("Execution shot confirmed on %s." % hostile_display_name(hostile), "combat")
		destroy_hostile(index, true)
		return


func remove_hostile_by_id(hostile_id: int) -> void:
	for index in range(hostile_contacts.size()):
		if int(hostile_contacts[index]["id"]) != hostile_id:
			continue
		hostile_contacts.remove_at(index)
		if pending_boarding_hostile_id == hostile_id:
			close_boarding_prompt()
		if hostile_contacts.is_empty():
			lock_target_id = -1
			lock_progress = 0.0
			last_lock_target_id = -1
		return


func update_player_missiles(delta: float) -> void:
	for missile in player_missiles:
		var target_id: int = int(missile["target_id"])
		if target_id != -1:
			var target: Dictionary = get_hostile_by_id(target_id)
			if not target.is_empty():
				var desired_direction: Vector2 = (target["position"] - missile["position"]).normalized()
				var current_velocity: Vector2 = missile["velocity"]
				missile["velocity"] = current_velocity.move_toward(desired_direction * 360.0, 620.0 * delta)
				missile["rotation"] = Vector2(missile["velocity"]).angle()

		missile["position"] += Vector2(missile["velocity"]) * delta
		missile["time_left"] = float(missile["time_left"]) - delta

		var hit_target := get_hostile_hit_by_point(missile["position"], 18.0)
		if not hit_target.is_empty():
			apply_damage_to_hostile(int(hit_target["id"]), player_special_damage(), true, missile["position"])
			missile["time_left"] = 0.0

	player_missiles = player_missiles.filter(func(missile: Dictionary) -> bool:
		return float(missile["time_left"]) > 0.0
	)


func fire_hostile_laser(hostile: Dictionary) -> void:
	var hostile_position: Vector2 = hostile["position"]
	var fire_direction := Vector2.RIGHT.rotated(float(hostile["rotation"]))
	var start: Vector2 = hostile_position + fire_direction * 12.0
	var finish: Vector2 = player.global_position
	hostile_laser_beams.push_back({
		"from": start,
		"to": finish,
		"time_left": 0.08,
		"color": Color(1.0, 0.56, 0.22, 0.88),
	})
	apply_damage_to_player(rng.randi_range(int(hostile.get("damage_min", 3)), int(hostile.get("damage_max", 5))), hostile_position)


func spawn_hostile_missile(hostile: Dictionary) -> void:
	var hostile_position: Vector2 = hostile["position"]
	var fire_direction: Vector2 = (player.global_position - hostile_position).normalized()
	if fire_direction == Vector2.ZERO:
		fire_direction = Vector2.RIGHT.rotated(float(hostile["rotation"]))
	hostile_missiles.push_back({
		"position": hostile_position + fire_direction * 14.0,
		"velocity": fire_direction * 240.0,
		"rotation": fire_direction.angle(),
		"damage": rng.randi_range(int(hostile.get("damage_min", 3)), int(hostile.get("damage_max", 5))),
		"time_left": 3.0,
	})


func update_hostile_missiles(delta: float) -> void:
	for missile in hostile_missiles:
		var desired_direction: Vector2 = (player.global_position - missile["position"]).normalized()
		if desired_direction != Vector2.ZERO:
			var current_velocity: Vector2 = missile["velocity"]
			missile["velocity"] = current_velocity.move_toward(desired_direction * 290.0, 460.0 * delta)
			missile["rotation"] = Vector2(missile["velocity"]).angle()

		missile["position"] += Vector2(missile["velocity"]) * delta
		missile["time_left"] = float(missile["time_left"]) - delta

		if player.global_position.distance_to(missile["position"]) <= 18.0:
			apply_damage_to_player(int(missile.get("damage", 4)), missile["position"])
			spawn_mining_effect(missile["position"], Color(1.0, 0.42, 0.2))
			missile["time_left"] = 0.0

	hostile_missiles = hostile_missiles.filter(func(missile: Dictionary) -> bool:
		return float(missile["time_left"]) > 0.0
	)


func update_laser_beams(delta: float) -> void:
	for beam in active_laser_beams:
		beam["time_left"] = float(beam["time_left"]) - delta
	active_laser_beams = active_laser_beams.filter(func(beam: Dictionary) -> bool:
		return float(beam["time_left"]) > 0.0
	)
	for beam in hostile_laser_beams:
		beam["time_left"] = float(beam["time_left"]) - delta
	hostile_laser_beams = hostile_laser_beams.filter(func(beam: Dictionary) -> bool:
		return float(beam["time_left"]) > 0.0
	)


func update_loot_pickups(delta: float) -> void:
	for drop in loot_pickups:
		drop["position"] += Vector2(0.0, sin(world_fx_time * 2.4 + float(drop["pulse_offset"])) * 4.0 * delta)

	var remaining_drops: Array[Dictionary] = []
	for drop in loot_pickups:
		if player.global_position.distance_to(drop["position"]) > 28.0:
			remaining_drops.append(drop)
			continue

		if str(drop["kind"]) == "credits":
			credits += int(drop["amount"])
			play_audio(pickup_player, 1.0)
			push_telemetry_event("Loot secured: %d credits." % int(drop["amount"]), "combat")
		else:
			var item_type: StringName = drop["kind"]
			var amount: int = min(int(drop["amount"]), int(floor(remaining_cargo_weight() / max(item_weight(item_type), 0.01))))
			if amount > 0:
				cargo[item_type] += amount
				play_audio(pickup_player, 1.0 + rng.randf_range(-0.04, 0.04))
				if item_type == BLACKWAKE_TAG:
					update_mission_progress("bounty_tags", amount)
				push_telemetry_event("Loot recovered: %s x%d." % [get_item_definition(item_type)["name"], amount], "combat")
			else:
				remaining_drops.append(drop)
				continue
		update_hud()

	loot_pickups = remaining_drops


func update_damage_floaters(delta: float) -> void:
	var viewport_transform := get_viewport().get_canvas_transform()
	var survivors: Array[Dictionary] = []
	for floater in damage_floaters:
		var label: Label = floater["label"]
		if not is_instance_valid(label):
			continue
		floater["time_left"] = float(floater["time_left"]) - delta
		floater["world_position"] += Vector2(0.0, -26.0) * delta
		var alpha := clampf(float(floater["time_left"]) / float(floater["duration"]), 0.0, 1.0)
		label.modulate = Color(label.modulate.r, label.modulate.g, label.modulate.b, alpha)
		label.position = viewport_transform * Vector2(floater["world_position"]) + Vector2(-12.0, -10.0)
		if float(floater["time_left"]) > 0.0:
			survivors.append(floater)
		else:
			label.queue_free()
	damage_floaters = survivors


func get_hostile_by_id(hostile_id: int) -> Dictionary:
	for hostile in hostile_contacts:
		if int(hostile["id"]) == hostile_id:
			return hostile
	return {}


func get_hostile_hit_by_point(world_position: Vector2, radius: float) -> Dictionary:
	for hostile in hostile_contacts:
		if bool(hostile.get("disabled", false)):
			continue
		if world_position.distance_to(hostile["position"]) <= radius:
			return hostile
	return {}


func get_nearest_hostile() -> Dictionary:
	var best: Dictionary = {}
	var best_distance := INF
	for hostile in hostile_contacts:
		var distance: float = player.global_position.distance_to(hostile["position"])
		if distance < best_distance:
			best_distance = distance
			best = hostile
	return best


func targeted_hostile() -> Dictionary:
	if lock_target_id != -1:
		var locked_target: Dictionary = get_hostile_by_id(lock_target_id)
		if not locked_target.is_empty():
			return locked_target
	return get_nearest_hostile()


func apply_damage_to_hostile(hostile_id: int, damage: int, explosive: bool, impact_source: Vector2 = Vector2.ZERO) -> void:
	for index in range(hostile_contacts.size()):
		if int(hostile_contacts[index]["id"]) != hostile_id:
			continue
		award_use_skill_xp("combat", max(float(damage) * 0.18, 0.5))
		var hostile: Dictionary = hostile_contacts[index]
		var remaining_damage: int = damage
		var hostile_shield: float = float(hostile.get("shield", 0.0))
		if hostile_shield > 0.0:
			var absorbed: float = min(hostile_shield, float(remaining_damage))
			hostile["shield"] = hostile_shield - absorbed
			hostile["shield_recharge_delay"] = 3.2
			remaining_damage -= int(round(absorbed))
			spawn_shield_hit_effect("hostile", hostile["position"], impact_source, hostile_id, float(hostile.get("radius", 12.0)) + 4.0)
			hostile_contacts[index] = hostile
			play_audio(impact_player, 1.04)
			if remaining_damage <= 0:
				spawn_damage_floater(str(damage), hostile["position"] + Vector2(rng.randf_range(-10.0, 10.0), -18.0), Color(0.56, 0.86, 1.0))
				return
		if should_disable_hostile(hostile_contacts[index], remaining_damage):
			play_audio(impact_player, 0.94)
			player.add_camera_shake(0.1)
			disable_hostile(index)
			return
		hostile_contacts[index]["hull"] = int(hostile_contacts[index]["hull"]) - remaining_damage
		play_audio(impact_player, 1.0 if not explosive else 0.9)
		player.add_camera_shake(0.08 if not explosive else 0.12)
		spawn_damage_floater(str(remaining_damage), hostile_contacts[index]["position"] + Vector2(rng.randf_range(-10.0, 10.0), -18.0), Color(1.0, 0.34, 0.34))
		push_telemetry_event("%s hit for %d damage." % [hostile_display_name(hostile_contacts[index]), remaining_damage], "combat")
		if int(hostile_contacts[index]["hull"]) <= 0:
			destroy_hostile(index, explosive)
		return


func apply_damage_to_player(damage: int, impact_source: Vector2 = Vector2.ZERO) -> void:
	var remaining_damage: int = damage
	if player_shield > 0.0:
		var absorbed: float = min(player_shield, float(remaining_damage))
		player_shield -= absorbed
		player_shield_recharge_delay = 3.2
		remaining_damage -= int(round(absorbed))
		spawn_shield_hit_effect("player", player.global_position, impact_source, -1, player_shield_visual_radius())
		play_audio(impact_player, 1.02)
		player.add_camera_shake(0.16)
		if remaining_damage <= 0:
			spawn_damage_floater(str(damage), player.global_position + Vector2(rng.randf_range(-8.0, 8.0), -24.0), Color(0.56, 0.86, 1.0))
			update_hud()
			return
	player_hull = max(player_hull - remaining_damage, 0)
	play_audio(impact_player, 0.88)
	player.add_camera_shake(0.26)
	spawn_damage_floater(str(remaining_damage), player.global_position + Vector2(rng.randf_range(-8.0, 8.0), -24.0), Color(1.0, 0.68, 0.42))
	push_telemetry_event("Hull impact registered: %d damage." % remaining_damage, "combat")
	if player_hull <= 0:
		player_hull = player_hull_cap()
		player_shield = player_shield_cap()
		docked_at_station = false
		player.force_stop()
		player.global_position = station.global_position + Vector2(0, -240)
		push_telemetry_event("Emergency tow complete. Hull restored at Orbital Dock.", "combat")
	update_hud()


func destroy_hostile(index: int, explosive: bool) -> void:
	var hostile: Dictionary = hostile_contacts[index]
	play_audio(impact_player, 0.82 if explosive else 0.94)
	spawn_mining_effect(hostile["position"], Color(1.0, 0.28, 0.2) if explosive else Color(0.92, 0.34, 0.24))
	push_telemetry_event("%s destroyed." % hostile_display_name(hostile), "combat")
	update_mission_progress("intro_first_combat", 1)
	if str(hostile.get("faction", "")) == "blackwake":
		update_mission_progress("blackwake_kills", 1)
	maybe_spawn_loot(hostile["position"], hostile)
	remove_hostile_by_id(int(hostile["id"]))


func maybe_spawn_loot(world_position: Vector2, hostile: Dictionary = {}) -> void:
	if rng.randf() > 0.72:
		return

	var drop_kind: Variant = SCRAP
	var amount := rng.randi_range(1, 3)
	var color := Color(0.88, 0.68, 0.52, 0.95)
	var loot_roll := rng.randf()
	var hostile_role := str(hostile.get("role", ""))
	if hostile_role == "breacher" and loot_roll < 0.36:
		drop_kind = PLASMA_COIL
		amount = 1
		color = Color(1.0, 0.58, 0.22, 0.95)
	elif hostile_role == "breacher" and loot_roll < 0.58:
		drop_kind = TARGETING_ARRAY
		amount = 1
		color = Color(0.92, 0.48, 0.38, 0.95)
	elif hostile_role == "marauder" and loot_roll < 0.28:
		drop_kind = PLASMA_COIL
		amount = 1
		color = Color(0.98, 0.67, 0.26, 0.95)
	elif loot_roll < 0.18:
		drop_kind = BLACKWAKE_TAG
		amount = 1
		color = Color(0.98, 0.42, 0.42, 0.95)
	elif loot_roll < 0.34:
		drop_kind = TARGETING_ARRAY
		amount = 1
		color = Color(0.92, 0.48, 0.38, 0.95)
	elif loot_roll < 0.56:
		drop_kind = CIRCUIT
		amount = 1
		color = Color(0.66, 0.94, 0.72, 0.95)
	elif loot_roll < 0.74:
		drop_kind = "credits"
		amount = rng.randi_range(12, 24)
		color = Color(1.0, 0.84, 0.42, 0.95)

	loot_pickups.append({
		"position": world_position,
		"kind": drop_kind,
		"amount": amount,
		"pulse_offset": rng.randf_range(0.0, TAU),
		"color": color,
	})


func spawn_damage_floater(text: String, world_position: Vector2, color: Color) -> void:
	var label := Label.new()
	label.text = text
	label.add_theme_font_size_override("font_size", 16)
	label.add_theme_color_override("font_color", color)
	label.mouse_filter = Control.MOUSE_FILTER_IGNORE
	hud_layer.add_child(label)
	damage_floaters.append({
		"label": label,
		"world_position": world_position,
		"time_left": 0.85,
		"duration": 0.85,
	})


func handle_scan_input() -> void:
	if is_any_overlay_open() or combat_mode:
		return

	if not Input.is_action_just_pressed("scan"):
		return

	var scan_target := get_scan_target()
	if scan_target.is_empty():
		return

	push_scan_pulse(scan_target.get("position", get_global_mouse_position()))
	play_audio(scan_player, 1.0)
	push_telemetry_event(scan_target["message"], "system")
	award_scan_data_fragments(scan_target)
	update_mission_progress("intro_target_scan", 1)
	mark_onboarding_step("scan")
	if scan_target.has("mission_scan_key"):
		update_mission_progress(str(scan_target["mission_scan_key"]), 1)
	if scan_target.has("hostile_id"):
		resolve_hostile_scan_effect(int(scan_target["hostile_id"]))


func handle_world_scan_input() -> void:
	if dock_screen.visible or field_console_popup.visible or transfer_popup.visible or dock_prompt_popup.visible:
		scan_input_active = false
		scan_hold_time = 0.0
		scan_popup_opened_from_hold = false
		return
	if scan_cooldown > 0.0:
		scan_cooldown = max(scan_cooldown - get_process_delta_time(), 0.0)

	if Input.is_action_just_pressed("world_scan"):
		scan_input_active = true
		scan_hold_time = 0.0
		scan_popup_opened_from_hold = false
		return

	if scan_input_active and Input.is_action_pressed("world_scan"):
		scan_hold_time += get_process_delta_time()
		if scan_hold_time >= SCAN_HOLD_THRESHOLD and not scan_popup_opened_from_hold and not scan_mode_popup.visible:
			open_scan_mode_popup()
			scan_popup_opened_from_hold = true
		return

	if Input.is_action_just_released("world_scan"):
		var should_quick_scan := scan_input_active and not scan_popup_opened_from_hold and not scan_mode_popup.visible
		scan_input_active = false
		scan_hold_time = 0.0
		scan_popup_opened_from_hold = false
		if should_quick_scan:
			perform_scan(last_scan_mode)


func open_scan_mode_popup() -> void:
	show_scan_mode_root()
	scan_mode_popup.visible = true
	update_mission_progress("intro_world_scan_open", 1)
	hide_tooltip()


func close_scan_mode_popup() -> void:
	scan_mode_popup.visible = false
	scan_mode_view = "root"
	scan_input_active = false
	scan_hold_time = 0.0
	scan_popup_opened_from_hold = false


func choose_scan_mode(mode_name: String) -> void:
	last_scan_mode = mode_name
	close_scan_mode_popup()
	perform_scan(mode_name)


func perform_scan(mode_name: String) -> void:
	if scan_cooldown > 0.0:
		push_telemetry_event("Scanner recharging. %.1fs remaining." % scan_cooldown, "warning")
		return

	last_scan_mode = mode_name
	scan_cooldown = current_scan_cooldown_duration()
	push_scan_pulse(player.global_position)
	play_audio(scan_player, 0.98)

	if mode_name.begins_with("resource:"):
		perform_resource_scan(StringName(mode_name.trim_prefix("resource:")))
		return

	match mode_name:
		"hostiles":
			perform_hostile_scan()
		"derelicts":
			perform_derelict_scan()
		"anomalies", "general":
			perform_anomaly_scan()
		"bounties":
			perform_bounty_scan()
		"resources":
			open_resource_scan_menu()
		_:
			perform_anomaly_scan()


func nearby_resources_in_radius(radius: float) -> Array:
	var found: Array = []
	for child in resource_layer.get_children():
		if player.global_position.distance_to(child.global_position) <= radius:
			found.append(child)
	return found


func nearby_hostiles_in_radius(radius: float) -> Array[Dictionary]:
	var found: Array[Dictionary] = []
	for hostile in hostile_contacts:
		if player.global_position.distance_to(hostile["position"]) <= radius:
			found.append(hostile)
	return found


func nearby_derelict_ships_in_radius(radius: float) -> Array:
	var found: Array = []
	for child in resource_layer.get_children():
		if not bool(child.is_derelict_ship):
			continue
		if player.global_position.distance_to(child.global_position) <= radius:
			found.append(child)
	return found


func nearest_resource_node(nodes: Array):
	var nearest = null
	var best_distance := INF
	for node in nodes:
		var distance: float = player.global_position.distance_to(node.global_position)
		if distance < best_distance:
			best_distance = distance
			nearest = node
	return nearest


func nearest_hostile_contact_from_array(hostiles: Array[Dictionary]) -> Dictionary:
	if hostiles.is_empty():
		return {}
	var nearest: Dictionary = hostiles[0]
	var best_distance: float = player.global_position.distance_to(nearest["position"])
	for hostile in hostiles:
		var distance: float = player.global_position.distance_to(hostile["position"])
		if distance < best_distance:
			best_distance = distance
			nearest = hostile
	return nearest


func is_derelict_contract(mission: Dictionary = current_mission) -> bool:
	return mission.has("mission_derelict_profile")


func mission_derelict_tag(mission: Dictionary = current_mission) -> String:
	if mission.is_empty():
		return ""
	return "mission_derelict_%s" % str(mission.get("id", "contract"))


func derelict_profile_by_id(profile_id: String) -> Dictionary:
	for profile in derelict_profiles:
		if str(profile.get("id", "")) == profile_id:
			return profile
	return derelict_profiles[0] if not derelict_profiles.is_empty() else {}


func random_position_in_map_local(avoid_station: bool = true) -> Vector2:
	var candidate := Vector2.ZERO
	var bounds := current_map_bounds_point()
	for _i in range(40):
		candidate = Vector2(rng.randf_range(-bounds.x, bounds.x), rng.randf_range(-bounds.y, bounds.y))
		if avoid_station and has_station_in_current_map() and candidate.distance_to(station.global_position) < 280.0:
			continue
		return candidate
	return Vector2(rng.randf_range(-bounds.x, bounds.x), rng.randf_range(-bounds.y, bounds.y))


func spawn_derelict_ship(profile: Dictionary, spawn_position: Vector2, force_rare_drop: bool = false, mission_tag: String = ""):
	var resource = RESOURCE_SCENE.instantiate()
	resource.configure({
		"primary_resource": SCRAP,
		"primary_label": get_item_definition(SCRAP)["name"],
		"rare_resource": profile["rare_resource"],
		"rare_label": profile["rare_label"],
		"rare_chance": float(profile["rare_chance"]),
		"node_name": profile["node_name"],
		"scan_description": profile["scan_description"],
		"body_color": Color(0.82, 0.62, 0.48),
		"trait_name": profile["trait_name"],
		"trait_description": profile["trait_description"],
		"amount": rng.randi_range(int(profile["amount_min"]), int(profile["amount_max"])),
		"interval": rng.randf_range(0.84, 1.08),
		"scale_multiplier": rng.randf_range(float(profile["scale_min"]), float(profile["scale_max"])),
		"is_derelict_ship": true,
		"mission_derelict_tag": mission_tag,
		"forced_rare_drop": force_rare_drop,
		"derelict_profile_id": profile["id"],
		"derelict_profile_name": profile["name"],
	})
	resource.position = spawn_position
	resource_layer.add_child(resource)
	return resource


func find_mission_derelict(mission: Dictionary = current_mission):
	var tag: String = mission_derelict_tag(mission)
	if tag.is_empty():
		return null
	for child in resource_layer.get_children():
		if bool(child.is_derelict_ship) and str(child.mission_derelict_tag) == tag:
			return child
	return null


func ensure_active_mission_derelict_spawned() -> void:
	for mission in active_missions:
		if not is_derelict_contract(mission):
			continue
		if mission_needs_turn_in(mission):
			continue
		if not current_map_matches_mission_location(mission):
			continue
		if find_mission_derelict(mission) != null:
			continue
		var profile: Dictionary = derelict_profile_by_id(str(mission.get("mission_derelict_profile", "")))
		if profile.is_empty():
			continue
		var spawn_position: Vector2 = mission.get("mission_derelict_position", random_position_in_map_local(true))
		mission["mission_derelict_position"] = spawn_position
		spawn_derelict_ship(profile, spawn_position, true, mission_derelict_tag(mission))
		push_telemetry_event("%s pinned to scopes %s. Recover the marked component." % [str(profile.get("name", "Derelict")), scan_bearing_text(spawn_position)], "mission")


func hostile_contact_composition(hostiles: Array[Dictionary]) -> String:
	if hostiles.is_empty():
		return "none"
	var counts := {}
	for hostile in hostiles:
		var role := str(hostile.get("role", "contact"))
		counts[role] = int(counts.get(role, 0)) + 1
	var order := ["scout", "interceptor", "marauder", "breacher"]
	var parts: Array[String] = []
	for role in order:
		if not counts.has(role):
			continue
		parts.append("%d %s" % [int(counts[role]), role])
	return ", ".join(parts)


func scan_bearing_text(target_position: Vector2) -> String:
	var to_target: Vector2 = target_position - player.global_position
	return "%s  |  %.0f m" % [direction_label(to_target.angle()), to_target.length()]


func track_scan_contact(label: String, world_position: Vector2, color: Color, hostile_id: int = -1, object_id: int = 0) -> void:
	tracked_scan_contact = {
		"label": label,
		"position": world_position,
		"color": color,
		"hostile_id": hostile_id,
		"object_id": object_id,
	}


func get_tracked_scan_contact_position():
	if tracked_scan_contact.is_empty():
		return null

	var hostile_id: int = int(tracked_scan_contact.get("hostile_id", -1))
	if hostile_id != -1:
		var hostile := get_hostile_by_id(hostile_id)
		if hostile.is_empty():
			tracked_scan_contact = {}
			return null
		tracked_scan_contact["position"] = hostile["position"]
		return hostile["position"]

	var object_id: int = int(tracked_scan_contact.get("object_id", 0))
	if object_id != 0:
		var tracked_object := instance_from_id(object_id)
		if tracked_object == null or not is_instance_valid(tracked_object):
			tracked_scan_contact = {}
			return null
		tracked_scan_contact["position"] = tracked_object.global_position
		return tracked_object.global_position

	return tracked_scan_contact.get("position", null)


func perform_anomaly_scan() -> void:
	var hostiles := nearby_hostiles_in_radius(SCAN_RADIUS)
	var resources := nearby_resources_in_radius(SCAN_RADIUS)
	var derelicts := nearby_derelict_ships_in_radius(SCAN_RADIUS)
	var rare_count := 0
	for node in resources:
		if float(node.rare_chance) >= 0.1:
			rare_count += 1
	push_telemetry_event("Anomaly sweeps are coming soon. Passive returns logged: %d resource fields, %d hostile signatures, %d derelict returns, %d rare echoes." % [resources.size(), hostiles.size(), derelicts.size(), rare_count], "system")
	update_mission_progress("intro_bounty_or_anomaly", 1)


func perform_hostile_scan() -> void:
	var hostiles := nearby_hostiles_in_radius(SCAN_RADIUS)
	if hostiles.is_empty():
		var force_intro_hostiles: bool = first_active_mission_index_matching_ids(["intro_scan_hostiles"]) >= 0
		if force_intro_hostiles or rng.randf() < 0.32:
			var enemy_role := "interceptor" if rng.randf() < 0.65 else "marauder"
			var spawn_offset := Vector2.RIGHT.rotated(rng.randf_range(0.0, TAU)) * rng.randf_range(260.0, 360.0)
			spawn_hostile_contact(player.global_position + spawn_offset, "blackwake", 1, enemy_role)
			var spawned_contact := get_nearest_hostile()
			if not spawned_contact.is_empty():
				track_scan_contact(hostile_display_name(spawned_contact), spawned_contact["position"], Color(1.0, 0.22, 0.22, 0.92), int(spawned_contact["id"]))
			push_telemetry_event("Hostile sweep triggered a return ping. Blackwake %s inbound %s. Guidance locked." % [enemy_role, scan_bearing_text(player.global_position + spawn_offset)], "combat")
			update_mission_progress("scan_hostiles", 1)
			return
		push_telemetry_event("Hostile sweep clean. No active combat signatures in scanner range.", "system")
		return

	var nearest := nearest_hostile_contact_from_array(hostiles)
	push_telemetry_event("Hostile sweep confirmed %d contact%s. Nearest: %s %s." % [
		hostiles.size(),
		"s" if hostiles.size() != 1 else "",
		hostile_display_name(nearest),
		scan_bearing_text(nearest["position"]),
	], "combat")
	push_telemetry_event("Threat composition: %s." % hostile_contact_composition(hostiles), "combat")
	track_scan_contact(hostile_display_name(nearest), nearest["position"], Color(1.0, 0.22, 0.22, 0.92), int(nearest["id"]))
	update_mission_progress("scan_hostiles", 1)


func perform_derelict_scan() -> void:
	var derelicts := nearby_derelict_ships_in_radius(SCAN_RADIUS)
	var force_derelict_scan: bool = first_active_mission_index_matching_ids(["salvage_scrap", "intro_scan_derelicts"]) >= 0
	if derelicts.is_empty() and (force_derelict_scan or rng.randf() < 0.55):
		var spawned_derelict = spawn_derelict_ship_near_player()
		derelicts.append(spawned_derelict)

	if derelicts.is_empty():
		push_telemetry_event("Derelict sweep returned no intact hulks. Only debris scatter detected.", "system")
		return

	var nearest = nearest_resource_node(derelicts)
	var nearest_position: Vector2 = nearest.global_position
	var profile_name := str(nearest.derelict_profile_name) if bool(nearest.is_derelict_ship) else str(nearest.node_name)
	push_telemetry_event("Derelict contact acquired. %s located %s. Salvage profile tagged and guidance locked." % [profile_name, scan_bearing_text(nearest_position)], "system")
	track_scan_contact(str(nearest.node_name), nearest_position, Color(1.0, 0.82, 0.4, 0.92), -1, nearest.get_instance_id())
	update_mission_progress("intro_scan_derelicts", 1)


func perform_resource_scan(resource_filter: StringName = StringName()) -> void:
	var resources := nearby_resources_in_radius(SCAN_RADIUS)
	if resource_filter != StringName():
		var filtered_resources: Array = []
		for node in resources:
			if StringName(node.resource_type) == resource_filter:
				filtered_resources.append(node)
		resources = filtered_resources
	if resources.is_empty():
		var reliability_target = null
		if rng.randf() < surveying_resource_sweep_reliability():
			reliability_target = surveying_reliability_target(resource_filter)
		if reliability_target != null:
			var recovered_label := str(reliability_target.node_name)
			var recovered_position: Vector2 = reliability_target.global_position
			var sweep_label_recovered := "Resource"
			if resource_filter != StringName():
				sweep_label_recovered = resource_scan_mode_title(resource_filter)
			push_telemetry_event("%s sweep returned a weak signal, but survey training recovered a distant contact: %s %s." % [
				sweep_label_recovered,
				recovered_label,
				scan_bearing_text(recovered_position),
			], "system")
			track_scan_contact(recovered_label, recovered_position, Color(0.46, 0.88, 1.0, 0.9), -1, reliability_target.get_instance_id())
			update_mission_progress("scan_resources", 1)
			return
		if resource_filter == StringName():
			push_telemetry_event("Resource sweep returned empty space. No viable extraction fields nearby.", "system")
		else:
			push_telemetry_event("%s sweep returned empty space. No viable extraction fields nearby." % resource_scan_mode_title(resource_filter), "system")
		return

	var rich_name := str(resources[0].node_name)
	var rich_position: Vector2 = resources[0].global_position
	var best_score := -1.0
	var rare_fields := 0
	for node in resources:
		var score := float(node.remaining_amount) + float(node.rare_chance) * 25.0
		if score > best_score:
			best_score = score
			rich_name = str(node.node_name)
			rich_position = node.global_position
		if float(node.rare_chance) >= 0.1:
			rare_fields += 1
	var sweep_label := "Resource"
	if resource_filter != StringName():
		sweep_label = resource_scan_mode_title(resource_filter)
	push_telemetry_event("%s sweep mapped %d fields. Prime target: %s %s. Rare signatures: %d." % [
		sweep_label,
		resources.size(),
		rich_name,
		scan_bearing_text(rich_position),
		rare_fields,
	], "system")
	if rare_fields > 0:
		push_telemetry_event("%s analysis flags elevated rare-yield probability inside the mapped fields." % sweep_label, "system")
	update_mission_progress("scan_resources", 1)
	for node in resources:
		if str(node.node_name) == rich_name and node.global_position == rich_position:
			track_scan_contact(rich_name, rich_position, Color(0.46, 0.88, 1.0, 0.9), -1, node.get_instance_id())
			break


func perform_bounty_scan() -> void:
	var blackwake_contacts: Array[Dictionary] = []
	for hostile in nearby_hostiles_in_radius(SCAN_RADIUS):
		if str(hostile.get("faction", "")) == "blackwake":
			blackwake_contacts.append(hostile)
	var tag_count := total_accessible_item_count(BLACKWAKE_TAG)
	if blackwake_contacts.is_empty():
		push_telemetry_event("Bounty sweep ready. Stored Blackwake tags: %d. No active raider bounty contacts in range." % tag_count, "system")
		return
	var nearest := nearest_hostile_contact_from_array(blackwake_contacts)
	push_telemetry_event("Bounty sweep flags %d Blackwake contact%s. Nearest bounty target: %s %s. Tags on hand: %d." % [
		blackwake_contacts.size(),
		"s" if blackwake_contacts.size() != 1 else "",
		hostile_display_name(nearest),
		scan_bearing_text(nearest["position"]),
		tag_count,
	], "combat")
	push_telemetry_event("Bounty sweep threat mix: %s." % hostile_contact_composition(blackwake_contacts), "combat")
	track_scan_contact("Bounty Target", nearest["position"], Color(1.0, 0.22, 0.22, 0.92), int(nearest["id"]))
	update_mission_progress("intro_bounty_or_anomaly", 1)


func resource_scan_targets() -> Array[StringName]:
	return [ORE, NICKEL, COPPER, TITANIUM, COBALT, SILVER, GOLD, LINDRITE, CRYSTAL, ICE, SCRAP]


func resource_scan_mode_title(resource_type: StringName) -> String:
	if item_data.has(resource_type):
		return str(get_item_definition(resource_type).get("name", String(resource_type))).to_upper()
	return String(resource_type).replace("_", " ").to_upper()


func describe_last_scan_mode() -> String:
	if last_scan_mode.begins_with("resource:"):
		return "%s" % resource_scan_mode_title(StringName(last_scan_mode.trim_prefix("resource:"))).to_lower()
	match last_scan_mode:
		"anomalies", "general":
			return "anomalies"
		"hostiles":
			return "hostiles"
		"derelicts":
			return "derelicts"
		"bounties":
			return "bounty"
		_:
			return last_scan_mode


func build_resource_scan_menu() -> void:
	for child in resource_scan_list.get_children():
		child.queue_free()
	for resource_type in resource_scan_targets():
		var resource_button := Button.new()
		resource_button.custom_minimum_size = Vector2(0, 38)
		resource_button.text = resource_scan_mode_title(resource_type)
		style_button_secondary(resource_button)
		attach_button_audio(resource_button)
		resource_button.pressed.connect(func(target_type := resource_type) -> void:
			choose_scan_mode("resource:%s" % String(target_type))
		)
		resource_scan_list.add_child(resource_button)


func show_scan_mode_root() -> void:
	scan_mode_view = "root"
	scan_mode_title.text = "SCAN MODE"
	scan_mode_info.text = "Select a world scan profile. Last quick scan: %s." % describe_last_scan_mode()
	resource_scan_scroll.visible = false
	resource_scan_back_button.visible = false
	general_scan_button.visible = true
	hostile_scan_button.visible = true
	derelict_scan_button.visible = true
	resource_scan_button.visible = true
	bounty_scan_button.visible = true


func open_resource_scan_menu() -> void:
	scan_mode_view = "resources"
	scan_mode_title.text = "RESOURCE SWEEP"
	scan_mode_info.text = "Select a resource type to direct the mission vector toward matching fields."
	resource_scan_scroll.visible = true
	resource_scan_back_button.visible = true
	general_scan_button.visible = false
	hostile_scan_button.visible = false
	derelict_scan_button.visible = false
	resource_scan_button.visible = false
	bounty_scan_button.visible = false
	scan_mode_popup.visible = true
	hide_tooltip()


func reorder_scan_mode_buttons() -> void:
	var scan_mode_vbox: VBoxContainer = scan_mode_title.get_parent()
	scan_mode_vbox.move_child(scan_mode_title, 0)
	scan_mode_vbox.move_child(scan_mode_info, 1)
	scan_mode_vbox.move_child(resource_scan_scroll, 2)
	scan_mode_vbox.move_child(resource_scan_button, 3)
	scan_mode_vbox.move_child(hostile_scan_button, 4)
	scan_mode_vbox.move_child(derelict_scan_button, 5)
	scan_mode_vbox.move_child(bounty_scan_button, 6)
	scan_mode_vbox.move_child(general_scan_button, 7)
	scan_mode_vbox.move_child(resource_scan_back_button, 8)
	scan_mode_vbox.move_child(close_scan_mode_button, 9)


func pick_derelict_profile() -> Dictionary:
	return derelict_profiles[rng.randi_range(0, derelict_profiles.size() - 1)]


func spawn_loot_drop(world_position: Vector2, kind: Variant, amount: int, color: Color) -> void:
	loot_pickups.append({
		"position": world_position,
		"kind": kind,
		"amount": amount,
		"pulse_offset": rng.randf_range(0.0, TAU),
		"color": color,
	})


func drop_color_for_item(item_type: Variant) -> Color:
	if str(item_type) == "credits":
		return Color(1.0, 0.84, 0.42, 0.95)
	if item_data.has(item_type):
		return Color(get_item_definition(item_type)["fill"])
	return Color(0.88, 0.68, 0.52, 0.95)


func spawn_derelict_cache_loot(resource_node) -> void:
	if not bool(resource_node.is_derelict_ship) or bool(resource_node.derelict_cache_opened):
		return

	resource_node.derelict_cache_opened = true
	var profile_id := str(resource_node.derelict_profile_id)
	var profile: Dictionary = {}
	for candidate in derelict_profiles:
		if str(candidate["id"]) == profile_id:
			profile = candidate
			break
	if profile.is_empty():
		return

	var drop_count: int = (1 if rng.randf() < 0.5 else 2) + int(round(derelict_cache_bonus()))
	var cache_drops: Array = profile.get("cache_drops", [])
	var secured: Array[String] = []
	for drop_index in range(drop_count):
		if cache_drops.is_empty():
			break
		var total_weight := 0.0
		for drop in cache_drops:
			total_weight += float(drop["weight"])
		var roll := rng.randf() * total_weight
		var selected: Dictionary = cache_drops[0]
		for drop in cache_drops:
			roll -= float(drop["weight"])
			if roll <= 0.0:
				selected = drop
				break
		var item_type: Variant = selected["kind"]
		var amount: int = rng.randi_range(int(selected["amount_min"]), int(selected["amount_max"]))
		var scatter := Vector2.RIGHT.rotated(rng.randf_range(0.0, TAU)) * rng.randf_range(8.0, 24.0 + 10.0 * drop_index)
		spawn_loot_drop(resource_node.global_position + scatter, item_type, amount, drop_color_for_item(item_type))
		var item_name := str(get_item_definition(item_type)["name"]) if item_data.has(item_type) else str(item_type)
		secured.append("%s x%d" % [item_name, amount])

	if not secured.is_empty():
		push_telemetry_event("%s cache ruptured. Loose salvage detected: %s." % [str(resource_node.node_name), ", ".join(secured)], "mission")


func handle_derelict_salvage_progress(resource_node, harvest: Dictionary) -> void:
	if not bool(resource_node.is_derelict_ship):
		return

	var remaining_ratio: float = float(resource_node.remaining_amount) / max(float(resource_node.max_amount), 1.0)
	if int(resource_node.salvage_phase) < 1 and remaining_ratio <= 0.68:
		resource_node.salvage_phase = 1
		push_telemetry_event("%s outer plating stripped. Interior lockers exposed." % str(resource_node.node_name), "mission")
	elif int(resource_node.salvage_phase) < 2 and remaining_ratio <= 0.32:
		resource_node.salvage_phase = 2
		push_telemetry_event("%s core breach confirmed. Priority salvage signatures rising." % str(resource_node.node_name), "mission")

	if bool(harvest.get("depleted", false)):
		spawn_derelict_cache_loot(resource_node)


func spawn_derelict_ship_near_player():
	var profile: Dictionary = pick_derelict_profile()
	var candidate := random_position_in_current_map(520.0, true)
	var resource = spawn_derelict_ship(profile, candidate, false, "")
	spawn_mining_effect(candidate, Color(1.0, 0.82, 0.42))
	push_telemetry_event("%s dropped onto scopes %s. Visual marker active." % [str(profile["name"]), scan_bearing_text(candidate)], "system")
	return resource


func get_scan_target() -> Dictionary:
	var mouse_pos := get_global_mouse_position()
	var best_distance := 64.0
	var result := {}

	if is_solar_map() and sun_root.visible and mouse_pos.distance_to(sun_root.global_position) < 180.0:
		var star_type_name: String = str(current_system_data.get("star_type", "Primary star"))
		result = {
			"position": sun_root.global_position,
			"data_fragment_key": "sun:%s:%s" % [current_system_id, map_key(current_map_coord)],
			"data_fragment_cooldown_key": "sun:%s:%s" % [current_system_id, map_key(current_map_coord)],
			"data_fragment_cooldown": SCAN_DATA_MAJOR_OBJECT_COOLDOWN,
			"data_fragment_label": "%s stellar body" % star_type_name,
			"data_fragment_amount": 10,
			"message": "Scan: %s primary stellar body. Plasma turbulence, corona shear, and extreme radiant output recorded." % star_type_name,
		}
		best_distance = mouse_pos.distance_to(sun_root.global_position)

	for hostile in hostile_contacts:
		var hostile_distance := mouse_pos.distance_to(hostile["position"])
		if hostile_distance < best_distance:
			var hostile_role: String = str(hostile.get("role", "contact")).capitalize()
			best_distance = hostile_distance
			result = {
				"position": hostile["position"],
				"hostile_id": int(hostile["id"]),
				"mission_scan_key": "scan_hostiles",
				"data_fragment_key": "hostile:%s:%s" % [str(hostile.get("faction", "")), str(hostile.get("role", ""))],
				"data_fragment_cooldown_key": "hostile:%s:%s" % [str(hostile.get("faction", "")), str(hostile.get("role", ""))],
				"data_fragment_cooldown": SCAN_DATA_HOSTILE_COOLDOWN,
				"data_fragment_label": "%s signatures" % hostile_display_name(hostile),
				"data_fragment_amount": 12,
				"message": "Scan: %s [%s]. Hull %d / %d. Threat pattern unstable." % [
					hostile_display_name(hostile),
					hostile_role,
					int(hostile["hull"]),
					int(hostile["max_hull"]),
				],
			}

	if has_station_in_current_map() and mouse_pos.distance_to(station.global_position) < 96.0:
		result = {
			"position": station.global_position,
			"data_fragment_key": "station:%s:%s" % [current_system_id, map_key(current_map_coord)],
			"data_fragment_cooldown_key": "station:%s:%s" % [current_system_id, map_key(current_map_coord)],
			"data_fragment_cooldown": SCAN_DATA_MAJOR_OBJECT_COOLDOWN,
			"data_fragment_label": current_station_name(),
			"data_fragment_amount": 6,
			"message": "Scan: %s [%s]. Exchange, storage, refinery, and refit services online." % [current_station_name(), faction_name(current_station_faction())],
		}
		best_distance = mouse_pos.distance_to(station.global_position)

	for child in resource_layer.get_children():
		var distance := mouse_pos.distance_to(child.global_position)
		if distance < best_distance:
			best_distance = distance
			var salvage_suffix := ""
			if bool(child.is_derelict_ship):
				salvage_suffix = " Profile %s  |  Salvage phase %d." % [str(child.derelict_profile_name), int(child.salvage_phase)]
			var rare_text := "none"
			if str(child.rare_label) != "":
				rare_text = "%s %.0f%%" % [child.rare_label, child.rare_chance * 100.0]
			var extraction_text := ""
			if int(child.required_mining_stage) > 0:
				extraction_text = " %s required." % extraction_stage_name(int(child.required_mining_stage))
			result = {
				"position": child.global_position,
				"mission_scan_key": "scan_resources",
				"data_fragment_key": research_scan_key_for_resource(child),
				"data_fragment_cooldown_key": research_scan_key_for_resource(child),
				"data_fragment_cooldown": SCAN_DATA_RESOURCE_COOLDOWN,
				"data_fragment_label": str(child.resource_label),
				"data_fragment_amount": research_df_value_for_resource(child),
				"message": "Scan: %s [%s]. Yield %s, rare %s. Remaining %d / %d. %s %s%s" % [
					child.node_name,
					child.trait_name,
					child.resource_label,
					rare_text,
					child.remaining_amount,
					child.max_amount,
					child.trait_description,
					"%s%s" % [child.scan_description, salvage_suffix],
					extraction_text,
				],
			}

	return result


func research_scan_key_for_resource(resource_node) -> String:
	if bool(resource_node.is_derelict_ship):
		return "derelict:%s" % str(resource_node.derelict_profile_name)
	return "resource:%s" % str(resource_node.resource_type)


func research_df_value_for_resource(resource_node) -> int:
	if bool(resource_node.is_derelict_ship):
		return 16
	match StringName(resource_node.resource_type):
		CRYSTAL:
			return 8
		ICE:
			return 5
		SCRAP:
			return 6
		ORE, NICKEL, COPPER, TITANIUM, COBALT, SILVER, GOLD, LINDRITE:
			return 7
		_:
			return 5


func award_scan_data_fragments(scan_target: Dictionary) -> void:
	var claim_key: String = str(scan_target.get("data_fragment_key", ""))
	if claim_key.is_empty():
		return
	var cooldown_key: String = str(scan_target.get("data_fragment_cooldown_key", claim_key))
	var cooldown_seconds: float = float(scan_target.get("data_fragment_cooldown", SCAN_DATA_RESOURCE_COOLDOWN))
	var target_label: String = str(scan_target.get("data_fragment_label", "this signature class"))
	var now_seconds: float = float(Time.get_ticks_msec()) / 1000.0
	var cooldown_until: float = float(scan_data_cooldowns.get(cooldown_key, 0.0))
	if cooldown_until > now_seconds:
		push_telemetry_event("Targeted scan logged. %s data relay cooling before new fragments can be recovered." % target_label, "system")
		return
	var base_fragment_amount: int = int(scan_target.get("data_fragment_amount", 0))
	if base_fragment_amount <= 0:
		return
	var scan_count: int = int(claimed_scan_data.get(claim_key, 0))
	var fragment_amount: int = max(base_fragment_amount + 3 - scan_count, 1)
	var data_multiplier: float = 1.0 + research_effect_total("research_scan_data_bonus") + research_effect_total("research_uplink_suite") + surveying_df_bonus()
	if claim_key.begins_with("derelict:"):
		data_multiplier += research_effect_total("research_derelict_scan_bonus")
	if claim_key.begins_with("station:") or claim_key.begins_with("sun:"):
		data_multiplier += research_effect_total("research_scan_rare_bonus")
	fragment_amount = max(int(round(float(fragment_amount) * data_multiplier)), 1)
	var previous_units: int = int(floor(float(data_fragments) / 100.0))
	data_fragments += fragment_amount
	claimed_scan_data[claim_key] = scan_count + 1
	scan_data_cooldowns[cooldown_key] = now_seconds + cooldown_seconds
	push_telemetry_event("Targeted scan logged. +%d DF added from %s." % [fragment_amount, target_label], "system")
	var current_units_ready: int = int(floor(float(data_fragments) / 100.0))
	if current_units_ready > previous_units:
		last_status_message = "Research canister filled. Dock and upload scan data at the Research bay."
		push_telemetry_event("Research canister ready. Return to station and upload scan data.", "mission")
	award_use_skill_xp("surveying", max(float(fragment_amount) * 0.35, 1.0))


func resolve_hostile_scan_effect(hostile_id: int) -> void:
	for index in range(hostile_contacts.size()):
		if int(hostile_contacts[index]["id"]) != hostile_id:
			continue
		if bool(hostile_contacts[index].get("scan_alert_triggered", false)):
			return
		hostile_contacts[index]["scan_alert_triggered"] = true
		if rng.randf() >= 0.28:
			return
		var source_position: Vector2 = hostile_contacts[index]["position"]
		var role := "interceptor" if rng.randf() < 0.6 else "marauder"
		var spawn_offset := Vector2.RIGHT.rotated(rng.randf_range(0.0, TAU)) * rng.randf_range(120.0, 180.0)
		spawn_hostile_contact(source_position + spawn_offset, "blackwake", 1, role)
		push_telemetry_event("Hostile scan spike detected. Blackwake %s response inbound." % role, "combat")
		return


func handle_popup_input() -> void:
	if pause_popup.visible:
		if Input.is_action_just_pressed("ui_cancel"):
			close_pause_menu()
			hide_tooltip()
		return

	var blocking_overlay_open := transfer_popup.visible or dock_prompt_popup.visible or boarding_prompt_popup.visible or scan_mode_popup.visible

	if Input.is_action_just_pressed("toggle_missions") and not blocking_overlay_open:
		toggle_mission_popup()

	if Input.is_action_just_pressed("toggle_inventory") and not blocking_overlay_open:
		toggle_inventory_popup()

	if Input.is_action_just_pressed("toggle_map") and not blocking_overlay_open:
		toggle_tactical_map()

	var tab_pressed: bool = Input.is_physical_key_pressed(KEY_TAB)
	if tab_pressed and not tab_console_held and not blocking_overlay_open and not dock_screen.visible:
		if field_console_popup.visible:
			close_field_console()
		else:
			open_field_console("pilot")
	tab_console_held = tab_pressed

	if Input.is_action_just_pressed("ui_cancel"):
		if transfer_popup.visible:
			close_transfer_popup()
		elif guided_mission_popup.visible:
			close_guided_mission_popup()
		elif dock_prompt_popup.visible:
			decline_docking_prompt()
		elif boarding_prompt_popup.visible:
			close_boarding_prompt()
		elif scan_mode_popup.visible:
			close_scan_mode_popup()
		elif field_console_popup.visible:
			close_field_console()
		elif options_popup.visible:
			close_options_popup()
		elif dock_screen.visible and current_dock_room != "":
			show_station_main_menu()
		else:
			toggle_pause_menu()
		hide_tooltip()


func update_pause_menu_status() -> void:
	pause_status.text = "Pilot Level %d  |  %d CR\n%s / %s  |  %s" % [
		level,
		credits,
		current_system_name(),
		current_map_name(),
		"Docked" if docked_at_station else "In flight",
	]
	load_button.disabled = not save_manager().has_save_file()


func toggle_pause_menu() -> void:
	if pause_popup.visible:
		close_pause_menu()
		return
	pause_popup.visible = true
	hide_tooltip()
	update_pause_menu_status()


func close_pause_menu() -> void:
	pause_popup.visible = false
	update_hud()


func open_options_popup() -> void:
	refresh_options_from_settings()
	options_popup.visible = true
	pause_popup.visible = false
	hide_tooltip()
	update_hud()


func close_options_popup() -> void:
	options_popup.visible = false
	pause_popup.visible = true
	update_pause_menu_status()
	update_hud()


func set_options_tab(tab_id: String) -> void:
	active_options_tab = tab_id
	options_visuals_section.visible = tab_id == "visuals"
	options_audio_section.visible = tab_id == "audio"
	options_gameplay_section.visible = tab_id == "gameplay"


func refresh_options_from_settings() -> void:
	options_fullscreen_check.button_pressed = bool(settings_manager().get_value("visuals", "fullscreen"))
	options_vsync_check.button_pressed = bool(settings_manager().get_value("visuals", "vsync"))
	options_show_fps_check.button_pressed = bool(settings_manager().get_value("visuals", "show_fps"))
	options_camera_zoom_slider.value = float(settings_manager().get_value("visuals", "camera_zoom"))
	options_brightness_slider.value = float(settings_manager().get_value("visuals", "brightness"))
	options_screen_shake_slider.value = float(settings_manager().get_value("visuals", "screen_shake"))
	options_parallax_strength_slider.value = float(settings_manager().get_value("visuals", "parallax_strength"))
	options_glow_strength_slider.value = float(settings_manager().get_value("visuals", "glow_strength"))
	options_master_volume_slider.value = float(settings_manager().get_value("audio", "master"))
	options_music_volume_slider.value = float(settings_manager().get_value("audio", "music"))
	options_sfx_volume_slider.value = float(settings_manager().get_value("audio", "sfx"))
	options_ui_volume_slider.value = float(settings_manager().get_value("audio", "ui"))
	options_engine_volume_slider.value = float(settings_manager().get_value("audio", "engine"))
	options_onboarding_check.button_pressed = bool(settings_manager().get_value("gameplay", "show_onboarding"))
	options_onboarding_check.disabled = not onboarding_can_be_reenabled()
	options_onboarding_check.tooltip_text = "Introduction missions already completed for this save." if options_onboarding_check.disabled else ""
	options_docking_prompt_check.button_pressed = bool(settings_manager().get_value("gameplay", "docking_prompt"))
	set_options_tab(active_options_tab)
	refresh_options_labels()


func refresh_options_labels() -> void:
	options_camera_zoom_label.text = "Camera Zoom  |  %.2f" % options_camera_zoom_slider.value
	options_brightness_label.text = "Brightness  |  %d%%" % int(round(options_brightness_slider.value * 100.0))
	options_screen_shake_label.text = "Screen Shake  |  %d%%" % int(round(options_screen_shake_slider.value * 100.0))
	options_parallax_strength_label.text = "Parallax Strength  |  %d%%" % int(round(options_parallax_strength_slider.value * 100.0))
	options_glow_strength_label.text = "Glow Strength  |  %d%%" % int(round(options_glow_strength_slider.value * 100.0))
	options_master_volume_label.text = "Master Volume  |  %d%%" % int(round(options_master_volume_slider.value * 100.0))
	options_music_volume_label.text = "Music Volume  |  %d%%" % int(round(options_music_volume_slider.value * 100.0))
	options_sfx_volume_label.text = "SFX Volume  |  %d%%" % int(round(options_sfx_volume_slider.value * 100.0))
	options_ui_volume_label.text = "UI Volume  |  %d%%" % int(round(options_ui_volume_slider.value * 100.0))
	options_engine_volume_label.text = "Engine Volume  |  %d%%" % int(round(options_engine_volume_slider.value * 100.0))
	options_camera_zoom_label.queue_redraw()
	options_brightness_label.queue_redraw()
	options_screen_shake_label.queue_redraw()
	options_parallax_strength_label.queue_redraw()
	options_glow_strength_label.queue_redraw()
	options_master_volume_label.queue_redraw()
	options_music_volume_label.queue_redraw()
	options_sfx_volume_label.queue_redraw()
	options_ui_volume_label.queue_redraw()
	options_engine_volume_label.queue_redraw()


func save_game_to_slot() -> void:
	var save_ok: bool = save_manager().save_game_data(build_save_data())
	if save_ok:
		last_status_message = "Save complete."
		pause_status.text = "Flight state saved to local storage.\n%s / %s" % [current_system_name(), current_map_name()]
		load_button.disabled = false
		push_telemetry_event("Command state archived.", "system")
	else:
		last_status_message = "Save failed."
		pause_status.text = "Unable to write save data."
	update_hud()


func load_game_from_slot() -> void:
	var save_data: Dictionary = save_manager().load_game_data()
	if save_data.is_empty():
		last_status_message = "No save data found."
		pause_status.text = "No archived flight state was found."
		load_button.disabled = true
		update_hud()
		return
	apply_save_data(save_data)
	last_status_message = "Save loaded."
	push_telemetry_event("Archived command state restored.", "system")
	update_hud()


func return_to_startup_menu() -> void:
	save_manager().clear_pending_load()
	get_tree().change_scene_to_file("res://scenes/startup.tscn")


func restore_dock_after_popup() -> void:
	if return_to_dock_on_popup_close and is_station_in_range():
		dock_screen.visible = true
		show_station_main_menu()

	return_to_dock_on_popup_close = false


func apply_field_console_tab_styles() -> void:
	for button in [field_mission_tab_button, field_cargo_tab_button, field_map_tab_button, field_pilot_tab_button, field_skills_tab_button]:
		style_button_secondary(button)
	var active_button: Button = field_mission_tab_button
	match field_console_tab:
		"cargo":
			active_button = field_cargo_tab_button
		"map":
			active_button = field_map_tab_button
		"pilot":
			active_button = field_pilot_tab_button
		"skills":
			active_button = field_skills_tab_button
	active_button.add_theme_stylebox_override("normal", make_panel_style(Color(0.18, 0.24, 0.31, 0.98), Color(0.98, 0.8, 0.42, 0.48), 14, 2))
	active_button.add_theme_stylebox_override("hover", make_panel_style(Color(0.2, 0.27, 0.35, 0.98), Color(1.0, 0.84, 0.5, 0.6), 14, 2))
	active_button.add_theme_stylebox_override("pressed", make_panel_style(Color(0.15, 0.21, 0.27, 0.98), Color(0.98, 0.76, 0.36, 0.62), 14, 2))


func refresh_field_console() -> void:
	field_console_title.text = "FIELD CONSOLE  |  %s" % field_console_tab.to_upper()
	field_mission_panel.visible = field_console_tab == "mission"
	field_cargo_panel.visible = field_console_tab == "cargo"
	field_map_panel.visible = field_console_tab == "map"
	field_pilot_panel.visible = field_console_tab == "pilot"
	field_skills_panel.visible = field_console_tab == "skills"
	if field_console_tab == "cargo":
		refresh_inventory_popup()
	elif field_console_tab == "map":
		refresh_tactical_map()
	elif field_console_tab == "pilot":
		field_pilot_summary.text = build_pilot_summary_text()
		field_pilot_detail.text = build_pilot_detail_text()
	elif field_console_tab == "skills":
		refresh_field_skills_panel()
	apply_field_console_tab_styles()


func set_field_console_tab(tab_name: String) -> void:
	field_console_tab = tab_name
	if not intro_tab_visits.has(tab_name):
		intro_tab_visits[tab_name] = true
		update_mission_progress("intro_tab_menu", 1)
	if tab_name == "cargo":
		update_mission_progress("intro_open_cargo", 1)
	elif tab_name == "map":
		update_mission_progress("intro_open_map", 1)
	elif tab_name == "skills":
		update_mission_progress("intro_open_skills", 1)
	if field_console_popup.visible:
		refresh_field_console()


func open_field_console(tab_name: String) -> void:
	set_field_console_tab(tab_name)
	field_console_popup.visible = true
	if field_console_popup.get_parent() != null:
		field_console_popup.get_parent().move_child(field_console_popup, -1)
	mission_popup.visible = false
	inventory_popup.visible = false
	tactical_map_popup.visible = false
	hide_tooltip()
	refresh_field_console()
	refresh_onboarding_panel()


func close_field_console() -> void:
	field_console_popup.visible = false
	hide_tooltip()
	restore_dock_after_popup()
	refresh_onboarding_panel()


func toggle_tactical_map() -> void:
	if dock_screen.visible:
		return
	if field_console_popup.visible and field_console_tab == "map":
		close_field_console()
	else:
		open_field_console("map")


func close_tactical_map() -> void:
	close_field_console()


func mission_target_map_coord(mission: Dictionary = current_mission) -> Variant:
	if mission.is_empty():
		return null
	return mission.get("target_map_coord", null)


func mission_target_system_id(mission: Dictionary = current_mission) -> String:
	if mission.is_empty():
		return ""
	return str(mission.get("target_system_id", current_system_id))


func current_map_matches_mission_location(mission: Dictionary = current_mission) -> bool:
	if mission.is_empty():
		return true
	if mission_target_system_id(mission) != current_system_id:
		return false
	var target_coord = mission_target_map_coord(mission)
	if target_coord == null:
		return true
	return Vector2i(target_coord) == current_map_coord


func pick_mission_target_map(mission: Dictionary) -> Vector2i:
	var mission_id := str(mission.get("id", ""))
	var mission_delivery_item: StringName = mission.get("deliver_item", StringName())
	var preferred := current_map_coord
	if ["sell_value", "trade_circuit", "refine_goods", "buy_upgrade", "fuel_exchange", "bulk_alloy_order"].has(mission_id):
		return current_map_coord
	var candidates: Array[Vector2i] = [current_map_coord]
	for offset in [Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1), Vector2i(0, -1)]:
		var candidate: Vector2i = current_map_coord + offset
		if candidate.x < 0 or candidate.y < 0 or candidate.x >= SYSTEM_GRID_SIZE or candidate.y >= SYSTEM_GRID_SIZE:
			continue
		candidates.append(candidate)
	if ["contested_recovery", "derelict_quarantine", "sealed_cache"].has(mission_id):
		var salvage_candidates: Array[Vector2i] = []
		for candidate in candidates:
			var map_data: Dictionary = current_system_data.get("maps", {}).get(map_key(candidate), {})
			if str(map_data.get("control_state", "")) == "salvage_zone":
				salvage_candidates.append(candidate)
		if not salvage_candidates.is_empty():
			return salvage_candidates[rng.randi_range(0, salvage_candidates.size() - 1)]
	if ["blackwake_kills", "blackwake_hunt", "breacher_breakup", "hostile_probe", "bounty_tags"].has(mission_id):
		var danger_pick := current_map_coord
		var best_danger := -1.0
		for candidate in candidates:
			var map_data: Dictionary = current_system_data.get("maps", {}).get(map_key(candidate), {})
			var danger := float(map_data.get("danger_level", 0.0))
			if danger > best_danger:
				best_danger = danger
				danger_pick = candidate
		return danger_pick
	if is_metallic_ore(mission_delivery_item) or ["iridium_charter"].has(mission_id):
		for candidate in candidates:
			var map_data: Dictionary = current_system_data.get("maps", {}).get(map_key(candidate), {})
			if str(map_data.get("resource_profile", "")) == "foundry":
				return candidate
	if ["survey_sweep", "deep_vector_survey", "mine_crystal", "intro_scan_resources"].has(mission_id):
		var survey_candidates: Array[Vector2i] = []
		for candidate in candidates:
			var map_data: Dictionary = current_system_data.get("maps", {}).get(map_key(candidate), {})
			if bool(map_data.get("is_solar_map", false)):
				continue
			if int(map_data.get("resource_target", 0)) <= 0 or float(map_data.get("resource_bias", 0.0)) <= 0.0:
				continue
			if str(map_data.get("label", "")).findn("Survey") != -1:
				survey_candidates.append(candidate)
		if not survey_candidates.is_empty():
			return survey_candidates[rng.randi_range(0, survey_candidates.size() - 1)]
		var resource_candidates: Array[Vector2i] = []
		for candidate in candidates:
			var map_data: Dictionary = current_system_data.get("maps", {}).get(map_key(candidate), {})
			if bool(map_data.get("is_solar_map", false)):
				continue
			if int(map_data.get("resource_target", 0)) <= 0 or float(map_data.get("resource_bias", 0.0)) <= 0.0:
				continue
			resource_candidates.append(candidate)
		if not resource_candidates.is_empty():
			return resource_candidates[rng.randi_range(0, resource_candidates.size() - 1)]
	if ["salvage_scrap", "priority_recovery"].has(mission_id):
		for candidate in candidates:
			var map_data: Dictionary = current_system_data.get("maps", {}).get(map_key(candidate), {})
			if str(map_data.get("control_state", "")) == "salvage_zone":
				return candidate
	if candidates.size() > 1 and rng.randf() < 0.55:
		return candidates[rng.randi_range(1, candidates.size() - 1)]
	return preferred


func mission_grid_distance(coord_a: Vector2i, coord_b: Vector2i) -> int:
	return absi(coord_a.x - coord_b.x) + absi(coord_a.y - coord_b.y)


func mission_map_label(mission: Dictionary) -> String:
	var target_coord = mission_target_map_coord(mission)
	if target_coord == null:
		return current_map_name()
	var target_map: Dictionary = current_system_data.get("maps", {}).get(map_key(Vector2i(target_coord)), {})
	if target_map.is_empty():
		return "Unknown map"
	return str(target_map.get("label", "Unknown map"))


func map_jump_cost(target_coord: Vector2i) -> float:
	return (MAP_JUMP_BASE_FUEL_COST + float(mission_grid_distance(current_map_coord, target_coord)) * MAP_JUMP_FUEL_PER_STEP) * max(1.0 - map_jump_cost_reduction(), 0.4)


func can_map_jump_to(target_coord: Vector2i) -> Dictionary:
	if target_coord == current_map_coord:
		return {"ok": false, "reason": "Current position"}
	if not is_map_discovered(current_system_id, target_coord):
		return {"ok": false, "reason": "Undiscovered map"}
	if docked_at_station or docking_pull_in_progress:
		return {"ok": false, "reason": "Unavailable while docked"}
	if combat_mode or not hostile_contacts.is_empty():
		return {"ok": false, "reason": "Clear hostiles first"}
	if map_jump_cooldown > 0.0:
		return {"ok": false, "reason": "Jump coil recharging"}
	var fuel_cost := map_jump_cost(target_coord)
	if current_fuel < fuel_cost:
		return {"ok": false, "reason": "Need %.0f fuel" % fuel_cost}
	return {"ok": true, "reason": "Jump cost %.0f fuel" % fuel_cost}


func jump_to_map(target_coord: Vector2i) -> void:
	var check := can_map_jump_to(target_coord)
	if not bool(check.get("ok", false)):
		last_status_message = str(check.get("reason", "Jump unavailable"))
		field_map_status.text = last_status_message
		update_hud()
		return
	var fuel_cost := map_jump_cost(target_coord)
	current_fuel = max(current_fuel - fuel_cost, 0.0)
	map_jump_cooldown = MAP_JUMP_COOLDOWN
	player.force_stop()
	close_tactical_map()
	award_use_skill_xp("piloting", 2.0, true)
	push_scan_pulse(player.global_position)
	push_telemetry_event("Short-range jump executed to %s. Fuel cost %.0f." % [str(current_system_data.get("maps", {}).get(map_key(target_coord), {}).get("label", "Unknown map")), fuel_cost], "system")
	transition_to_map(target_coord, Vector2.ZERO)


func build_tactical_cell_text(map_data: Dictionary, discovered: bool, is_current: bool, is_mission_target: bool) -> String:
	if not discovered:
		return "UNKNOWN"
	var lines: Array[String] = [str(map_data.get("label", "Map"))]
	if bool(map_data.get("is_solar_map", false)):
		lines.append("SUN")
	elif bool(map_data.get("has_station", false)):
		lines.append("STATION")
	elif str(map_data.get("control_state", "")) == "salvage_zone":
		lines.append("SALVAGE")
	else:
		lines.append(str(map_data.get("control_state", "neutral")).to_upper())
	if is_current:
		lines.append("YOU")
	elif is_mission_target:
		lines.append("MISSION")
	return "\n".join(lines)


func tactical_map_default_status_text() -> String:
	var mission_coord_variant = mission_target_map_coord()
	var mission_coord := Vector2i(-1, -1)
	if mission_coord_variant != null and mission_target_system_id() == current_system_id:
		mission_coord = Vector2i(mission_coord_variant)
	var status_text := "Current map highlighted in green. "
	if mission_coord != Vector2i(-1, -1) and mission_target_system_id() == current_system_id:
		status_text += "Mission target highlighted in gold at %s. " % mission_map_label(current_mission)
	elif has_active_mission():
		status_text += "Mission target lies outside this tactical grid. "
	if map_jump_cooldown > 0.0:
		status_text += "Jump cooldown %.1fs." % map_jump_cooldown
	else:
		status_text += "Tap a discovered map to jump."
	return status_text


func tactical_map_hover_status_text(coord: Vector2i, map_data: Dictionary, discovered: bool, is_current: bool, is_mission_target: bool) -> String:
	if not discovered:
		return "Unknown map tile. Enter it in flight to clear the fog of war."
	var details: Array[String] = [str(map_data.get("label", "Map")), map_control_summary(map_data)]
	if bool(map_data.get("is_solar_map", false)):
		details.append("Solar core")
		details.append(str(current_system_data.get("star_type", "Primary star")))
	elif bool(map_data.get("has_station", false)):
		details.append("Station: %s" % str(map_data.get("station_name", "Orbital Dock")))
	else:
		details.append("No station services")
	details.append("Resources %.0f%%" % (float(map_data.get("resource_bias", 1.0)) * 100.0))
	details.append("Danger %.0f%%" % (float(map_data.get("danger_level", 0.0)) * 100.0))
	if is_current:
		details.append("Current position")
	elif is_mission_target:
		details.append("Mission target")
	var jump_check := can_map_jump_to(coord)
	details.append(str(jump_check.get("reason", "Jump unavailable")))
	return "  |  ".join(details)


func refresh_tactical_map() -> void:
	for child in field_map_grid.get_children():
		child.queue_free()
	tactical_map_buttons.clear()
	var mission_coord_variant = mission_target_map_coord()
	var mission_coord := Vector2i(-1, -1)
	if mission_coord_variant != null and mission_target_system_id() == current_system_id:
		mission_coord = Vector2i(mission_coord_variant)
	field_map_info.text = "%s  |  %s  |  Current map %s" % [current_system_name(), str(current_system_data.get("description", "")), current_map_name()]
	field_map_info.text += "  |  %s" % str(current_system_data.get("star_type", "Primary star"))
	var maps: Dictionary = current_system_data.get("maps", {})
	for y in range(SYSTEM_GRID_SIZE):
		for x in range(SYSTEM_GRID_SIZE):
			var coord := Vector2i(x, y)
			var map_data: Dictionary = maps.get(map_key(coord), {})
			var cell_button := Button.new()
			cell_button.custom_minimum_size = Vector2(96, 72)
			cell_button.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
			var discovered := is_map_discovered(current_system_id, coord)
			var is_current := coord == current_map_coord
			var is_mission_target := coord == mission_coord
			cell_button.text = build_tactical_cell_text(map_data, discovered, is_current, is_mission_target)
			cell_button.mouse_entered.connect(func(target_coord := coord, target_map := map_data, target_discovered := discovered, target_current := is_current, target_mission := is_mission_target) -> void:
				field_map_status.text = tactical_map_hover_status_text(target_coord, target_map, target_discovered, target_current, target_mission)
			)
			cell_button.mouse_exited.connect(func() -> void:
				field_map_status.text = tactical_map_default_status_text()
			)
			if not discovered:
				style_button_secondary(cell_button)
				cell_button.modulate = Color(0.52, 0.58, 0.68, 0.88)
				cell_button.disabled = true
			elif is_current:
				style_button_primary(cell_button, Color(0.18, 0.58, 0.34, 0.98), Color(0.24, 0.74, 0.42, 0.98))
				cell_button.disabled = true
			elif is_mission_target:
				style_button_primary(cell_button, Color(0.64, 0.5, 0.12, 0.98), Color(0.82, 0.66, 0.18, 0.98))
				cell_button.pressed.connect(func(target := coord) -> void: jump_to_map(target))
			else:
				style_button_secondary(cell_button)
				cell_button.pressed.connect(func(target := coord) -> void: jump_to_map(target))
			field_map_grid.add_child(cell_button)
			tactical_map_buttons.append(cell_button)
	field_map_status.text = tactical_map_default_status_text()


func show_docking_prompt() -> void:
	dock_prompt_title.text = "DOCKING REQUEST"
	dock_prompt_info.text = "Orbital Dock is within the approach corridor. Engage docking now?"
	player.force_stop()
	dock_prompt_popup.visible = true
	play_audio(alert_player, 1.0)
	hide_tooltip()


func decline_docking_prompt() -> void:
	dock_prompt_popup.visible = false
	docking_prompt_suppressed = true
	last_status_message = "Docking request declined. Continue flight or press E to dock later."
	update_hud()


func begin_docking_sequence() -> void:
	if not has_station_in_current_map():
		return
	var dock_plan: Dictionary = nearest_station_dock_plan(player.global_position)
	dock_prompt_popup.visible = false
	docking_prompt_suppressed = false
	docking_pull_in_progress = true
	docking_menu_delay = -1.0
	docking_phase = "approach"
	docking_approach_target = dock_plan.get("approach", station.global_position)
	docking_final_target = dock_plan.get("berth", station.global_position)
	docking_side_label = str(dock_plan.get("label", "dock"))
	if player.global_position.distance_to(docking_approach_target) <= 28.0:
		docking_phase = "final"
		player.dock_to(docking_final_target)
		push_telemetry_event("Docking clamps engaged. Final %s-side alignment in progress." % docking_side_label, "dock")
		return
	player.dock_to(docking_approach_target)
	push_telemetry_event("Docking clamps engaged. Routing ship to the %s approach lane." % docking_side_label, "dock")


func confirm_docking_prompt() -> void:
	begin_docking_sequence()


func open_hostile_boarding_prompt(hostile: Dictionary) -> void:
	pending_boarding_mode = "hostile"
	pending_boarding_hostile_id = int(hostile.get("id", -1))
	pending_boarding_derelict_id = 0
	boarding_prompt_title.text = "CRIPPLED %s" % hostile_display_name(hostile).to_upper()
	boarding_prompt_info.text = "The hostile hull is drifting dead in space. Board for salvage or destroy it from range."
	boarding_prompt_board_button.text = "BOARD"
	boarding_prompt_destroy_button.text = "DESTROY"
	boarding_prompt_popup.visible = true
	hide_tooltip()


func open_derelict_boarding_prompt(resource_node) -> void:
	pending_boarding_mode = "derelict"
	pending_boarding_hostile_id = -1
	pending_boarding_derelict_id = resource_node.get_instance_id()
	boarding_prompt_title.text = "BOARD %s" % str(resource_node.node_name).to_upper()
	boarding_prompt_info.text = "The derelict breach point is accessible. Board now for a direct recovery sweep or leave it for external salvage."
	boarding_prompt_board_button.text = "BOARD"
	boarding_prompt_destroy_button.text = "LEAVE"
	boarding_prompt_popup.visible = true
	hide_tooltip()


func close_boarding_prompt() -> void:
	boarding_prompt_popup.visible = false
	pending_boarding_hostile_id = -1
	pending_boarding_derelict_id = 0
	pending_boarding_mode = ""


func confirm_boarding_action() -> void:
	var boarding_mode := pending_boarding_mode
	var hostile := get_hostile_by_id(pending_boarding_hostile_id)
	var derelict = get_derelict_by_id(pending_boarding_derelict_id)
	close_boarding_prompt()
	if boarding_mode == "hostile":
		if hostile.is_empty():
			return
		resolve_boarding(hostile)
	elif boarding_mode == "derelict":
		if derelict == null:
			return
		resolve_derelict_boarding(derelict)


func confirm_destroy_boarding_target() -> void:
	var boarding_mode := pending_boarding_mode
	var hostile := get_hostile_by_id(pending_boarding_hostile_id)
	close_boarding_prompt()
	if boarding_mode != "hostile":
		return
	if hostile.is_empty():
		return
	destroy_disabled_hostile(int(hostile["id"]))


func push_telemetry_event(message: String, kind: String = "system") -> void:
	var color := "#d8e6ff"
	match kind:
		"gather":
			color = "#6fe7ff"
		"combat":
			color = "#ff6464"
		"dock":
			color = "#7cffbc"
		"sale":
			color = "#ffd27a"
		"upgrade":
			color = "#b6a1ff"
		"mission":
			color = "#ffe88f"
		"warning":
			color = "#ff9f7a"
		_:
			color = "#d8e6ff"

	telemetry_events.push_front({
		"text": message,
		"time_left": 6.0,
		"color": color,
	})

	if telemetry_events.size() > 5:
		telemetry_events.resize(5)

	if kind == "warning":
		play_audio(alert_player, 1.0)

	refresh_telemetry_log()


func update_telemetry(delta: float) -> void:
	var dock_state := is_station_in_range()
	if dock_state != last_dock_state:
		last_dock_state = dock_state
		if dock_state:
			push_telemetry_event("Docking beacon acquired. Station services online.", "dock")
		else:
			push_telemetry_event("Departed station perimeter. Deep-space operations resumed.", "dock")

	if telemetry_events.is_empty():
		return

	for event in telemetry_events:
		event["time_left"] = max(float(event["time_left"]) - delta, 0.0)

	telemetry_events = telemetry_events.filter(func(event: Dictionary) -> bool:
		return float(event["time_left"]) > 0.0
	)

	refresh_telemetry_log()


func update_world_effects(delta: float) -> void:
	for effect in mining_effects:
		effect["time_left"] = max(float(effect["time_left"]) - delta, 0.0)
	mining_effects = mining_effects.filter(func(effect: Dictionary) -> bool:
		return float(effect["time_left"]) > 0.0
	)

	for pulse in scan_pulses:
		pulse["time_left"] = max(float(pulse["time_left"]) - delta, 0.0)
	scan_pulses = scan_pulses.filter(func(pulse: Dictionary) -> bool:
		return float(pulse["time_left"]) > 0.0
	)


func update_docking_sequence(delta: float) -> void:
	if not docking_pull_in_progress:
		return

	if player.is_autopilot_active():
		if docking_phase == "approach":
			prompt_label.text = "Docking tractor active. Routing to side approach lane."
		else:
			prompt_label.text = "Docking tractor active. Stand by for final station alignment."
		return

	if docking_phase == "approach":
		docking_phase = "final"
		player.dock_to(docking_final_target)
		prompt_label.text = "Approach lane secured. Sliding into final berth."
		return

	if docking_menu_delay < 0.0:
		docking_menu_delay = 0.45
		prompt_label.text = "Docking complete. Pressurizing access tunnel."
		return

	docking_menu_delay -= delta
	if docking_menu_delay > 0.0:
		return

	open_dock_screen()


func push_scan_pulse(world_position: Vector2) -> void:
	scan_pulses.push_back({
		"position": world_position,
		"time_left": 0.52,
		"duration": 0.52,
	})
	if scan_pulses.size() > 6:
		scan_pulses.pop_front()


func spawn_mining_effect(world_position: Vector2, effect_color: Color) -> void:
	var sparks: Array[Dictionary] = []
	for _index in range(6):
		var angle := rng.randf_range(0.0, TAU)
		sparks.append({
			"direction": Vector2.RIGHT.rotated(angle),
		})
	mining_effects.push_back({
		"position": world_position,
		"color": effect_color,
		"time_left": 0.34,
		"duration": 0.34,
		"sparks": sparks,
	})
	if mining_effects.size() > 16:
		mining_effects.pop_front()


func refresh_telemetry_log() -> void:
	if telemetry_events.is_empty():
		monitor_log.text = "[color=#6f8097]Awaiting field telemetry...[/color]"
		return

	var lines: Array[String] = []
	for event in telemetry_events:
		lines.append("[color=%s]%s[/color]" % [event["color"], event["text"]])

	monitor_log.text = "\n".join(lines)


func toggle_mission_popup() -> void:
	if field_console_popup.visible and field_console_tab == "mission":
		close_field_console()
	else:
		open_field_console("mission")
	refresh_onboarding_panel()


func close_mission_popup() -> void:
	close_field_console()


func toggle_inventory_popup() -> void:
	if field_console_popup.visible and field_console_tab == "cargo":
		close_field_console()
	else:
		mark_onboarding_step("inventory")
		open_field_console("cargo")
	refresh_onboarding_panel()


func close_inventory_popup() -> void:
	close_field_console()


func get_inventory_items() -> Array[Dictionary]:
	var items: Array[Dictionary] = []

	for item_type in ITEM_ORDER:
		if cargo[item_type] > 0:
			items.append(build_item_entry(item_type, cargo[item_type]))

	return items


func refresh_inventory_popup() -> void:
	field_cargo_summary.text = "Cargo %s / %s" % [format_weight(total_cargo_weight()), format_weight(ship_stats["cargo_capacity"])]

	var items := get_inventory_items()
	for slot_index in range(field_inventory_slots.size()):
		var slot := field_inventory_slots[slot_index]
		if slot_index < items.size():
			var item := items[slot_index]
			slot.icon = item_icons[item["type"]]
			slot.text = "\n\n%s x%d" % [item["name"], item["count"]]
			slot.set_meta("item_data", item)
			slot.disabled = false
		else:
			slot.icon = null
			slot.text = "\n\nEmpty"
			slot.remove_meta("item_data")
			slot.disabled = true


func get_ship_storage_stacks() -> Array[Dictionary]:
	var stacks: Array[Dictionary] = []
	for item_type in ITEM_ORDER:
		var remaining: int = cargo[item_type]
		while remaining > 0:
			var stack_amount: int = min(remaining, SHIP_STACK_LIMIT)
			stacks.append(build_item_entry(item_type, stack_amount))
			remaining -= stack_amount
	return stacks


func refresh_ship_storage_slots() -> void:
	var ship_stacks: Array[Dictionary] = get_ship_storage_stacks()
	for slot_index in range(ship_storage_slots.size()):
		var slot := ship_storage_slots[slot_index]
		if slot_index < ship_stacks.size():
			var stack: Dictionary = ship_stacks[slot_index]
			slot.icon = item_icons[stack["type"]]
			slot.text = "\n%s x%d" % [stack["name"], stack["count"]]
			slot.set_meta("item_data", stack)
			slot.disabled = false
		else:
			slot.icon = null
			slot.text = "\nEmpty"
			slot.remove_meta("item_data")
			slot.disabled = true


func refresh_storage_slots() -> void:
	for slot_index in range(storage_slots.size()):
		var slot := storage_slots[slot_index]
		if slot_index < station_storage.size():
			var stack := station_storage[slot_index]
			var item := build_item_entry(stack["type"], stack["count"])
			slot.icon = item_icons[item["type"]]
			slot.text = "\n%s x%d" % [item["name"], item["count"]]
			slot.set_meta("item_data", item)
			slot.disabled = false
		else:
			slot.icon = null
			slot.text = "\nEmpty"
			slot.remove_meta("item_data")
			slot.disabled = true


func build_manifest_text(store: Dictionary, empty_text: String) -> String:
	var lines: Array[String] = []
	for item_type in ITEM_ORDER:
		if store[item_type] > 0:
			lines.append("%s x%d" % [get_item_definition(item_type)["name"], store[item_type]])

	if lines.is_empty():
		return empty_text

	return "\n".join(lines)


func get_faction_definition(faction_id: String) -> Dictionary:
	return FACTIONS.get(faction_id, {
		"name": "Independent",
		"description": "Unaligned operators.",
		"color": Color(0.82, 0.88, 0.96),
	})


func faction_name(faction_id: String) -> String:
	return str(get_faction_definition(faction_id)["name"])


func faction_rep_value(faction_id: String) -> int:
	return int(faction_reputation.get(faction_id, 0))


func faction_rank_index_for_rep(rep: int) -> int:
	var best_index := 0
	for index in range(FACTION_RANK_DATA.size()):
		if rep >= int(FACTION_RANK_DATA[index]["min_rep"]):
			best_index = index
	return best_index


func faction_rank_index(faction_id: String) -> int:
	return faction_rank_index_for_rep(faction_rep_value(faction_id))


func faction_rep_rank(rep: int) -> String:
	return str(FACTION_RANK_DATA[faction_rank_index_for_rep(rep)]["name"])


func faction_rank_min_rep(rank_name: String) -> int:
	for entry in FACTION_RANK_DATA:
		if str(entry.get("name", "")) == rank_name:
			return int(entry.get("min_rep", 0))
	return 0


func faction_next_rank_text(faction_id: String) -> String:
	var current_rep := faction_rep_value(faction_id)
	var current_index := faction_rank_index_for_rep(current_rep)
	if current_index >= FACTION_RANK_DATA.size() - 1:
		return "Max rank reached"
	var next_rank: Dictionary = FACTION_RANK_DATA[current_index + 1]
	var needed: int = max(int(next_rank["min_rep"]) - current_rep, 0)
	return "%s in %d rep" % [str(next_rank["name"]), needed]


func mission_credit_bonus_multiplier(faction_id: String) -> float:
	var bonuses := [0.0, 0.02, 0.05, 0.08, 0.12, 0.16]
	return 1.0 + bonuses[faction_rank_index(faction_id)]


func mission_rep_bonus(faction_id: String) -> int:
	var bonuses := [0, 0, 1, 2, 3, 4]
	return bonuses[faction_rank_index(faction_id)]


func freeport_market_bonus_multiplier() -> float:
	var bonuses := [0.0, 0.02, 0.04, 0.06, 0.08, 0.1]
	return 1.0 + bonuses[faction_rank_index("freeport_assembly")]


func station_service_discount(service_type: String) -> float:
	match service_type:
		"refuel":
			return [0.0, 0.02, 0.05, 0.08, 0.12, 0.16][faction_rank_index("freeport_assembly")]
		"repair", "restock":
			return [0.0, 0.03, 0.06, 0.1, 0.14, 0.18][faction_rank_index("paladins")]
		"refinery", "shipyard":
			return [0.0, 0.03, 0.07, 0.11, 0.15, 0.2][faction_rank_index("deepcore_consortium")]
		"storage":
			return [0.0, 0.03, 0.06, 0.1, 0.14, 0.18][faction_rank_index("recovery_corps")]
		_:
			return 0.0


func current_scan_cooldown_duration() -> float:
	var multipliers := [1.0, 0.96, 0.9, 0.84, 0.78, 0.72]
	var base_duration: float = SCAN_COOLDOWN_DURATION * multipliers[faction_rank_index("pathfinder_initiative")]
	var research_bonus: float = research_effect_total("research_scan_cooldown_bonus") + research_effect_total("research_systems_trim") + research_effect_total("research_uplink_suite") + surveying_scan_cooldown_bonus()
	return base_duration * max(1.0 - research_bonus, 0.45)


func discounted_cost(base_cost: int, service_type: String) -> int:
	return max(int(round(base_cost * (1.0 - station_service_discount(service_type)))), 0)


func faction_active_perk_summary(faction_id: String) -> String:
	match faction_id:
		"paladins":
			return "Repair/restock discount %d%%  |  Mission rep bonus +%d" % [int(round(station_service_discount("repair") * 100.0)), mission_rep_bonus(faction_id)]
		"freeport_assembly":
			return "Market bonus %d%%  |  Refuel discount %d%%" % [int(round((freeport_market_bonus_multiplier() - 1.0) * 100.0)), int(round(station_service_discount("refuel") * 100.0))]
		"deepcore_consortium":
			return "Shipyard/refinery discount %d%%  |  Mission credit bonus %d%%" % [int(round(station_service_discount("shipyard") * 100.0)), int(round((mission_credit_bonus_multiplier(faction_id) - 1.0) * 100.0))]
		"recovery_corps":
			return "Storage discount %d%%  |  Mission rep bonus +%d" % [int(round(station_service_discount("storage") * 100.0)), mission_rep_bonus(faction_id)]
		"pathfinder_initiative":
			return "Scanner cooldown %d%% faster  |  Mission credit bonus %d%%" % [int(round((1.0 - (current_scan_cooldown_duration() / SCAN_COOLDOWN_DURATION)) * 100.0)), int(round((mission_credit_bonus_multiplier(faction_id) - 1.0) * 100.0))]
		"blackwake":
			return "No lawful station perks active"
		_:
			return "Mission credit bonus %d%%" % int(round((mission_credit_bonus_multiplier(faction_id) - 1.0) * 100.0))


func initialize_faction_rank_tracking() -> void:
	last_announced_faction_ranks.clear()
	for faction_id in FACTIONS.keys():
		last_announced_faction_ranks[faction_id] = faction_rank_index(faction_id)


func add_faction_reputation(faction_id: String, amount: int, announce_source: String = "") -> void:
	if amount == 0 or not faction_reputation.has(faction_id):
		return
	var previous_index: int = faction_rank_index(faction_id)
	faction_reputation[faction_id] += amount
	var new_index: int = faction_rank_index(faction_id)
	last_announced_faction_ranks[faction_id] = new_index
	if new_index > previous_index:
		var source_suffix := ""
		if announce_source != "":
			source_suffix = " via %s" % announce_source
		push_telemetry_event("%s promoted to %s%s. %s." % [
			faction_name(faction_id),
			faction_rep_rank(faction_rep_value(faction_id)),
			source_suffix,
			faction_active_perk_summary(faction_id),
		], "mission")


func top_faction_summary() -> String:
	var best_id := ""
	var best_rep := -INF
	for faction_id in faction_reputation.keys():
		var rep_value: int = int(faction_reputation[faction_id])
		if rep_value > best_rep:
			best_rep = rep_value
			best_id = faction_id
	if best_id == "" or int(best_rep) <= 0:
		return "None"
	return "%s %s" % [faction_name(best_id), faction_rep_rank(int(best_rep))]


func build_faction_summary_text() -> String:
	return "Top standing: %s  |  Active perks now scale with faction rank." % top_faction_summary()


func build_pilot_summary_text() -> String:
	return "Level %d / %d\n%s\n%s" % [level, MAX_PLAYER_LEVEL, piloting_license_name(), top_faction_summary()]


func build_pilot_detail_text() -> String:
	var xp_needed: int = experience_to_next_level()
	var xp_remaining: int = max(xp_needed - experience, 0)
	var xp_line := "%d / %d XP" % [experience, xp_needed]
	var next_line := "%d XP to next level" % xp_remaining
	var divider := "[color=#2b5166]────────────────────────[/color]"
	if level >= MAX_PLAYER_LEVEL:
		xp_line = "MAX LEVEL REACHED"
		next_line = "No further level gains"
	var lines: Array[String] = [
		"[b][color=#f3f7ff]PILOT PROFILE[/color][/b]",
		"Level %d" % level,
		piloting_license_name(),
		xp_line,
		next_line,
		"Skill points ready: %d" % skill_points,
		divider,
		"[b][color=#95d8ff]COMMAND[/color][/b]",
		"Top standing: %s" % top_faction_summary(),
		"Hull integrity: %d / %d" % [player_hull, player_hull_cap()],
		"Fuel capacity: %.0f" % ship_stats["fuel_capacity"],
		"Cargo limit: %s" % format_weight(ship_stats["cargo_capacity"]),
		"Scanner cooldown: %.1fs" % current_scan_cooldown_duration(),
		divider,
		"[b][color=#95d8ff]FLIGHT[/color][/b]",
		"Piloting level: %d" % use_skill_level("piloting"),
		"Travel fuel use: -%d%%" % int(round(piloting_travel_fuel_bonus() * 100.0)),
		"Boost fuel use: -%d%%" % int(round(piloting_boost_fuel_bonus() * 100.0)),
		"Next flight license: %s" % next_piloting_license_text(),
		divider,
		"[b][color=#95d8ff]FIELD SPECIALTIES[/color][/b]",
		"[color=#ffe29a]Mining[/color]  L%d" % use_skill_level("mining"),
		"Ore tier: %s" % current_mining_unlock_label(),
		"Extraction speed: +%d%%" % int(round(mining_extraction_speed_bonus() * 100.0)),
		"Bonus yield chance: +%.1f%%" % (mining_bonus_yield_chance() * 100.0),
		"",
		"[color=#ffe29a]Surveying[/color]  L%d" % use_skill_level("surveying"),
		"DF yield: +%d%%" % int(round(surveying_df_bonus() * 100.0)),
		"Scan cooldown: -%d%%" % int(round(surveying_scan_cooldown_bonus() * 100.0)),
		"Sweep reliability: +%d%%" % int(round(surveying_resource_sweep_reliability() * 100.0)),
		"",
		"[color=#ffe29a]Salvage[/color]  L%d" % use_skill_level("salvage"),
		"Salvage speed: +%d%%" % int(round(salvage_speed_bonus() * 100.0)),
		"Salvage yield: +%d%%" % int(round(salvage_yield_skill_bonus() * 100.0)),
		"Cache quality: +%d%%" % int(round(salvage_cache_quality_bonus() * 100.0)),
		"Boarding access: %s" % salvage_boarding_access_label(),
		divider,
		"[b][color=#95d8ff]COMBAT & STATION[/color][/b]",
		"[color=#ffe29a]Combat[/color]  L%d" % use_skill_level("combat"),
		"Laser damage: +%d%%" % int(round(combat_laser_damage_bonus() * 100.0)),
		"Target lock speed: +%d%%" % int(round(combat_lock_speed_bonus() * 100.0)),
		"Special cooldown: -%d%%" % int(round(combat_special_cooldown_bonus() * 100.0)),
		"",
		"[color=#ffe29a]Industry[/color]  L%d" % use_skill_level("industry"),
		"Refining speed: +%d%%" % int(round(industry_refining_speed_bonus() * 100.0)),
		"Refining quality: +%d%%" % int(round(industry_refining_quality_bonus() * 100.0)),
		"Crafting cost: -%d%%" % int(round(industry_crafting_cost_bonus() * 100.0)),
		"Refinery fee: -%d%%" % int(round(industry_refining_fee_bonus() * 100.0)),
		"",
		"[color=#ffe29a]Trade[/color]  L%d" % use_skill_level("trade"),
		"Sell value: +%d%%" % int(round(trade_sell_value_bonus() * 100.0)),
		"Mission payout: +%d%%" % int(round(trade_mission_payout_bonus() * 100.0)),
		"Bounty payout: +%d%%" % int(round(trade_bounty_payout_bonus() * 100.0)),
		divider,
		next_skill_point_level_text(),
	]
	return "\n".join(lines)


func build_faction_list_text() -> String:
	var ordered_factions: Array[Dictionary] = []
	for faction_id in FACTIONS.keys():
		ordered_factions.append({
			"id": faction_id,
			"rep": int(faction_reputation.get(faction_id, 0)),
		})
	ordered_factions.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return int(a["rep"]) > int(b["rep"])
	)

	var lines: Array[String] = []
	for entry in ordered_factions:
		var faction_id := str(entry["id"])
		var faction_def := get_faction_definition(faction_id)
		var color: Color = faction_def["color"]
		var rep_value: int = int(entry["rep"])
		lines.append("[color=%s][b]%s[/b][/color]" % [color.to_html(false), faction_def["name"]])
		lines.append("Rank %s  |  Rep %d" % [faction_rep_rank(rep_value), rep_value])
		lines.append("Perks: %s" % faction_active_perk_summary(faction_id))
		lines.append("Next rank: %s" % faction_next_rank_text(faction_id))
		lines.append("Future station track: %s" % faction_future_station_service_summary(faction_id))
		lines.append("%s" % str(faction_def["description"]))
		lines.append("")

	return "\n".join(lines).strip_edges()


func faction_future_station_service_summary(faction_id: String) -> String:
	var entries: Array = FACTION_SERVICE_PLANS.get(faction_id, [])
	if entries.is_empty():
		return "No faction station services assigned yet"
	var parts: Array[String] = []
	for entry in entries:
		parts.append("%s: %s" % [str(entry.get("rank", "Recruit")), str(entry.get("service", "Pending"))])
	return " / ".join(parts)


func initialize_skill_tree_data() -> void:
	skill_node_ranks.clear()
	for node in SKILL_TREE_NODES:
		skill_node_ranks[str(node.get("id", ""))] = 0


func skill_points_awarded_for_level(target_level: int) -> int:
	if target_level <= 0 or target_level % 2 == 0:
		return 0
	return 1 + int((target_level - 1) / 10.0)


func next_skill_point_level_text() -> String:
	for target_level in range(level + 1, MAX_PLAYER_LEVEL + 1):
		var award := skill_points_awarded_for_level(target_level)
		if award > 0:
			return "Next SP award: Level %d (+%d)" % [target_level, award]
	return "All scheduled SP awards claimed"


func skill_node_rank(node_id: String) -> int:
	return int(skill_node_ranks.get(node_id, 0))


func find_skill_node(node_id: String) -> Dictionary:
	for node in SKILL_TREE_NODES:
		if str(node.get("id", "")) == node_id:
			return node
	return {}


func skill_tree_highest_tier(tree_id: String) -> int:
	var best_tier := 0
	for node in SKILL_TREE_NODES:
		if str(node.get("tree", "")) != tree_id:
			continue
		if skill_node_rank(str(node.get("id", ""))) > 0:
			best_tier = max(best_tier, int(node.get("tier", 1)))
	return best_tier


func skill_tree_specialization_lock_reason(node: Dictionary) -> String:
	var tree_id := str(node.get("tree", ""))
	for other_tree in SKILL_TREE_LOCKS.keys():
		if other_tree == tree_id:
			continue
		if skill_tree_highest_tier(other_tree) < 2:
			continue
		var blocked_trees: Array = SKILL_TREE_LOCKS.get(other_tree, [])
		if blocked_trees.has(tree_id) and int(node.get("tier", 1)) >= 2:
			return "%s specialization blocks deeper %s investment." % [other_tree.capitalize(), tree_id.capitalize()]
	return ""


func skill_node_requirement_met(node: Dictionary) -> bool:
	for required_id in node.get("requires", []):
		if skill_node_rank(str(required_id)) <= 0:
			return false
	return true


func skill_node_effect_total(effect_key: String) -> float:
	var total := 0.0
	for node in SKILL_TREE_NODES:
		if str(node.get("effect_key", "")) != effect_key:
			continue
		total += float(node.get("effect_per_rank", 0.0)) * skill_node_rank(str(node.get("id", "")))
	return total


func mining_power_skill_bonus() -> float:
	return skill_node_effect_total("mining_power_bonus")


func prospector_rare_bonus() -> float:
	return skill_node_effect_total("rare_find_bonus")


func fuel_burn_reduction() -> float:
	return clampf(skill_node_effect_total("fuel_burn_reduction") + research_effect_total("research_systems_trim") + piloting_travel_fuel_bonus(), 0.0, 0.65)


func boost_burn_reduction() -> float:
	return clampf(skill_node_effect_total("boost_burn_reduction") + research_effect_total("research_boost_efficiency") + piloting_boost_fuel_bonus(), 0.0, 0.65)


func map_jump_cost_reduction() -> float:
	return clampf(skill_node_effect_total("map_jump_cost_reduction") + research_effect_total("research_map_jump_efficiency"), 0.0, 0.7)


func sale_price_skill_bonus() -> float:
	return skill_node_effect_total("sale_price_bonus") + trade_sell_value_bonus()


func mission_credit_skill_bonus() -> float:
	return skill_node_effect_total("mission_credit_bonus") + trade_mission_payout_bonus()


func mission_rep_skill_bonus() -> int:
	return int(round(skill_node_effect_total("mission_rep_bonus")))


func refinery_fee_discount_bonus() -> float:
	return clampf(skill_node_effect_total("refinery_fee_discount") + industry_refining_fee_bonus(), 0.0, 0.55)


func current_refinery_cycle_duration() -> float:
	return max(2.0 * (1.0 - industry_refining_speed_bonus()), 0.75)


func crafting_credit_cost(recipe: Dictionary) -> int:
	var base_cost: int = int(recipe.get("credit_cost", 0))
	return max(int(round(float(base_cost) * max(1.0 - industry_crafting_cost_bonus(), 0.4))), 0)


func salvage_yield_bonus() -> float:
	return skill_node_effect_total("salvage_yield_bonus") + research_effect_total("research_salvage_yield_bonus") + research_effect_total("research_salvage_vectors") + research_effect_total("research_priority_reclamation") + salvage_yield_skill_bonus()


func boarding_loot_bonus() -> float:
	return skill_node_effect_total("boarding_loot_bonus") + research_effect_total("research_boarding_loot_bonus") + research_effect_total("research_priority_reclamation")


func derelict_cache_bonus() -> float:
	return skill_node_effect_total("derelict_cache_bonus") + research_effect_total("research_derelict_cache_bonus") + research_effect_total("research_salvage_vectors") + research_effect_total("research_priority_reclamation") + salvage_cache_quality_bonus()


func combat_lock_time() -> float:
	var lock_bonus: float = skill_node_effect_total("lock_speed_bonus") + research_effect_total("research_combat_lock_bonus") + research_effect_total("research_tactical_net") + combat_lock_speed_bonus()
	return COMBAT_LOCK_TIME * max(1.0 - lock_bonus, 0.35)


func missile_cooldown_duration() -> float:
	var cooldown_bonus: float = skill_node_effect_total("missile_cooldown_reduction") + research_effect_total("research_missile_cooldown_bonus") + research_effect_total("research_tactical_net") + combat_special_cooldown_bonus()
	return SPECIAL_MISSILE_COOLDOWN * max(1.0 - cooldown_bonus, 0.4)


func player_hull_cap() -> int:
	var research_hull_bonus: float = research_effect_total("research_hull_bonus") + research_effect_total("research_damage_control")
	return 100 + int(round(skill_node_effect_total("hull_bonus") + research_hull_bonus + float(ship_stats.get("hull_bonus", 0.0))))


func player_shield_cap() -> float:
	return 44.0 + research_effect_total("research_damage_control") * 0.35 + float(ship_stats.get("shield_bonus", 0.0))


func player_laser_damage() -> int:
	var laser_damage_bonus: float = float(ship_stats.get("laser_damage_bonus", 0.0))
	return int(round((PRIMARY_LASER_DAMAGE + laser_damage_bonus) * (1.0 + combat_laser_damage_bonus())))


func player_special_damage() -> int:
	return int(round(SPECIAL_MISSILE_DAMAGE + float(ship_stats.get("special_damage_bonus", 0.0))))


func player_shield_recharge_rate() -> float:
	return 8.0 + research_effect_total("research_tactical_net") * 0.08


func player_shield_visual_radius() -> float:
	if player == null or player.ship_sprite == null or player.ship_sprite.texture == null:
		return 24.0
	var sprite_size: Vector2 = player.ship_sprite.texture.get_size() * player.ship_sprite.scale.abs()
	return max(sprite_size.x, sprite_size.y) * 0.52 + 6.0


func bounty_value_bonus() -> float:
	return skill_node_effect_total("bounty_bonus") + research_effect_total("research_bounty_bonus") + trade_bounty_payout_bonus()


func build_skill_tree_hint_text() -> String:
	return "Training specialization is being rebuilt for a future update."


func refresh_skill_tree_panel() -> void:
	skill_points_label.text = "COMING SOON"
	skill_tree_hint.text = build_skill_tree_hint_text()
	training_soon_title.text = "SPECIALIZATION TRAINING"
	training_soon_text.text = "Coming soon.\n\nThis room is being rebuilt into a specialization and certification system for future pilots."


func refresh_research_tree_panel() -> void:
	load_research_tree_from_data()
	for child in research_tree_canvas.get_children():
		child.queue_free()
	research_tree_buttons.clear()
	var branch_definitions: Array = research_branch_definitions()
	if branch_definitions.is_empty():
		return
	if selected_research_branch.is_empty():
		selected_research_branch = str(branch_definitions[0].get("id", "branch"))
	if research_branch_definition(selected_research_branch).is_empty():
		selected_research_branch = str(branch_definitions[0].get("id", "branch"))
	refresh_research_branch_tabs()
	var selected_branch_nodes: Array[Dictionary] = research_nodes_for_branch(selected_research_branch)
	build_research_branch_lane(0, research_branch_definition(selected_research_branch), selected_branch_nodes)
	if selected_research_node_id.is_empty() or find_research_node_by_id(selected_research_node_id).is_empty():
		if not selected_branch_nodes.is_empty():
			selected_research_node_id = str(selected_branch_nodes[0].get("id", ""))
		else:
			selected_research_node_id = ""
	refresh_research_inspector()


func load_research_tree_from_data() -> void:
	research_tree_nodes.clear()
	var branch_definitions: Array = research_branch_definitions()
	var branch_lookup: Dictionary = {}
	for branch_def in branch_definitions:
		var branch_id := str(branch_def.get("id", "branch"))
		branch_lookup[branch_id] = branch_def
	for node_data in STARHAUL_RESEARCH_LIB.nodes():
		var node: Dictionary = node_data.duplicate(true)
		var branch_id := str(node.get("branch", ""))
		var branch_def: Dictionary = branch_lookup.get(branch_id, {})
		var column_index: int = int(node.get("column", 0))
		var row_offset: float = float(node.get("row_offset", 0.0))
		var node_position: Vector2 = Vector2(
			RESEARCH_TREE_ROOT_X + row_offset,
			RESEARCH_TREE_START_Y + column_index * RESEARCH_TREE_ROW_SPACING
		)
		node["branch_name"] = str(branch_def.get("name", "Branch"))
		node["branch_color"] = branch_def.get("color", Color(0.7, 0.84, 1.0))
		node["position"] = node_position
		research_tree_nodes.append(node)
	var max_x := 1280.0
	var max_y := 980.0
	for node in research_tree_nodes:
		var node_position_value: Vector2 = node.get("position", Vector2.ZERO)
		max_x = max(max_x, node_position_value.x + RESEARCH_TREE_NODE_SIZE.x + 220.0)
		max_y = max(max_y, node_position_value.y + RESEARCH_TREE_NODE_SIZE.y + 220.0)
	research_tree_canvas.custom_minimum_size = Vector2(max_x, max_y)


func research_branch_definitions() -> Array:
	return STARHAUL_RESEARCH_LIB.branch_definitions()


func research_effect_total(effect_key: String) -> float:
	var total := 0.0
	for node_variant in research_tree_nodes:
		var node: Dictionary = node_variant
		if str(node.get("effect_key", "")) != effect_key:
			continue
		var rank: int = current_research_rank(str(node.get("id", "")))
		if rank <= 0:
			continue
		total += float(node.get("effect_per_rank", 0.0)) * rank
	return total


func current_research_rank(node_id: String) -> int:
	return int(research_node_ranks.get(node_id, 0))


func research_node_is_unlocked(node: Dictionary) -> bool:
	var parent_ids: Array = node.get("parents", [])
	if parent_ids.is_empty():
		return true
	for parent_id_variant in parent_ids:
		if current_research_rank(str(parent_id_variant)) <= 0:
			return false
	return true


func selected_research_node() -> Dictionary:
	return find_research_node_by_id(selected_research_node_id)


func research_refinery_fee_discount_bonus() -> float:
	return clampf(research_effect_total("research_refinery_fee_discount"), 0.0, 0.35)


func research_refinery_output_bonus() -> float:
	return max(research_effect_total("research_refinery_output_bonus") + research_effect_total("research_catalytic_efficiency"), 0.0)


func research_refinery_throughput_bonus() -> float:
	return max(research_effect_total("refinery_throughput_bonus") + research_effect_total("research_batch_processing_bonus"), 0.0)


func research_rare_recovery_bonus() -> float:
	return max(research_effect_total("research_rare_recovery_bonus"), 0.0)


func upload_scan_data() -> void:
	if data_fragments < 100:
		last_status_message = "Research canister not full enough for upload."
		push_telemetry_event("Upload blocked. The active canister needs at least 100 DF.", "warning")
		update_hud()
		refresh_research_inspector()
		return
	var converted_units: int = int(floor(float(data_fragments) / 100.0))
	data_fragments -= converted_units * 100
	research_units += converted_units
	last_status_message = "Uploaded scan data. %d research unit%s banked." % [converted_units, "s" if converted_units != 1 else ""]
	push_telemetry_event("Research upload complete. %d unit%s added to the data bank." % [converted_units, "s" if converted_units != 1 else ""], "mission")
	update_hud()
	refresh_research_inspector()


func purchase_selected_research_node() -> void:
	var node: Dictionary = selected_research_node()
	if node.is_empty():
		return
	var node_id: String = str(node.get("id", ""))
	var current_rank: int = current_research_rank(node_id)
	var max_rank: int = int(node.get("max_rank", 1))
	if current_rank >= max_rank:
		last_status_message = "Research node already at maximum rank."
		push_telemetry_event("%s is already fully researched." % str(node.get("title", "Research Node")), "warning")
		refresh_research_inspector()
		update_hud()
		return
	if not research_node_is_unlocked(node):
		last_status_message = "Prerequisite research still missing."
		push_telemetry_event("Research blocked. Prior nodes must be completed first.", "warning")
		refresh_research_inspector()
		update_hud()
		return
	var unit_cost: int = int(node.get("unit_cost", 1))
	var credit_cost: int = int(node.get("credit_cost", 0))
	if research_units < unit_cost:
		last_status_message = "Not enough research units."
		push_telemetry_event("Research blocked. Need %d research unit%s." % [unit_cost, "s" if unit_cost != 1 else ""], "warning")
		refresh_research_inspector()
		update_hud()
		return
	if credits < credit_cost:
		last_status_message = "Not enough credits for research allocation."
		push_telemetry_event("Research blocked. Need %d CR." % credit_cost, "warning")
		refresh_research_inspector()
		update_hud()
		return
	research_units -= unit_cost
	credits -= credit_cost
	research_node_ranks[node_id] = current_rank + 1
	recalculate_ship_stats()
	last_status_message = "Research advanced: %s rank %d." % [str(node.get("title", "Research Node")), current_rank + 1]
	push_telemetry_event("%s advanced to rank %d." % [str(node.get("title", "Research Node")), current_rank + 1], "mission")
	refresh_research_tree_panel()
	update_hud()


func research_branch_definition(branch_id: String) -> Dictionary:
	for branch_def_variant in research_branch_definitions():
		var branch_def: Dictionary = branch_def_variant
		if str(branch_def.get("id", "")) == branch_id:
			return branch_def
	return {}


func research_nodes_for_branch(branch_id: String) -> Array[Dictionary]:
	var nodes: Array[Dictionary] = []
	for node_variant in research_tree_nodes:
		var node: Dictionary = node_variant
		if str(node.get("branch", "")) == branch_id:
			nodes.append(node)
	nodes.sort_custom(func(a: Dictionary, b: Dictionary) -> bool: return float(a.get("position", Vector2.ZERO).y) < float(b.get("position", Vector2.ZERO).y))
	return nodes


func find_research_node_by_id(node_id: String) -> Dictionary:
	for node_variant in research_tree_nodes:
		var node: Dictionary = node_variant
		if str(node.get("id", "")) == node_id:
			return node
	return {}


func refresh_research_branch_tabs() -> void:
	for child in research_tabs.get_children():
		child.queue_free()
	research_branch_buttons.clear()
	for branch_def_variant in research_branch_definitions():
		var branch_def: Dictionary = branch_def_variant
		var branch_id := str(branch_def.get("id", "branch"))
		var branch_name := str(branch_def.get("name", "Branch"))
		var branch_color: Color = branch_def.get("color", Color(0.7, 0.84, 1.0))
		var branch_button := Button.new()
		branch_button.text = branch_name.to_upper()
		branch_button.custom_minimum_size = Vector2(120, 42)
		branch_button.focus_mode = Control.FOCUS_NONE
		branch_button.pressed.connect(func(target_branch := branch_id) -> void:
			selected_research_branch = target_branch
			selected_research_node_id = ""
			refresh_research_tree_panel()
		)
		attach_button_audio(branch_button)
		if branch_id == selected_research_branch:
			style_button_primary(branch_button, Color(0.1, 0.2, 0.3, 0.98), Color(branch_color.r, branch_color.g, branch_color.b, 0.92))
		else:
			style_button_secondary(branch_button)
			branch_button.add_theme_stylebox_override("normal", make_panel_style(Color(0.05, 0.09, 0.14, 0.96), Color(branch_color.r, branch_color.g, branch_color.b, 0.2), 14, 1))
			branch_button.add_theme_stylebox_override("hover", make_panel_style(Color(0.09, 0.13, 0.2, 0.98), Color(branch_color.r, branch_color.g, branch_color.b, 0.32), 14, 1))
			branch_button.add_theme_stylebox_override("pressed", make_panel_style(Color(0.08, 0.12, 0.18, 0.98), Color(branch_color.r, branch_color.g, branch_color.b, 0.4), 14, 1))
		research_tabs.add_child(branch_button)
		research_branch_buttons.append(branch_button)


func refresh_research_inspector() -> void:
	var branch_def: Dictionary = research_branch_definition(selected_research_branch)
	var branch_name := str(branch_def.get("name", "Branch"))
	var branch_color: Color = branch_def.get("color", Color(0.7, 0.84, 1.0))
	var branch_nodes: Array[Dictionary] = research_nodes_for_branch(selected_research_branch)
	research_branch_badge.text = branch_name.to_upper()
	research_branch_badge.add_theme_color_override("font_color", branch_color)
	research_footer_status.text = "%s lane  |  %d mapped node%s  |  Drag to pan and click to focus" % [branch_name, branch_nodes.size(), "s" if branch_nodes.size() != 1 else ""]
	research_units_label.text = "Data Bank: %d RU" % research_units
	research_canister_label.text = "Canister: %d / 100 DF" % data_fragments
	research_upload_button.disabled = data_fragments < 100
	research_upload_button.text = "UPLOAD SCAN DATA" if data_fragments < 100 else "UPLOAD SCAN DATA (+%d RU)" % int(floor(float(data_fragments) / 100.0))
	var selected_node: Dictionary = find_research_node_by_id(selected_research_node_id)
	if selected_node.is_empty():
		research_inspector_title.text = "%s research lane" % branch_name
		research_inspector_meta.text = "No node selected  |  %d mapped node%s" % [branch_nodes.size(), "s" if branch_nodes.size() != 1 else ""]
		research_inspector_summary.text = "Select a node card to inspect its tier, status, and dependencies."
		research_inspector_description.text = "[color=#d8e8ff]%s[/color]\n\n[color=#a9bdd1]%s[/color]" % [STARHAUL_RESEARCH_LIB.TREE_HINT, str(branch_def.get("summary", "Research briefings will appear here."))]
		research_unlock_button.disabled = true
		research_unlock_button.text = "RESEARCH NODE"
		return
	var parent_ids: Array = selected_node.get("parents", [])
	var dependency_text := "Dependencies: none" if parent_ids.is_empty() else "Dependencies: %s" % ", ".join(parent_ids)
	var current_rank: int = int(research_node_ranks.get(str(selected_node.get("id", "")), 0))
	var max_rank: int = int(selected_node.get("max_rank", 1))
	research_inspector_title.text = str(selected_node.get("title", "Research Node"))
	research_inspector_meta.text = "%s  |  T%d  |  Rank %d/%d  |  %s" % [branch_name, int(selected_node.get("tier", 1)), current_rank, max_rank, str(selected_node.get("status", "PLANNED"))]
	var unit_cost: int = int(selected_node.get("unit_cost", 1))
	var credit_cost: int = int(selected_node.get("credit_cost", 0))
	research_inspector_summary.text = "%s\n%s\nEffect: %s\nCost: %d RU + %d CR" % [str(selected_node.get("summary", "")), dependency_text, str(selected_node.get("effect_summary", "Pending")), unit_cost, credit_cost]
	research_inspector_description.text = "[color=#d8e8ff]%s[/color]" % str(selected_node.get("description", ""))
	if current_rank >= max_rank:
		research_unlock_button.disabled = true
		research_unlock_button.text = "MAXED"
	elif not research_node_is_unlocked(selected_node):
		research_unlock_button.disabled = true
		research_unlock_button.text = "LOCKED"
	elif research_units < unit_cost or credits < credit_cost:
		research_unlock_button.disabled = true
		research_unlock_button.text = "NEEDS %d RU + %d CR" % [unit_cost, credit_cost]
	else:
		research_unlock_button.disabled = false
		research_unlock_button.text = "RESEARCH (%d RU + %d CR)" % [unit_cost, credit_cost]
	research_units_label.text = "Data Bank: %d RU" % research_units
	research_canister_label.text = "Canister: %d / 100 DF" % data_fragments
	research_upload_button.disabled = data_fragments < 100
	research_upload_button.text = "UPLOAD SCAN DATA" if data_fragments < 100 else "UPLOAD SCAN DATA (+%d RU)" % int(floor(float(data_fragments) / 100.0))


func build_research_branch_lane(_branch_index: int, branch_def: Dictionary, branch_nodes: Array[Dictionary]) -> void:
	var branch_color: Color = branch_def.get("color", Color(0.7, 0.84, 1.0))
	var branch_name: String = str(branch_def.get("name", "Branch"))
	var lane_x: float = RESEARCH_TREE_ROOT_X + RESEARCH_TREE_NODE_SIZE.x * 0.5
	var connector_layer := Control.new()
	connector_layer.mouse_filter = Control.MOUSE_FILTER_IGNORE
	research_tree_canvas.add_child(connector_layer)

	var header_panel := PanelContainer.new()
	header_panel.position = Vector2(lane_x - 74.0, 36.0)
	header_panel.custom_minimum_size = Vector2(148, 64)
	header_panel.add_theme_stylebox_override("panel", make_panel_style(Color(0.05, 0.09, 0.14, 0.96), Color(branch_color.r, branch_color.g, branch_color.b, 0.28), 18, 1))
	research_tree_canvas.add_child(header_panel)

	var header_margin := MarginContainer.new()
	header_margin.add_theme_constant_override("margin_left", 12)
	header_margin.add_theme_constant_override("margin_top", 10)
	header_margin.add_theme_constant_override("margin_right", 12)
	header_margin.add_theme_constant_override("margin_bottom", 10)
	header_panel.add_child(header_margin)

	var header_label := Label.new()
	header_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	header_label.text = "%s\nROOT" % branch_name.to_upper()
	header_label.add_theme_font_size_override("font_size", 14)
	header_label.add_theme_color_override("font_color", branch_color)
	header_margin.add_child(header_label)

	var root_anchor := Vector2(lane_x, 36.0 + 64.0 + 8.0)
	var branch_node_lookup: Dictionary = {}
	for branch_node in branch_nodes:
		branch_node_lookup[str(branch_node.get("id", ""))] = branch_node
	for node in branch_nodes:
		var node_position: Vector2 = node.get("position", Vector2.ZERO)
		var node_center := node_position + RESEARCH_TREE_NODE_SIZE * 0.5
		var node_top_anchor := Vector2(node_center.x, node_position.y - 8.0)
		var parent_ids: Array = node.get("parents", [])
		if parent_ids.is_empty():
			add_research_connection(connector_layer, root_anchor, node_top_anchor, branch_color)
		else:
			for parent_id_variant in parent_ids:
				var parent_id := str(parent_id_variant)
				if not branch_node_lookup.has(parent_id):
					continue
				var parent_node: Dictionary = branch_node_lookup[parent_id]
				var parent_position: Vector2 = parent_node.get("position", Vector2.ZERO)
				var parent_center := parent_position + RESEARCH_TREE_NODE_SIZE * 0.5
				var parent_bottom_anchor := Vector2(parent_center.x, parent_position.y + RESEARCH_TREE_NODE_SIZE.y + 8.0)
				add_research_connection(connector_layer, parent_bottom_anchor, node_top_anchor, branch_color)

		var node_button := Button.new()
		node_button.position = node_position
		node_button.custom_minimum_size = RESEARCH_TREE_NODE_SIZE
		var current_rank: int = int(research_node_ranks.get(str(node.get("id", "")), 0))
		var max_rank: int = int(node.get("max_rank", 1))
		var unit_cost: int = int(node.get("unit_cost", 1))
		var credit_cost: int = int(node.get("credit_cost", 0))
		var availability_label := "READY"
		if current_rank >= max_rank:
			availability_label = "MAXED"
		elif not research_node_is_unlocked(node):
			availability_label = "LOCKED"
		node_button.text = "T%d  |  %s\n%s\nRank %d/%d  |  %s\n%d RU + %d CR" % [int(node.get("tier", 1)), branch_name, str(node.get("title", "")), current_rank, max_rank, availability_label, unit_cost, credit_cost]
		node_button.alignment = HORIZONTAL_ALIGNMENT_LEFT
		node_button.vertical_icon_alignment = VERTICAL_ALIGNMENT_CENTER
		node_button.clip_text = true
		node_button.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		node_button.add_theme_font_size_override("font_size", 13)
		node_button.add_theme_stylebox_override("normal", make_panel_style(Color(0.07, 0.1, 0.15, 0.96), Color(branch_color.r, branch_color.g, branch_color.b, 0.22), 16, 1))
		node_button.add_theme_stylebox_override("hover", make_panel_style(Color(0.1, 0.14, 0.2, 0.98), Color(branch_color.r, branch_color.g, branch_color.b, 0.36), 16, 1))
		node_button.add_theme_stylebox_override("pressed", make_panel_style(Color(0.11, 0.15, 0.21, 1.0), Color(branch_color.r, branch_color.g, branch_color.b, 0.42), 16, 1))
		node_button.add_theme_stylebox_override("focus", make_panel_style(Color(0.11, 0.15, 0.21, 1.0), Color(branch_color.r, branch_color.g, branch_color.b, 0.42), 16, 1))
		node_button.add_theme_color_override("font_color", Color(0.93, 0.96, 1.0))
		if not research_node_is_unlocked(node):
			node_button.modulate = Color(0.76, 0.8, 0.88, 0.72)
		elif current_rank >= max_rank:
			node_button.modulate = Color(0.9, 0.98, 0.92, 1.0)
		else:
			node_button.modulate = Color(1, 1, 1, 1)
		node_button.pressed.connect(func(target_position := node_center, target_id := str(node.get("id", ""))) -> void:
			if not research_tree_dragging:
				selected_research_node_id = target_id
				center_research_tree_on(target_position)
				refresh_research_inspector()
		)
		node_button.gui_input.connect(func(event: InputEvent, target_id := str(node.get("id", ""))) -> void:
			handle_research_tree_gui_input(event, target_id)
		)
		node_button.mouse_entered.connect(func(node_data := node, source := node_button) -> void:
			show_research_node_tooltip(node_data, source)
		)
		node_button.mouse_exited.connect(hide_tooltip)
		attach_button_audio(node_button)
		research_tree_canvas.add_child(node_button)
		research_tree_buttons.append(node_button)


func add_research_connection(layer: Control, start_point: Vector2, end_point: Vector2, branch_color: Color) -> void:
	var connector_color := Color(branch_color.r, branch_color.g, branch_color.b, 0.22)
	var midpoint_y: float = lerpf(start_point.y, end_point.y, 0.5)
	var horizontal_start_x: float = min(start_point.x, end_point.x)
	var horizontal_width: float = absf(end_point.x - start_point.x)
	add_research_connector_segment(layer, Vector2(start_point.x - 2.0, start_point.y), Vector2(4.0, max(midpoint_y - start_point.y, 2.0)), connector_color)
	if horizontal_width > 0.0:
		add_research_connector_segment(layer, Vector2(horizontal_start_x, midpoint_y - 2.0), Vector2(horizontal_width, 4.0), connector_color)
	add_research_connector_segment(layer, Vector2(end_point.x - 2.0, midpoint_y), Vector2(4.0, max(end_point.y - midpoint_y, 2.0)), connector_color)


func add_research_connector_segment(layer: Control, segment_position: Vector2, size: Vector2, color: Color) -> void:
	var segment := ColorRect.new()
	segment.position = segment_position
	segment.custom_minimum_size = size
	segment.color = color
	layer.add_child(segment)


func handle_research_tree_gui_input(event: InputEvent, node_id: String = "") -> void:
	if not research_panel.visible:
		return
	if event is InputEventMouseButton:
		var mouse_button_event := event as InputEventMouseButton
		if mouse_button_event.button_index != MOUSE_BUTTON_LEFT:
			return
		if mouse_button_event.pressed:
			research_tree_drag_active = true
			research_tree_dragging = false
			research_tree_drag_start_mouse = get_viewport().get_mouse_position()
			research_tree_drag_start_scroll = Vector2(research_tree_scroll.scroll_horizontal, research_tree_scroll.scroll_vertical)
			research_tree_click_candidate = node_id
		else:
			research_tree_drag_active = false
			research_tree_dragging = false
			research_tree_click_candidate = ""
	elif event is InputEventMouseMotion and research_tree_drag_active:
		var mouse_delta := get_viewport().get_mouse_position() - research_tree_drag_start_mouse
		if mouse_delta.length() >= RESEARCH_TREE_DRAG_THRESHOLD:
			research_tree_dragging = true
			hide_tooltip()
		if research_tree_dragging:
			set_research_tree_scroll(research_tree_drag_start_scroll - mouse_delta)


func set_research_tree_scroll(target_scroll: Vector2) -> void:
	var max_horizontal: float = max(research_tree_canvas.custom_minimum_size.x - research_tree_scroll.size.x, 0.0)
	var max_vertical: float = max(research_tree_canvas.custom_minimum_size.y - research_tree_scroll.size.y, 0.0)
	research_tree_scroll.scroll_horizontal = int(clampf(target_scroll.x, 0.0, max_horizontal))
	research_tree_scroll.scroll_vertical = int(clampf(target_scroll.y, 0.0, max_vertical))


func center_research_tree_on(target_position: Vector2) -> void:
	var target_scroll := Vector2(
		target_position.x - research_tree_scroll.size.x * 0.5,
		target_position.y - research_tree_scroll.size.y * 0.5
	)
	set_research_tree_scroll(target_scroll)


func show_research_node_tooltip(node: Dictionary, source: Control) -> void:
	tooltip_name.text = str(node.get("title", "Research Node"))
	tooltip_body.text = "%s  |  %s\n%s\n%s" % [
		str(node.get("branch_name", "Branch")),
		str(node.get("status", "PLANNED")),
		str(node.get("summary", "")),
		str(node.get("description", "")),
	]
	inventory_tooltip.visible = true
	var tooltip_size: Vector2 = inventory_tooltip.size
	var source_rect: Rect2 = source.get_global_rect()
	var desired_position: Vector2 = source_rect.position + Vector2(source_rect.size.x + 10.0, 0.0)
	var viewport_size: Vector2 = get_viewport_rect().size
	desired_position.x = clampf(desired_position.x, 8.0, viewport_size.x - tooltip_size.x - 8.0)
	desired_position.y = clampf(desired_position.y, 8.0, viewport_size.y - tooltip_size.y - 8.0)
	inventory_tooltip.global_position = desired_position


func research_node_count() -> int:
	return STARHAUL_RESEARCH_LIB.nodes().size()


# --- Mission labels / status helpers ---
func has_active_mission() -> bool:
	return not active_missions.is_empty()


func active_mission_limit() -> int:
	return 3


func set_tracked_mission_index(mission_index: int) -> void:
	if mission_index < 0 or mission_index >= active_missions.size():
		current_mission_index = -1
		current_mission = {}
		return
	current_mission_index = mission_index
	current_mission = active_missions[mission_index]


func find_active_mission_index_by_id(mission_id: String) -> int:
	for mission_index in range(active_missions.size()):
		if str(active_missions[mission_index].get("id", "")) == mission_id:
			return mission_index
	return -1


func first_active_mission_index_matching_ids(mission_ids: Array[String]) -> int:
	if mission_ids.is_empty():
		return -1
	if current_mission_index >= 0 and current_mission_index < active_missions.size():
		var tracked_id: String = str(active_missions[current_mission_index].get("id", ""))
		if mission_ids.has(tracked_id) and current_map_matches_mission_location(active_missions[current_mission_index]) and not mission_needs_turn_in(active_missions[current_mission_index]):
			return current_mission_index
	for mission_index in range(active_missions.size()):
		var mission: Dictionary = active_missions[mission_index]
		var mission_id: String = str(mission.get("id", ""))
		if not mission_ids.has(mission_id):
			continue
		if not current_map_matches_mission_location(mission):
			continue
		if mission_needs_turn_in(mission):
			continue
		return mission_index
	return -1


func ensure_tracked_mission_valid() -> void:
	if active_missions.is_empty():
		current_mission_index = -1
		current_mission = {}
		return
	if current_mission_index < 0 or current_mission_index >= active_missions.size():
		set_tracked_mission_index(0)
		return
	current_mission = active_missions[current_mission_index]


func remove_active_mission_at(mission_index: int) -> void:
	if mission_index < 0 or mission_index >= active_missions.size():
		return
	active_missions.remove_at(mission_index)
	if active_missions.is_empty():
		current_mission_index = -1
		current_mission = {}
	elif current_mission_index > mission_index:
		set_tracked_mission_index(current_mission_index - 1)
	elif current_mission_index == mission_index:
		set_tracked_mission_index(min(mission_index, active_missions.size() - 1))
	else:
		ensure_tracked_mission_valid()


func mission_progress_label(mission: Dictionary) -> String:
	return "%d / %d" % [int(mission.get("progress", 0)), int(mission.get("goal", 0))]


func mission_offer_time_label(mission: Dictionary) -> String:
	var time_left: float = float(mission.get("time_left", 0.0))
	if time_left <= 0.0:
		return "Refreshing"
	var total_seconds: int = int(ceil(time_left))
	var minutes: int = int(total_seconds / 60.0)
	var seconds: int = total_seconds % 60
	return "%02d:%02d" % [minutes, seconds]


func mission_required_rank_name(mission: Dictionary) -> String:
	if mission.has("min_rank"):
		return str(mission.get("min_rank", ""))
	var min_rep: int = int(mission.get("min_rep", 0))
	if min_rep <= 0:
		return ""
	return faction_rep_rank(min_rep)


func mission_requirement_text(mission: Dictionary) -> String:
	var rank_name := mission_required_rank_name(mission)
	var requirement_parts: Array[String] = []
	if not rank_name.is_empty():
		var issuer_id := str(mission.get("faction", ""))
		requirement_parts.append("Requires %s standing with %s" % [rank_name, faction_name(issuer_id)])
	var required_mining_stage: int = int(mission.get("required_mining_stage", -1))
	if required_mining_stage >= 0:
		requirement_parts.append("Needs Mining Lv %d" % mining_level_required_for_stage(required_mining_stage))
	var cargo_weight_required: float = mission_cargo_weight_requirement(mission)
	if cargo_weight_required > 0.0:
		requirement_parts.append("Needs %s cargo capacity" % format_weight(cargo_weight_required))
	return "  |  ".join(requirement_parts)


func mission_cargo_weight_requirement(mission: Dictionary) -> float:
	if not mission_requires_delivery(mission):
		return 0.0
	var item_type: StringName = mission["deliver_item"]
	var amount: int = int(mission.get("deliver_amount", 0))
	return item_weight(item_type) * float(amount)


func mission_locked_preview_text() -> String:
	var previews: Array[String] = []
	for template in mission_templates():
		if mission_template_available(template):
			continue
		var faction_id := str(template.get("faction", ""))
		var requirement_text := mission_requirement_text(template).replace("Requires ", "")
		if requirement_text.is_empty():
			requirement_text = "More standing required"
		previews.append("%s: %s" % [faction_name(faction_id), requirement_text])
		if previews.size() >= 3:
			break
	if previews.is_empty():
		return "All current contract tiers unlocked."
	return "Upcoming: %s" % "  |  ".join(previews)


func actual_mission_xp_reward(mission: Dictionary) -> int:
	return STARHAUL_MISSION_LIB.actual_mission_xp_reward(mission)


func mission_needs_turn_in(mission: Dictionary) -> bool:
	return bool(mission.get("ready_to_turn_in", false))


func mission_target_label(mission: Dictionary) -> String:
	if mission_needs_turn_in(mission):
		return "Orbital Dock mission board"
	var station_room: String = mission_target_station_room(mission)
	if not station_room.is_empty():
		match station_room:
			"exchange":
				return "Orbital Dock exchange"
			"storage":
				return "Orbital Dock storage"
			"refinery":
				return "Orbital Dock refinery"
			"crafting":
				return "Orbital Dock crafting"
			"research":
				return "Orbital Dock research"
			"shipyard":
				return "Orbital Dock shipyard"
			"crew":
				return "Orbital Dock training"
			"mission":
				return "Orbital Dock mission board"
	var label := str(mission.get("target_label", "Station services"))
	if mission.has("target_map_coord"):
		label += "  |  %s" % mission_map_label(mission)
	return label


func mission_direction_text(mission: Dictionary) -> String:
	match str(mission.get("id", "")):
		"intro_tab_menu":
			return "Open field console  |  Visit each tab once"
		"intro_ship_cargo":
			return "Open field console  |  Cargo tab"
		"intro_scan_hostiles":
			return "Hold Q  |  Hostile sweep"
		"intro_first_combat":
			return "Engage marked hostile  |  Destroy target"
		"intro_map":
			return "Open field console  |  Map tab"
		"intro_leveling":
			return "Open field console  |  Skills tab"
		"intro_world_scan":
			return "Hold Q  |  Open world scan menu"
		"intro_scan_resources":
			return "Hold Q  |  Resource sweep"
		"intro_scan_derelicts":
			return "Hold Q  |  Derelict sweep"
		"intro_bounty_anomalies":
			return "Hold Q  |  Bounty or anomaly sweep"
	var station_room: String = mission_target_station_room(mission)
	if dock_screen.visible and not station_room.is_empty():
		if current_dock_room == "":
			return "Docked  |  Open %s" % station_room.capitalize()
		if current_dock_room != station_room:
			return "Docked  |  Return to main menu"
		if mission_needs_turn_in(mission):
			return "Docked  |  Turn in contract"
		match station_room:
			"exchange":
				return "Docked  |  Sell cargo"
			"storage":
				return "Docked  |  Move cargo to station"
			"refinery":
				return "Docked  |  Refine goods"
			"crafting":
				return "Docked  |  Open crafting"
			"research":
				return "Docked  |  Open research"
			"crew":
				return "Docked  |  Open training"
			"shipyard":
				return "Docked  |  Open shipyard"
	var target: Variant = get_mission_target_position(mission)
	if target == null:
		return "No guidance available"
	if mission.has("target_map_coord") and not current_map_matches_mission_location(mission) and mission_target_system_id(mission) == current_system_id:
		var target_coord := Vector2i(mission_target_map_coord(mission))
		return "%s  |  %d map%s" % [direction_label((target - player.global_position).angle()), mission_grid_distance(current_map_coord, target_coord), "s" if mission_grid_distance(current_map_coord, target_coord) != 1 else ""]
	var distance := int(round(player.global_position.distance_to(target)))
	var heading := direction_label((target - player.global_position).angle())
	return "%s  |  %dm" % [heading, distance]


func direction_label(angle: float) -> String:
	var normalized := wrapf(angle, 0.0, TAU)
	var directions := ["E", "NE", "N", "NW", "W", "SW", "S", "SE"]
	var index := int(round(normalized / (TAU / 8.0))) % directions.size()
	return directions[index]


func get_mission_target_position(mission: Dictionary = current_mission):
	if mission.is_empty():
		return null
	var mission_kind := str(mission.get("id", ""))
	if mission_needs_turn_in(mission):
		return station_guidance_position()
	if mission_target_system_id(mission) != current_system_id:
		return Vector2.RIGHT * (MAP_HALF_SPAN - 180.0)
	if mission.has("target_map_coord") and not current_map_matches_mission_location(mission):
		var target_coord := Vector2i(mission_target_map_coord(mission))
		var delta := target_coord - current_map_coord
		var direction := Vector2(float(sign(delta.x)), float(sign(delta.y))).normalized()
		if direction == Vector2.ZERO:
			return null
		return player.global_position + direction * (MAP_HALF_SPAN - 180.0)
	var station_room: String = mission_target_station_room(mission)
	if not station_room.is_empty():
		return station.global_position
	match mission_kind:
		"intro_mining", "intro_ship_scan":
			return find_nearest_resource_for_type(ORE)
		"intro_salvage":
			var intro_derelicts := nearby_derelict_ships_in_radius(3000.0)
			if not intro_derelicts.is_empty():
				return intro_derelicts[0].global_position
			return null
		"intro_first_combat":
			return find_nearest_hostile_for_faction("blackwake")
		"iridium_charter":
			return find_nearest_resource_for_type(ORE)
		"mine_crystal":
			return find_nearest_resource_for_type(CRYSTAL)
		"mine_ice":
			return find_nearest_resource_for_type(ICE)
		"salvage_scrap", "priority_recovery", "contested_recovery", "sealed_cache":
			var mission_derelict = find_mission_derelict(mission)
			if mission_derelict != null:
				return mission_derelict.global_position
			if mission.has("mission_derelict_position"):
				return mission["mission_derelict_position"]
			return null
		"derelict_quarantine":
			var contested_derelict = nearby_derelict_ships_in_radius(3000.0)
			if not contested_derelict.is_empty():
				return contested_derelict[0].global_position
			return find_nearest_hostile_for_faction("blackwake")
		"blackwake_kills", "blackwake_hunt", "bounty_tags", "breacher_breakup", "hostile_probe":
			return find_nearest_hostile_for_faction("blackwake")
		"survey_sweep", "deep_vector_survey":
			return find_nearest_resource_for_type(ORE)
		"sell_value", "trade_circuit", "refine_goods", "buy_upgrade", "fuel_exchange", "bulk_alloy_order":
			return station.global_position
		_:
			if mission_requires_delivery(mission):
				var delivery_item: StringName = mission.get("deliver_item", StringName())
				if is_metallic_ore(delivery_item):
					return find_nearest_resource_for_type(delivery_item)
			return null


func find_nearest_resource_for_type(resource_type: StringName):
	var best_position = null
	var best_distance := INF
	for child in resource_layer.get_children():
		if child.resource_type != resource_type:
			continue
		var distance: float = player.global_position.distance_to(child.global_position)
		if distance < best_distance:
			best_distance = distance
			best_position = child.global_position
	return best_position


func find_nearest_hostile_for_faction(faction_id: String):
	var best_position = null
	var best_distance := INF
	for hostile in hostile_contacts:
		if str(hostile.get("faction", "")) != faction_id:
			continue
		var distance: float = player.global_position.distance_to(hostile["position"])
		if distance < best_distance:
			best_distance = distance
			best_position = hostile["position"]
	return best_position


func mission_templates() -> Array[Dictionary]:
	var templates: Array[Dictionary] = STARHAUL_MISSION_LIB.mission_templates()
	templates.append_array(STARHAUL_MISSION_LIB.intro_mission_templates())
	return templates


func intro_mission_template_by_id(mission_id: String) -> Dictionary:
	for template in STARHAUL_MISSION_LIB.intro_mission_templates():
		if str(template.get("id", "")) == mission_id:
			return template.duplicate(true)
	return {}


func all_intro_mission_ids() -> Array[String]:
	var ids: Array[String] = []
	for template in STARHAUL_MISSION_LIB.intro_mission_templates():
		ids.append(str(template.get("id", "")))
	return ids


func is_intro_mission(mission: Dictionary) -> bool:
	return bool(mission.get("intro", false))


func intro_mission_completed(mission_id: String) -> bool:
	return bool(completed_intro_missions.get(mission_id, false))


func intro_mission_dependencies_met(template: Dictionary) -> bool:
	for dependency in template.get("intro_requires", []):
		if not intro_mission_completed(str(dependency)):
			return false
	return true


func intro_mission_is_board_posted(mission: Dictionary) -> bool:
	if not bool(mission.get("intro", false)):
		return false
	if bool(mission.get("intro_forced", false)):
		return false
	return bool(mission.get("intro_board_posted", true))


func intro_follow_up_mission_id(mission: Dictionary) -> String:
	return str(mission.get("intro_next", ""))


func primary_station_map_coord() -> Vector2i:
	return Vector2i(current_system_data.get("main_station_map", Vector2i(2, 1)))


func pick_intro_neighbor_map() -> Vector2i:
	var origin: Vector2i = current_map_coord
	var preferred_station_coord: Vector2i = primary_station_map_coord()
	if current_system_data.has("maps") and current_map_coord != preferred_station_coord:
		return current_map_coord
	for offset in [Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1), Vector2i(0, -1)]:
		var candidate: Vector2i = preferred_station_coord + offset
		if candidate.x < 0 or candidate.y < 0 or candidate.x >= SYSTEM_GRID_SIZE or candidate.y >= SYSTEM_GRID_SIZE:
			continue
		var candidate_map: Dictionary = current_system_data.get("maps", {}).get(map_key(candidate), {})
		if candidate_map.is_empty():
			continue
		if bool(candidate_map.get("is_solar_core", false)):
			continue
		return candidate
	return preferred_station_coord


func configure_intro_mission_instance(mission: Dictionary) -> Dictionary:
	var configured: Dictionary = mission.duplicate(true)
	configured["time_left"] = INF
	configured["persistent_offer"] = true
	configured["important"] = true
	configured["intro"] = true
	configured["target_system_id"] = current_system_id
	match str(configured.get("id", "")):
		"intro_head_to_board", "intro_station_inventory", "intro_refining", "intro_market", "intro_market_prices", "intro_crafting_explained", "intro_research", "intro_spec_training", "intro_ship_maintenance", "intro_restock_explained":
			configured["target_map_coord"] = primary_station_map_coord()
		"intro_fly_new_map":
			configured["target_map_coord"] = pick_intro_neighbor_map()
		"intro_jump_back_station":
			configured["target_map_coord"] = primary_station_map_coord()
	return configured


func apply_intro_mission_start_grants(mission: Dictionary) -> void:
	if bool(mission.get("intro_start_grants_applied", false)):
		return
	var granted_parts: Array[String] = []
	for grant_variant in mission.get("intro_start_grants", []):
		var grant: Dictionary = grant_variant
		var item_type: StringName = StringName(grant.get("type", StringName()))
		var count: int = int(grant.get("count", 0))
		if item_type == StringName() or count <= 0:
			continue
		var destination: String = str(grant.get("destination", "ship"))
		if destination == "station":
			add_item_to_station_storage(item_type, count)
			granted_parts.append("%s x%d to station inventory" % [str(get_item_definition(item_type).get("name", item_type)), count])
		else:
			cargo[item_type] += count
			granted_parts.append("%s x%d to ship cargo" % [str(get_item_definition(item_type).get("name", item_type)), count])
	mission["intro_start_grants_applied"] = true
	if not granted_parts.is_empty():
		last_status_message = "Intro support issued %s." % ", ".join(granted_parts)
		push_telemetry_event("Introduction support issued %s." % ", ".join(granted_parts), "mission")


func start_intro_mission_from_template(template: Dictionary, badge_text: String, step_text: String, body_text: String = "") -> void:
	if template.is_empty():
		return
	var mission: Dictionary = configure_intro_mission_instance(build_mission_offer(template))
	apply_intro_mission_start_grants(mission)
	active_missions.append(mission)
	set_tracked_mission_index(active_missions.size() - 1)
	mission_board_view = "active"
	var popup_body: String = body_text
	if popup_body.is_empty():
		popup_body = "%s\n\nTarget: %s" % [str(current_mission.get("description", "")), mission_target_label(current_mission)]
	open_intro_stage_popup(current_mission, badge_text, step_text, popup_body)
	update_hud()


func intro_newly_unlocked_board_titles(completed_mission_id: String) -> Array[String]:
	var titles: Array[String] = []
	for template in STARHAUL_MISSION_LIB.intro_mission_templates():
		if not intro_mission_is_board_posted(template):
			continue
		var template_id: String = str(template.get("id", ""))
		if intro_mission_completed(template_id):
			continue
		var dependencies: Array = template.get("intro_requires", [])
		if not dependencies.has(completed_mission_id):
			continue
		if intro_mission_dependencies_met(template):
			titles.append(str(template.get("short_name", template_id)))
	return titles


func intro_board_templates_available() -> Array[Dictionary]:
	var available: Array[Dictionary] = []
	if not should_show_onboarding():
		return available
	for template in STARHAUL_MISSION_LIB.intro_mission_templates():
		if not bool(template.get("intro", false)):
			continue
		if not intro_mission_is_board_posted(template):
			continue
		if intro_mission_completed(str(template.get("id", ""))):
			continue
		if not intro_mission_dependencies_met(template):
			continue
		available.append(template.duplicate(true))
	return available


func start_forced_intro_mission(mission_id: String) -> void:
	var template: Dictionary = intro_mission_template_by_id(mission_id)
	if template.is_empty():
		return
	active_missions.append(configure_intro_mission_instance(build_mission_offer(template)))
	set_tracked_mission_index(active_missions.size() - 1)
	mission_board_view = "active"
	update_hud()


func complete_intro_mission(mission: Dictionary, grant_rewards: bool = true) -> void:
	var mission_id: String = str(mission.get("id", ""))
	if mission_id.is_empty() or intro_mission_completed(mission_id):
		return
	completed_intro_missions[mission_id] = true
	if grant_rewards:
		var reward_credits: int = int(mission.get("reward_credits", 0))
		if reward_credits > 0:
			credits += reward_credits
			total_stats["credits_earned"] += reward_credits
			last_status_message = "Introduction complete: %s. +%d credits." % [str(mission.get("short_name", mission_id)), reward_credits]
			push_telemetry_event("%s complete. +%d credits." % [str(mission.get("short_name", mission_id)), reward_credits], "mission")


func open_intro_stage_popup(mission: Dictionary, badge_text: String, step_text: String, body_text: String, primary_text: String = "CONTINUE", mode: String = "intro_stage") -> void:
	open_guided_mission_popup(
		str(mission.get("short_name", "Introduction Mission")),
		badge_text,
		step_text,
		body_text,
		primary_text,
		"",
		mode
	)


func begin_intro_mission_flow() -> void:
	onboarding_offer_pending = false
	onboarding_declined = false
	onboarding_active = false
	completed_intro_missions["intro_welcome"] = true
	var welcome_reward: int = int(intro_mission_template_by_id("intro_welcome").get("reward_credits", 0))
	credits += welcome_reward
	total_stats["credits_earned"] += welcome_reward
	close_guided_mission_popup()
	start_intro_mission_from_template(
		intro_mission_template_by_id("intro_flight_controls"),
		"FORCED",
		"Stage 1  |  Flight check",
		"Welcome aboard. Complete a short movement check to prove the ship is under control and clear the lane for the next introduction mission."
	)
	refresh_mission_offers()


func handle_intro_mission_completion(mission_index: int = current_mission_index) -> void:
	if mission_index < 0 or mission_index >= active_missions.size():
		return
	set_tracked_mission_index(mission_index)
	if current_mission.is_empty() or not is_intro_mission(current_mission):
		return
	var finished_id: String = str(current_mission.get("id", ""))
	var finished_mission: Dictionary = current_mission.duplicate(true)
	var follow_up_id: String = intro_follow_up_mission_id(finished_mission)
	var newly_unlocked_titles: Array[String] = intro_newly_unlocked_board_titles(finished_id)
	complete_intro_mission(finished_mission, true)
	remove_active_mission_at(mission_index)
	mission_board_view = "active" if has_active_mission() else "available"
	if mission_board_view == "available":
		refresh_mission_offers()
	else:
		refresh_mission_board()
	if not follow_up_id.is_empty():
		var follow_up_template: Dictionary = intro_mission_template_by_id(follow_up_id)
		if not follow_up_template.is_empty() and not intro_mission_completed(follow_up_id):
			if intro_mission_is_board_posted(follow_up_template):
				open_guided_mission_popup(
					str(finished_mission.get("short_name", "Introduction Mission")),
					"COMPLETE",
					"Gold board mission unlocked",
					"%s complete. %s is now posted at the top of the mission board." % [
						str(finished_mission.get("short_name", "Introduction Mission")),
						str(follow_up_template.get("short_name", follow_up_id)),
					],
					"CONTINUE",
					"",
					"intro_stage"
				)
			else:
				var step_text: String = "Continuation mission"
				if bool(finished_mission.get("intro_forced", false)) and follow_up_id == "intro_head_to_board":
					step_text = "Stage 2  |  Report to station"
				start_intro_mission_from_template(
					follow_up_template,
					"CONTINUATION" if not bool(finished_mission.get("intro_forced", false)) else "FORCED",
					step_text,
					"%s complete. Next stage online.\n\n%s" % [
						str(finished_mission.get("short_name", "Introduction Mission")),
						str(follow_up_template.get("description", "")),
					]
				)
				return
	if finished_id == "intro_head_to_board":
		open_guided_mission_popup(
			"MISSION BOARD UNLOCKED",
			"INTRO",
			"Introduction contracts available",
			"The important introduction missions are now posted at the top of the mission board in gold. Missions with blue follow-ups will roll directly into the next stage as soon as you finish them.",
			"CONTINUE",
			"",
			"intro_stage"
		)
	elif not newly_unlocked_titles.is_empty():
		open_guided_mission_popup(
			str(finished_mission.get("short_name", "Introduction Mission")),
			"COMPLETE",
			"New missions posted",
			"%s complete. Newly unlocked intro mission%s: %s." % [
				str(finished_mission.get("short_name", "Introduction Mission")),
				"s" if newly_unlocked_titles.size() != 1 else "",
				", ".join(newly_unlocked_titles),
			],
			"CONTINUE",
			"",
			"intro_stage"
		)
	else:
		open_guided_mission_popup(
			str(finished_mission.get("short_name", "Introduction Mission")),
			"COMPLETE",
			"Mission archived",
			"%s complete. That introduction mission has been removed from the board." % str(finished_mission.get("short_name", "Introduction Mission")),
			"CONTINUE",
			"",
			"intro_stage"
		)
	update_hud()


# --- Mission board / contract generation ---
# --- Mission board / contract generation ---
func mission_template_available(template: Dictionary) -> bool:
	if bool(template.get("intro", false)):
		if not should_show_onboarding():
			return false
		if intro_mission_completed(str(template.get("id", ""))):
			return false
		if not intro_mission_dependencies_met(template):
			return false
		if not intro_mission_is_board_posted(template):
			return false
		return true
	var faction_id := str(template.get("faction", ""))
	var required_rep: int = int(template.get("min_rep", 0))
	var required_rank := str(template.get("min_rank", ""))
	if not required_rank.is_empty():
		required_rep = max(required_rep, faction_rank_min_rep(required_rank))
	if faction_rep_value(faction_id) < required_rep:
		return false
	var required_mining_stage: int = int(template.get("required_mining_stage", -1))
	if required_mining_stage >= 0 and current_mining_stage() < required_mining_stage:
		return false
	var cargo_weight_required: float = mission_cargo_weight_requirement(template)
	if cargo_weight_required > 0.0 and cargo_weight_required > float(ship_stats["cargo_capacity"]):
		return false
	return true


func refresh_mission_offers() -> void:
	mission_offers.clear()
	var intro_templates: Array[Dictionary] = intro_board_templates_available()
	for intro_template in intro_templates:
		mission_offers.append(build_mission_offer(intro_template))
	var available_templates := STARHAUL_MISSION_LIB.mission_templates().filter(func(template: Dictionary) -> bool:
		return mission_template_available(template)
	)
	var offer_count: int = min(max(MISSION_OFFER_COUNT - mission_offers.size(), 0), available_templates.size())
	for _offer_index in range(offer_count):
		var next_offer := make_random_mission_offer("")
		if next_offer.is_empty():
			break
		mission_offers.append(next_offer)

	if is_node_ready():
		refresh_mission_board()


func make_random_mission_offer(excluded_template_id: String) -> Dictionary:
	var taken_ids := {}
	for active_mission in active_missions:
		taken_ids[str(active_mission.get("id", ""))] = true
	for offer in mission_offers:
		taken_ids[str(offer.get("id", ""))] = true

	var candidate_templates: Array[Dictionary] = []
	for template in STARHAUL_MISSION_LIB.mission_templates():
		if not mission_template_available(template):
			continue
		var template_id := str(template.get("id", ""))
		if template_id == excluded_template_id:
			continue
		if taken_ids.has(template_id):
			continue
		candidate_templates.append(template.duplicate(true))

	if candidate_templates.is_empty():
		return {}

	var pick_index := rng.randi_range(0, candidate_templates.size() - 1)
	return build_mission_offer(candidate_templates[pick_index])


func build_mission_offer(template: Dictionary) -> Dictionary:
	var offer := template.duplicate(true)
	if not offer.has("progress_key"):
		offer["progress_key"] = str(offer.get("id", ""))
	offer["progress"] = 0
	offer["ready_to_turn_in"] = false
	offer["offer_id"] = "offer_%d" % next_mission_offer_uid
	offer["time_left"] = INF if bool(offer.get("persistent_offer", false)) else rng.randf_range(MISSION_OFFER_MIN_LIFETIME, MISSION_OFFER_MAX_LIFETIME)
	next_mission_offer_uid += 1
	return offer


func handle_mission_offer_rotation(delta: float) -> void:
	if mission_offers.is_empty():
		return

	var changed := false
	for offer_index in range(mission_offers.size()):
		var offer: Dictionary = mission_offers[offer_index]
		offer["time_left"] = max(float(offer.get("time_left", MISSION_OFFER_MIN_LIFETIME)) - delta, 0.0)
		if float(offer["time_left"]) > 0.0:
			mission_offers[offer_index] = offer
			continue

		var expired_id := str(offer.get("id", ""))
		mission_offers.remove_at(offer_index)
		var replacement := make_random_mission_offer(expired_id)
		if replacement.is_empty():
			offer["time_left"] = rng.randf_range(MISSION_OFFER_MIN_LIFETIME, MISSION_OFFER_MAX_LIFETIME)
			mission_offers.insert(offer_index, offer)
		else:
			mission_offers.insert(offer_index, replacement)
		changed = true
		break

	if changed and is_node_ready():
		refresh_mission_board()


func set_mission_board_view(view_name: String) -> void:
	mission_board_view = view_name
	refresh_mission_board()


func sanitize_mission_definition(mission: Dictionary) -> Dictionary:
	return STARHAUL_MISSION_LIB.sanitize_mission_definition(mission)


# --- Mission accept / delivery flow ---
func accept_mission(offer_index: int) -> void:
	if offer_index < 0 or offer_index >= mission_offers.size():
		return
	if active_missions.size() >= active_mission_limit():
		last_status_message = "Mission queue full. Track or finish one of your three active contracts first."
		push_telemetry_event("Mission board limit reached. Maximum three active contracts.", "warning")
		update_hud()
		return

	assign_mission_from_offer(offer_index)


func mission_requires_delivery(mission: Dictionary) -> bool:
	return STARHAUL_MISSION_LIB.mission_requires_delivery(mission)


func mission_delivery_status_text(mission: Dictionary) -> String:
	if not mission_requires_delivery(mission):
		return "No cargo hand-in required"
	var item_type: StringName = mission["deliver_item"]
	var required: int = int(mission["deliver_amount"])
	var available: int = int(cargo[item_type]) + count_item_in_station_storage(item_type)
	return "%s %d / %d ready" % [get_item_definition(item_type)["name"], available, required]


func sync_active_delivery_mission_progress() -> void:
	for mission in active_missions:
		if not mission_requires_delivery(mission):
			continue
		var item_type: StringName = mission["deliver_item"]
		var required: int = int(mission.get("deliver_amount", mission.get("goal", 0)))
		var available: int = total_accessible_item_count(item_type)
		mission["progress"] = min(available, required)
		if available >= required:
			mission["ready_to_turn_in"] = true
	ensure_tracked_mission_valid()


func count_item_in_station_storage(item_type: StringName) -> int:
	var total := 0
	for stack in station_storage:
		if stack["type"] == item_type:
			total += int(stack["count"])
	return total


func consume_station_storage_item(item_type: StringName, amount: int) -> int:
	var remaining: int = amount
	for index in range(station_storage.size() - 1, -1, -1):
		if remaining <= 0:
			break
		var stack: Dictionary = station_storage[index]
		if stack["type"] != item_type:
			continue
		var take_amount: int = min(remaining, int(stack["count"]))
		stack["count"] -= take_amount
		remaining -= take_amount
		if stack["count"] <= 0:
			station_storage.remove_at(index)
		else:
			station_storage[index] = stack
	return amount - remaining


func consume_mission_delivery_items(mission: Dictionary) -> bool:
	if not mission_requires_delivery(mission):
		return true

	var item_type: StringName = mission["deliver_item"]
	var required: int = int(mission["deliver_amount"])
	var available_total: int = int(cargo[item_type]) + count_item_in_station_storage(item_type)
	if available_total < required:
		last_status_message = "Contract cargo missing. Need %d more %s." % [required - available_total, get_item_definition(item_type)["name"]]
		push_telemetry_event("Turn-in blocked. Contract cargo is missing.", "warning")
		return false

	var from_ship: int = min(int(cargo[item_type]), required)
	cargo[item_type] -= from_ship
	var remaining: int = required - from_ship
	if remaining > 0:
		consume_station_storage_item(item_type, remaining)
	return true


func turn_in_active_mission(mission_index: int = current_mission_index) -> void:
	if mission_index < 0 or mission_index >= active_missions.size():
		return
	set_tracked_mission_index(mission_index)
	if is_intro_mission(current_mission):
		last_status_message = "Introduction missions archive themselves when the objective completes."
		update_hud()
		return
	if not mission_needs_turn_in(current_mission):
		last_status_message = "Finish the active contract before turning it in."
		update_hud()
		return
	if not is_station_in_range():
		last_status_message = "Return to the station to turn in your contract."
		push_telemetry_event("Contract ready. Dock at the station for turn-in.", "mission")
		update_hud()
		return
	if not consume_mission_delivery_items(current_mission):
		update_hud()
		return

	var reward_multiplier := 1.0 + mission_credit_skill_bonus()
	var faction_id := str(current_mission.get("faction", ""))
	reward_multiplier *= mission_credit_bonus_multiplier(faction_id)
	var reward_credits := int(round(current_mission["reward_credits"] * reward_multiplier))
	var rep_reward: int = int(current_mission.get("rep_reward", 0)) + mission_rep_bonus(faction_id) + mission_rep_skill_bonus()
	credits += reward_credits
	total_stats["credits_earned"] += reward_credits
	total_stats["missions_completed"] += 1
	add_faction_reputation(faction_id, rep_reward, str(current_mission.get("short_name", "")))
	gain_experience(actual_mission_xp_reward(current_mission))
	last_status_message = "Mission turned in. Reward: %d credits, +%d %s rep." % [reward_credits, rep_reward, faction_name(faction_id)]
	push_telemetry_event("%s contract turned in. +%d rep secured." % [faction_name(faction_id), rep_reward], "mission")
	remove_active_mission_at(mission_index)
	mission_board_view = "active" if has_active_mission() else "available"
	if mission_board_view == "available":
		refresh_mission_offers()
	else:
		refresh_mission_board()
	update_hud()


func refresh_mission_board() -> void:
	for child in mission_offer_list.get_children():
		child.queue_free()
	mission_board_action_buttons.clear()
	ensure_tracked_mission_valid()

	var showing_active := mission_board_view == "active"
	style_mission_board_tabs(showing_active)

	if showing_active:
		if has_active_mission():
			mission_board_summary.text = "%d active contract%s  |  Tracking %s" % [
				active_missions.size(),
				"s" if active_missions.size() != 1 else "",
				str(current_mission.get("short_name", "None")),
			]
			for mission_index in range(active_missions.size()):
				add_mission_card(active_missions[mission_index], mission_index, true)
		else:
			mission_board_summary.text = "No active contract. Accept one from the available board."
			add_mission_empty_state("No active missions.")
		return

	var unlocked_count := mission_templates().filter(func(template: Dictionary) -> bool:
		return mission_template_available(template)
	).size()
	mission_board_summary.text = "Open contracts  %d / %d unlocked" % [unlocked_count, mission_templates().size()]
	if mission_offers.is_empty():
		add_mission_empty_state("No contracts posted right now.")
		return

	for offer_index in range(mission_offers.size()):
		var offer: Dictionary = mission_offers[offer_index]
		add_mission_card(offer, offer_index, false)


func add_mission_empty_state(message: String) -> void:
	var empty_label := Label.new()
	empty_label.text = message
	empty_label.add_theme_font_size_override("font_size", 14)
	empty_label.add_theme_color_override("font_color", Color(0.66, 0.74, 0.84))
	mission_offer_list.add_child(empty_label)


func style_mission_board_tabs(showing_active: bool) -> void:
	style_button_secondary(mission_available_button)
	style_button_secondary(mission_active_button)
	if showing_active:
		style_button_primary(mission_active_button, Color(0.22, 0.56, 0.88, 0.96), Color(0.3, 0.67, 0.98, 0.96))
	else:
		style_button_primary(mission_available_button, Color(0.22, 0.56, 0.88, 0.96), Color(0.3, 0.67, 0.98, 0.96))


func add_mission_card(mission: Dictionary, offer_index: int, active_card: bool) -> void:
		var mission_index: int = offer_index
		var card := PanelContainer.new()
		var is_important_mission: bool = bool(mission.get("important", false))
		if is_important_mission:
			card.add_theme_stylebox_override("panel", make_panel_style(Color(0.12, 0.1, 0.05, 0.96), Color(1.0, 0.84, 0.34, 0.58), 16, 2))
		else:
			card.add_theme_stylebox_override("panel", make_panel_style(Color(0.06, 0.09, 0.14, 0.92), Color(0.95, 0.72, 0.27, 0.14), 16, 1))

		var margin := MarginContainer.new()
		margin.add_theme_constant_override("margin_left", 12)
		margin.add_theme_constant_override("margin_top", 12)
		margin.add_theme_constant_override("margin_right", 12)
		margin.add_theme_constant_override("margin_bottom", 12)
		card.add_child(margin)

		var row := HBoxContainer.new()
		row.add_theme_constant_override("separation", 12)
		margin.add_child(row)

		var text_column := VBoxContainer.new()
		text_column.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		text_column.add_theme_constant_override("separation", 4)
		row.add_child(text_column)

		var title := Label.new()
		title.text = mission["short_name"]
		title.add_theme_font_size_override("font_size", 17)
		title.add_theme_color_override("font_color", Color(1.0, 0.9, 0.56) if is_important_mission else Color(0.97, 0.98, 1.0))
		text_column.add_child(title)

		var faction_line := Label.new()
		var issuer_id := str(mission.get("faction", ""))
		faction_line.text = "Issuer: %s  |  Rep +%d" % [faction_name(issuer_id), int(mission.get("rep_reward", 0))]
		faction_line.add_theme_font_size_override("font_size", 12)
		faction_line.add_theme_color_override("font_color", get_faction_definition(issuer_id)["color"])
		text_column.add_child(faction_line)

		var description := Label.new()
		description.text = mission["description"]
		description.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		description.add_theme_font_size_override("font_size", 13)
		description.add_theme_color_override("font_color", Color(0.72, 0.82, 0.92))
		text_column.add_child(description)

		var details := Label.new()
		var preview_credits: int = int(round(float(mission["reward_credits"]) * mission_credit_bonus_multiplier(issuer_id) * (1.0 + mission_credit_skill_bonus())))
		var preview_rep: int = int(mission.get("rep_reward", 0)) + mission_rep_bonus(issuer_id)
		details.text = "Goal %d  |  Reward %d CR + %d XP  |  Rep +%d" % [mission["goal"], preview_credits, actual_mission_xp_reward(mission), preview_rep]
		details.add_theme_font_size_override("font_size", 12)
		details.add_theme_color_override("font_color", Color(0.96, 0.82, 0.48))
		text_column.add_child(details)

		var requirement_text := mission_requirement_text(mission)
		if not requirement_text.is_empty():
			var requirement_line := Label.new()
			requirement_line.text = requirement_text
			requirement_line.add_theme_font_size_override("font_size", 11)
			requirement_line.add_theme_color_override("font_color", Color(0.78, 0.86, 0.96) if mission_required_rank_name(mission).is_empty() else Color(0.98, 0.88, 0.54))
			text_column.add_child(requirement_line)

		if not active_card:
			var posting_meta := Label.new()
			posting_meta.text = mission_target_label(mission) if is_important_mission else "%s  |  Refresh %s" % [mission_target_label(mission), mission_offer_time_label(mission)]
			posting_meta.add_theme_font_size_override("font_size", 12)
			posting_meta.add_theme_color_override("font_color", Color(0.84, 0.9, 0.98))
			text_column.add_child(posting_meta)
		else:
			var nav := Label.new()
			nav.text = mission_target_label(mission)
			nav.add_theme_font_size_override("font_size", 12)
			nav.add_theme_color_override("font_color", Color(0.56, 0.84, 1.0))
			text_column.add_child(nav)

		if mission_requires_delivery(mission):
			var delivery := Label.new()
			delivery.text = "Turn-in %s" % mission_delivery_status_text(mission)
			delivery.add_theme_font_size_override("font_size", 12)
			delivery.add_theme_color_override("font_color", Color(0.84, 0.9, 0.98))
			text_column.add_child(delivery)

		if active_card:
			var status := Label.new()
			status.text = "Progress %s" % mission_progress_label(mission)
			if mission_needs_turn_in(mission):
				status.text += "  |  Ready to turn in"
			elif mission_index == current_mission_index:
				status.text += "  |  Tracked"
			status.add_theme_font_size_override("font_size", 12)
			status.add_theme_color_override("font_color", Color(0.82, 0.94, 0.72) if mission_needs_turn_in(mission) else Color(0.82, 0.88, 0.96))
			text_column.add_child(status)

		var action_button := Button.new()
		action_button.custom_minimum_size = Vector2(84, 84)
		action_button.alignment = HORIZONTAL_ALIGNMENT_CENTER
		action_button.vertical_icon_alignment = VERTICAL_ALIGNMENT_CENTER
		action_button.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		if active_card:
			if mission_needs_turn_in(mission):
				if is_station_in_range():
					action_button.text = "TURN IN"
					action_button.disabled = false
					action_button.pressed.connect(func(target_index: int = mission_index) -> void:
						turn_in_active_mission(target_index)
					)
				else:
					action_button.text = "DOCK"
					action_button.disabled = true
			else:
				if mission_index == current_mission_index:
					action_button.text = "TRACKED"
					action_button.disabled = true
				else:
					action_button.text = "TRACK"
					action_button.pressed.connect(func(target_index: int = mission_index) -> void:
						set_tracked_mission_index(target_index)
						refresh_mission_board()
						update_hud()
					)
		else:
			if active_missions.size() >= active_mission_limit():
				action_button.text = "LOCKED"
				action_button.disabled = true
			else:
				action_button.text = "ACCEPT"
				action_button.pressed.connect(func() -> void: accept_mission(offer_index))
		if is_important_mission:
			style_button_primary(action_button, Color(0.62, 0.44, 0.12, 0.98), Color(0.78, 0.56, 0.18, 0.98))
		else:
			style_button_primary(action_button, Color(0.15, 0.46, 0.78, 0.96), Color(0.23, 0.6, 0.92, 0.96))
		if onboarding_active and next_onboarding_step_id() == "mission" and not active_card and not has_active_mission():
			action_button.add_theme_stylebox_override("normal", make_panel_style(Color(0.22, 0.18, 0.08, 0.98), Color(1.0, 0.84, 0.34, 0.72), 16, 2))
			action_button.add_theme_stylebox_override("hover", make_panel_style(Color(0.28, 0.22, 0.08, 0.98), Color(1.0, 0.9, 0.46, 0.84), 16, 2))
			action_button.add_theme_stylebox_override("pressed", make_panel_style(Color(0.18, 0.14, 0.06, 0.98), Color(1.0, 0.78, 0.28, 0.8), 16, 2))
		attach_button_audio(action_button)
		if active_card:
			mission_board_action_buttons.append(action_button)
		row.add_child(action_button)

		mission_offer_list.add_child(card)


func refinery_source_display_name(source_mode: String) -> String:
	return "Station Inventory" if source_mode == "station" else "Ship Inventory"


func set_refinery_source(source_mode: String) -> void:
	selected_refinery_source = "station" if source_mode == "station" else "ship"
	if selected_refinery_input != StringName() and refinery_source_item_count(selected_refinery_input, selected_refinery_source) <= 0:
		selected_refinery_input = &""
		selected_refinery_amount = 0
	refresh_refinery_inventory()


func refinery_source_item_count(item_type: StringName, source_mode: String = selected_refinery_source) -> int:
	if source_mode == "station":
		return count_item_in_station_storage(item_type)
	return int(cargo.get(item_type, 0))


func get_refinable_inputs(source_mode: String = selected_refinery_source) -> Array[StringName]:
	var inputs: Array[StringName] = []
	for item_type in refinery_recipes.keys():
		if refinery_source_item_count(item_type, source_mode) > 0:
			inputs.append(item_type)
	return inputs


func refinery_preview_output_info(item_type: StringName, refine_amount: int) -> Dictionary:
	var recipe: Dictionary = refinery_recipes.get(item_type, {})
	if recipe.is_empty():
		return {"label": "none", "icon": null, "projected_output": 0, "output_type": StringName()}
	var throughput_bonus_units: int = int(floor(float(refine_amount) * research_refinery_throughput_bonus()))
	var output_bonus_units: int = int(floor(float(refine_amount) * research_refinery_output_bonus()))
	var projected_output: int = refine_amount + throughput_bonus_units + output_bonus_units
	var random_outputs: Array = recipe.get("random_outputs", [])
	if not random_outputs.is_empty():
		return {
			"label": "Random Basic Ingot x%d" % projected_output,
			"icon": item_icons.get(random_outputs[0], null),
			"projected_output": projected_output,
			"output_type": StringName(random_outputs[0]),
		}
	var output_type: StringName = StringName(recipe.get("output", StringName()))
	return {
		"label": "%s x%d" % [str(get_item_definition(output_type).get("name", output_type)), projected_output],
		"icon": item_icons.get(output_type, null),
		"projected_output": projected_output,
		"output_type": output_type,
	}


func refinery_output_weight_for_counts(output_counts: Dictionary) -> float:
	var total_weight := 0.0
	for output_variant in output_counts.keys():
		total_weight += item_weight(StringName(output_variant)) * int(output_counts[output_variant])
	return total_weight


func simulate_station_storage_fit(output_counts: Dictionary) -> bool:
	var storage_copy: Array[Dictionary] = station_storage.duplicate(true)
	for output_variant in output_counts.keys():
		var item_type: StringName = StringName(output_variant)
		var remaining: int = int(output_counts[output_variant])
		for index in range(storage_copy.size()):
			var stack: Dictionary = storage_copy[index]
			if StringName(stack.get("type", StringName())) != item_type:
				continue
			var free_stack_space: int = STATION_STACK_LIMIT - int(stack.get("count", 0))
			if free_stack_space <= 0:
				continue
			var portion: int = min(remaining, free_stack_space)
			stack["count"] = int(stack.get("count", 0)) + portion
			storage_copy[index] = stack
			remaining -= portion
			if remaining <= 0:
				break
		while remaining > 0 and storage_copy.size() < station_storage_capacity:
			var new_stack_amount: int = min(remaining, STATION_STACK_LIMIT)
			storage_copy.append({"type": item_type, "count": new_stack_amount})
			remaining -= new_stack_amount
		if remaining > 0:
			return false
	return true


func refinery_job_output_counts(item_type: StringName, refine_amount: int) -> Dictionary:
	var recipe: Dictionary = refinery_recipes.get(item_type, {})
	if recipe.is_empty():
		return {}
	var output_preview: Dictionary = refinery_preview_output_info(item_type, refine_amount)
	var total_output: int = int(output_preview.get("projected_output", refine_amount))
	var output_counts := {}
	var random_outputs: Array = recipe.get("random_outputs", [])
	if random_outputs.is_empty():
		var output_type: StringName = StringName(recipe.get("output", StringName()))
		output_counts[output_type] = total_output
		return output_counts
	for output_index in range(total_output):
		var rolled_output: StringName = roll_refinery_output(recipe, item_type)
		output_counts[rolled_output] = int(output_counts.get(rolled_output, 0)) + 1
	return output_counts


func refinery_output_counts_from_queue(output_queue: Array[Dictionary]) -> Dictionary:
	var output_counts: Dictionary = {}
	for cycle_variant in output_queue:
		var cycle_outputs: Dictionary = cycle_variant
		for output_variant in cycle_outputs.keys():
			var output_type: StringName = StringName(output_variant)
			output_counts[output_type] = int(output_counts.get(output_type, 0)) + int(cycle_outputs[output_variant])
	return output_counts


func apply_refinery_output_to_source(output_counts: Dictionary, source_mode: String) -> bool:
	if source_mode == "station":
		if not simulate_station_storage_fit(output_counts):
			return false
		for output_variant in output_counts.keys():
			add_item_to_station_storage(StringName(output_variant), int(output_counts[output_variant]))
		return true
	for output_variant in output_counts.keys():
		cargo[StringName(output_variant)] += int(output_counts[output_variant])
	return true


func refinery_output_summary_text(output_counts: Dictionary) -> String:
	var parts: Array[String] = []
	for output_variant in output_counts.keys():
		var item_type: StringName = StringName(output_variant)
		parts.append("%s x%d" % [str(get_item_definition(item_type).get("name", item_type)), int(output_counts[output_variant])])
	return ", ".join(parts)


func roll_refinery_output(recipe: Dictionary, input_type: StringName) -> StringName:
	var random_outputs: Array = recipe.get("random_outputs", [])
	if random_outputs.is_empty():
		return StringName(recipe.get("output", StringName()))
	var rolled_output: StringName = StringName(random_outputs[rng.randi_range(0, random_outputs.size() - 1)])
	if input_type == SCRAP and rolled_output == IRON_INGOT and rng.randf() < industry_refining_quality_bonus():
		var premium_outputs: Array[StringName] = [NICKEL_INGOT, COPPER_INGOT]
		rolled_output = premium_outputs[rng.randi_range(0, premium_outputs.size() - 1)]
	return rolled_output


func refinery_output_queue_for_batch(item_type: StringName, refine_amount: int) -> Array[Dictionary]:
	var queue: Array[Dictionary] = []
	if refine_amount <= 0:
		return queue
	var recipe: Dictionary = refinery_recipes.get(item_type, {})
	if recipe.is_empty():
		return queue
	for _index in range(refine_amount):
		queue.append({})
	var output_preview: Dictionary = refinery_preview_output_info(item_type, refine_amount)
	var total_output: int = max(int(output_preview.get("projected_output", refine_amount)), refine_amount)
	var random_outputs: Array = recipe.get("random_outputs", [])
	if random_outputs.is_empty():
		var output_type: StringName = StringName(recipe.get("output", StringName()))
		for cycle_index in range(refine_amount):
			queue[cycle_index][output_type] = int(queue[cycle_index].get(output_type, 0)) + 1
		for extra_index in range(max(total_output - refine_amount, 0)):
			var bonus_slot: int = extra_index % refine_amount
			queue[bonus_slot][output_type] = int(queue[bonus_slot].get(output_type, 0)) + 1
		return queue
	for output_index in range(total_output):
		var rolled_output: StringName = roll_refinery_output(recipe, item_type)
		var target_slot: int = output_index % refine_amount
		queue[target_slot][rolled_output] = int(queue[target_slot].get(rolled_output, 0)) + 1
	return queue


func request_refinery_input_amount(item_type: StringName, source_mode: String = selected_refinery_source) -> void:
	var available: int = refinery_source_item_count(item_type, source_mode)
	if available <= 0:
		last_status_message = "No %s available in %s." % [str(get_item_definition(item_type).get("name", item_type)), refinery_source_display_name(source_mode).to_lower()]
		update_hud()
		return
	pending_transfer = {
		"direction": "refine_load",
		"item_type": item_type,
		"source": source_mode,
	}
	transfer_popup_title.text = "LOAD %s" % str(get_item_definition(item_type).get("name", item_type))
	transfer_popup_info.text = "Select amount from %s (max %d)." % [refinery_source_display_name(source_mode), available]
	transfer_amount.min_value = 1.0
	transfer_amount.max_value = float(available)
	transfer_amount.value = float(available)
	transfer_amount.visible = true
	transfer_popup.visible = true
	hide_tooltip()


func request_selected_refinery_amount_change() -> void:
	if selected_refinery_input == StringName():
		return
	request_refinery_input_amount(selected_refinery_input, selected_refinery_source)


func confirm_refinery_input_load(item_type: StringName, source_mode: String, amount: int) -> void:
	var available: int = refinery_source_item_count(item_type, source_mode)
	if available <= 0:
		selected_refinery_input = &""
		selected_refinery_amount = 0
		refresh_refinery_inventory()
		return
	selected_refinery_source = source_mode
	selected_refinery_input = item_type
	selected_refinery_amount = clampi(amount, 1, available)
	refresh_refinery_inventory()


func refresh_refinery_inventory() -> void:
	for child in refinery_inventory_grid.get_children():
		child.queue_free()

	refinery_inventory_buttons.clear()
	refinery_inventory_caption.text = refinery_source_display_name(selected_refinery_source).to_upper()
	refinery_inventory_header.text = "%s feed can be loaded directly into the refinery after amount confirmation." % refinery_source_display_name(selected_refinery_source)
	apply_refinery_tab_styles()
	var inputs: Array[StringName] = get_refinable_inputs(selected_refinery_source)
	if selected_refinery_input != StringName() and refinery_source_item_count(selected_refinery_input, selected_refinery_source) <= 0:
		selected_refinery_input = &""
		selected_refinery_amount = 0
	if inputs.is_empty():
		refinery_inventory_hint.text = "No refinery-ready stock in %s." % refinery_source_display_name(selected_refinery_source).to_lower()
		var empty_label := Label.new()
		empty_label.text = "Refinery-ready cargo will appear here."
		empty_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		empty_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		empty_label.custom_minimum_size = Vector2(0, 96)
		empty_label.add_theme_font_size_override("font_size", 13)
		empty_label.add_theme_color_override("font_color", Color(0.45, 0.52, 0.62))
		refinery_inventory_grid.add_child(empty_label)
		refresh_refinery_controls()
		return

	refinery_inventory_hint.text = "Click a raw material to load an amount into the refinery."
	for item_type in inputs:
		var available: int = refinery_source_item_count(item_type, selected_refinery_source)
		var button := Button.new()
		button.custom_minimum_size = Vector2(116, 110)
		button.focus_mode = Control.FOCUS_NONE
		button.icon_alignment = HORIZONTAL_ALIGNMENT_CENTER
		button.expand_icon = true
		button.alignment = HORIZONTAL_ALIGNMENT_CENTER
		button.vertical_icon_alignment = VERTICAL_ALIGNMENT_TOP
		button.icon = item_icons[item_type]
		button.text = "\n%s\nx%d" % [str(get_item_definition(item_type).get("name", item_type)), available]
		button.pressed.connect(func(target_item_type: StringName = item_type, target_source: String = selected_refinery_source) -> void:
			request_refinery_input_amount(target_item_type, target_source)
		)
		button.mouse_entered.connect(func(target_item_type: StringName = item_type, target_source: String = selected_refinery_source) -> void:
			tooltip_name.text = str(get_item_definition(target_item_type).get("name", target_item_type))
			tooltip_body.text = "Load from %s for refining." % refinery_source_display_name(target_source)
			inventory_tooltip.visible = true
			update_tooltip_position()
		)
		button.mouse_exited.connect(hide_tooltip)
		style_inventory_slot(button)
		attach_button_audio(button)
		if item_type == selected_refinery_input:
			button.add_theme_stylebox_override("normal", make_panel_style(Color(0.16, 0.22, 0.3, 0.96), Color(1.0, 0.74, 0.34, 0.55), 16, 2))
			button.add_theme_stylebox_override("hover", make_panel_style(Color(0.18, 0.25, 0.34, 0.98), Color(1.0, 0.8, 0.42, 0.65), 16, 2))
			button.add_theme_stylebox_override("pressed", make_panel_style(Color(0.14, 0.2, 0.28, 0.98), Color(1.0, 0.72, 0.3, 0.65), 16, 2))
		refinery_inventory_grid.add_child(button)
		refinery_inventory_buttons.append(button)

	refresh_refinery_controls()


func apply_refinery_tab_styles() -> void:
	style_button_secondary(refinery_ship_tab_button)
	style_button_secondary(refinery_station_tab_button)
	refinery_ship_tab_button.disabled = refinery_job_active
	refinery_station_tab_button.disabled = refinery_job_active
	var active_button: Button = refinery_station_tab_button if selected_refinery_source == "station" else refinery_ship_tab_button
	active_button.add_theme_stylebox_override("normal", make_panel_style(Color(0.18, 0.24, 0.31, 0.98), Color(0.98, 0.8, 0.42, 0.48), 14, 2))
	active_button.add_theme_stylebox_override("hover", make_panel_style(Color(0.2, 0.27, 0.35, 0.98), Color(1.0, 0.84, 0.5, 0.6), 14, 2))
	active_button.add_theme_stylebox_override("pressed", make_panel_style(Color(0.15, 0.21, 0.27, 0.98), Color(0.98, 0.76, 0.36, 0.62), 14, 2))


func update_refinery_job(delta: float) -> void:
	if not refinery_job_active:
		return
	refinery_job_timer = min(refinery_job_timer + delta, refinery_job_duration)
	refinery_progress.value = clampf((refinery_job_timer / max(refinery_job_duration, 0.01)) * 100.0, 0.0, 100.0)
	if refinery_job_timer < refinery_job_duration:
		return
	refinery_job_timer = 0.0
	refinery_progress.value = 0.0
	if refinery_job_source == "station":
		if consume_station_storage_item(refinery_job_input, 1) <= 0:
			last_status_message = "Refinery input missing from station inventory."
			push_telemetry_event("Refinery halted. Station input stock was interrupted.", "warning")
			stop_refinery_job()
			return
	else:
		var current_ship_amount: int = int(cargo.get(refinery_job_input, 0))
		if current_ship_amount <= 0:
			last_status_message = "Refinery input missing from ship inventory."
			push_telemetry_event("Refinery halted. Ship input stock was interrupted.", "warning")
			stop_refinery_job()
			return
		cargo[refinery_job_input] = current_ship_amount - 1
	var cycle_outputs: Dictionary = {}
	if not refinery_job_output_queue.is_empty():
		cycle_outputs = refinery_job_output_queue.pop_front()
	if cycle_outputs.is_empty() and not refinery_job_pending_outputs.is_empty():
		var fallback_key_variant: Variant = refinery_job_pending_outputs.keys()[0]
		var fallback_output_type: StringName = StringName(fallback_key_variant)
		cycle_outputs[fallback_output_type] = 1
	if not apply_refinery_output_to_source(cycle_outputs, refinery_job_source):
		last_status_message = "No room in %s for refinery output." % refinery_source_display_name(refinery_job_source).to_lower()
		push_telemetry_event("Refinery output blocked by full destination storage.", "warning")
		refinery_job_active = false
		refinery_job_pending_outputs = {}
		refinery_job_completed_outputs = {}
		refinery_job_output_queue.clear()
		refinery_job_input = &""
		refinery_job_amount = 0
		selected_refinery_amount = 0
		refresh_refinery_inventory()
		update_hud()
		return
	for output_variant in cycle_outputs.keys():
		var output_key: StringName = StringName(output_variant)
		refinery_job_completed_outputs[output_key] = int(refinery_job_completed_outputs.get(output_key, 0)) + int(cycle_outputs[output_variant])
		refinery_last_completed_outputs[output_key] = int(refinery_job_completed_outputs.get(output_key, 0))
		refinery_job_pending_outputs[output_key] = max(int(refinery_job_pending_outputs.get(output_key, 0)) - int(cycle_outputs[output_variant]), 0)
		if int(refinery_job_pending_outputs[output_key]) <= 0:
			refinery_job_pending_outputs.erase(output_key)
	award_use_skill_xp("industry", 1.0)
	update_mission_progress("intro_refinery_cycle", 1)
	last_status_message = "Refinery cycle complete: %s." % refinery_output_summary_text(cycle_outputs)
	push_telemetry_event("Refinery output secured: %s." % refinery_output_summary_text(cycle_outputs), "sale")
	refinery_job_amount = max(refinery_job_amount - 1, 0)
	if refinery_job_amount > 0 and not refinery_job_output_queue.is_empty():
		refresh_refinery_inventory()
		update_hud()
		return
	refinery_job_active = false
	refinery_job_pending_outputs = {}
	refinery_job_completed_outputs = {}
	refinery_job_output_queue.clear()
	refinery_job_input = &""
	refinery_job_amount = 0
	refinery_last_input = &""
	refinery_last_input_amount = 0
	selected_refinery_amount = 0
	refresh_refinery_inventory()
	update_hud()


func stop_refinery_job() -> void:
	if not refinery_job_active:
		return
	selected_refinery_input = &""
	selected_refinery_amount = 0
	refinery_job_active = false
	refinery_job_timer = 0.0
	refinery_job_pending_outputs = {}
	refinery_job_completed_outputs = {}
	refinery_last_completed_outputs = {}
	refinery_last_input = &""
	refinery_last_input_amount = 0
	refinery_job_output_queue.clear()
	refinery_job_input = &""
	refinery_job_amount = 0
	refinery_progress.value = 0.0
	last_status_message = "Refinery stopped. Remaining input returned to %s." % refinery_source_display_name(refinery_job_source).to_lower()
	push_telemetry_event("Refinery halted. Remaining input returned to %s." % refinery_source_display_name(refinery_job_source).to_lower(), "dock")
	refresh_refinery_inventory()
	update_hud()


func refresh_refinery_controls() -> void:
	if refinery_job_active:
		refinery_input_card.disabled = true
		refinery_output_card.disabled = true
		refinery_input_card.icon = item_icons.get(refinery_job_input, null)
		refinery_input_readout.text = "%s x%d" % [
			str(get_item_definition(refinery_job_input).get("name", refinery_job_input)),
			refinery_job_amount,
		]
		if refinery_job_completed_outputs.is_empty():
			var queued_preview: Dictionary = refinery_preview_output_info(refinery_job_input, refinery_job_amount)
			refinery_output_card.icon = queued_preview.get("icon", null)
			refinery_output_readout.text = str(queued_preview.get("label", "No output"))
		else:
			var completed_first_key: Variant = refinery_job_completed_outputs.keys()[0] if not refinery_job_completed_outputs.is_empty() else null
			refinery_output_card.icon = item_icons.get(StringName(completed_first_key), null) if completed_first_key != null else null
			refinery_output_readout.text = refinery_output_summary_text(refinery_job_completed_outputs)
		refinery_selected_input.text = "Refining: %s x%d remaining from %s" % [
			str(get_item_definition(refinery_job_input).get("name", refinery_job_input)),
			refinery_job_amount,
			refinery_source_display_name(refinery_job_source),
		]
		refinery_selected_output.text = "Output: %s" % ("No output yet" if refinery_job_completed_outputs.is_empty() else refinery_output_summary_text(refinery_job_completed_outputs))
		refinery_summary.text = "%.1fs per unit  |  Output to %s" % [refinery_job_duration, refinery_source_display_name(refinery_job_source)]
		refine_button.text = "STOP"
		refine_button.disabled = false
		return
	refinery_progress.value = 0.0
	refinery_input_card.disabled = false
	refinery_output_card.disabled = true
	if selected_refinery_input == StringName() or selected_refinery_amount <= 0 or not refinery_recipes.has(selected_refinery_input):
		selected_refinery_input = &""
		selected_refinery_amount = 0
		if refinery_last_input != StringName():
			refinery_input_card.icon = item_icons.get(refinery_last_input, null)
			refinery_input_readout.text = "%s x%d" % [str(get_item_definition(refinery_last_input).get("name", refinery_last_input)), refinery_last_input_amount]
			refinery_selected_input.text = "Last input: %s x%d" % [str(get_item_definition(refinery_last_input).get("name", refinery_last_input)), refinery_last_input_amount]
		else:
			refinery_selected_input.text = "Input: none"
			refinery_input_card.icon = null
			refinery_input_readout.text = "No input"
		refinery_selected_output.text = "Last output: none"
		refinery_input_card.text = ""
		refinery_output_card.icon = null
		refinery_output_card.text = ""
		if refinery_last_completed_outputs.is_empty():
			refinery_output_readout.text = "No output"
			refinery_summary.text = "Select raw input."
		else:
			refinery_output_readout.text = refinery_output_summary_text(refinery_last_completed_outputs)
			refinery_selected_output.text = "Last output: %s" % refinery_output_summary_text(refinery_last_completed_outputs)
			refinery_summary.text = "Returned to %s" % refinery_source_display_name(refinery_last_output_source)
		refine_button.text = "REFINE"
		refine_button.disabled = true
		return

	var available: int = refinery_source_item_count(selected_refinery_input, selected_refinery_source)
	if available <= 0:
		selected_refinery_input = &""
		selected_refinery_amount = 0
		refresh_refinery_controls()
		return
	selected_refinery_amount = min(selected_refinery_amount, available)
	var recipe: Dictionary = refinery_recipes[selected_refinery_input]
	var output_preview: Dictionary = refinery_preview_output_info(selected_refinery_input, selected_refinery_amount)
	var output_counts: Dictionary = refinery_job_output_counts(selected_refinery_input, selected_refinery_amount)
	var total_fee_discount: float = min(refinery_fee_discount_bonus() + research_refinery_fee_discount_bonus(), 0.55)
	var fee_each: int = int(round(discounted_cost(int(recipe["fee"]), "refinery") * max(1.0 - total_fee_discount, 0.45)))
	var total_fee: int = selected_refinery_amount * fee_each
	refinery_input_card.icon = item_icons.get(selected_refinery_input, null)
	refinery_input_card.text = ""
	refinery_input_readout.text = "%s x%d" % [str(get_item_definition(selected_refinery_input).get("name", selected_refinery_input)), selected_refinery_amount]
	refinery_output_card.icon = output_preview.get("icon", null)
	refinery_output_card.text = ""
	refinery_output_readout.text = str(output_preview.get("label", "No output"))
	refinery_selected_input.text = "Input: %s x%d from %s  |  %d available" % [
		str(get_item_definition(selected_refinery_input).get("name", selected_refinery_input)),
		selected_refinery_amount,
		refinery_source_display_name(selected_refinery_source),
		available,
	]
	refinery_selected_output.text = "Output: %s" % str(output_preview.get("label", "none"))
	var destination_line := "Returns to %s" % refinery_source_display_name(selected_refinery_source)
	if selected_refinery_source == "station" and not simulate_station_storage_fit(output_counts):
		destination_line = "Not enough room in station inventory."
		refine_button.disabled = true
	else:
		refine_button.disabled = false
	refinery_summary.text = "%d CR each  |  %d CR total  |  %.1fs cycle  |  %s" % [
		fee_each,
		total_fee,
		current_refinery_cycle_duration(),
		destination_line,
	]
	refine_button.text = "REFINE (%d CR)" % total_fee


func visible_crafting_recipes() -> Array[Dictionary]:
	var visible_recipes: Array[Dictionary] = []
	for recipe_variant in crafting_recipes:
		var recipe: Dictionary = recipe_variant
		var required_node: String = str(recipe.get("requires_node", ""))
		if not required_node.is_empty() and current_research_rank(required_node) <= 0:
			continue
		visible_recipes.append(recipe)
	return visible_recipes


func find_crafting_recipe_by_id(recipe_id: String) -> Dictionary:
	for recipe_variant in crafting_recipes:
		var recipe: Dictionary = recipe_variant
		if str(recipe.get("id", "")) == recipe_id:
			return recipe
	return {}


func selected_crafting_recipe() -> Dictionary:
	return find_crafting_recipe_by_id(selected_crafting_recipe_id)


func station_storage_capacity_for_item(item_type: StringName) -> int:
	var capacity: int = 0
	for stack_variant in station_storage:
		var stack: Dictionary = stack_variant
		if StringName(stack.get("type", StringName())) != item_type:
			continue
		capacity += max(STATION_STACK_LIMIT - int(stack.get("count", 0)), 0)
	var free_slots: int = max(station_storage_capacity - station_storage.size(), 0)
	capacity += free_slots * STATION_STACK_LIMIT
	return capacity


func add_item_to_station_storage(item_type: StringName, amount: int) -> int:
	var remaining: int = amount
	for index in range(station_storage.size()):
		var stack: Dictionary = station_storage[index]
		if StringName(stack.get("type", StringName())) != item_type:
			continue
		var free_stack_space: int = STATION_STACK_LIMIT - int(stack.get("count", 0))
		if free_stack_space <= 0:
			continue
		var portion: int = min(remaining, free_stack_space)
		stack["count"] = int(stack.get("count", 0)) + portion
		station_storage[index] = stack
		remaining -= portion
		if remaining <= 0:
			return amount
	while remaining > 0 and station_storage.size() < station_storage_capacity:
		var new_stack_amount: int = min(remaining, STATION_STACK_LIMIT)
		station_storage.append({"type": item_type, "count": new_stack_amount})
		remaining -= new_stack_amount
	return amount - remaining


func consume_accessible_item(item_type: StringName, amount: int) -> bool:
	var remaining: int = amount
	var from_ship: int = min(int(cargo.get(item_type, 0)), remaining)
	if from_ship > 0:
		cargo[item_type] -= from_ship
		remaining -= from_ship
	if remaining > 0:
		var pulled_from_storage: int = consume_station_storage_item(item_type, remaining)
		remaining -= pulled_from_storage
	return remaining <= 0


func crafting_recipe_cost_lines(recipe: Dictionary) -> Array[String]:
	var lines: Array[String] = []
	for cost_variant in recipe.get("costs", []):
		var cost: Dictionary = cost_variant
		var item_type: StringName = StringName(cost.get("type", StringName()))
		var needed: int = int(cost.get("count", 0))
		var available: int = total_accessible_item_count(item_type)
		var color: String = "#8ff2b2" if available >= needed else "#ff8a8a"
		lines.append("[color=%s]%s %d / %d[/color]" % [color, str(get_item_definition(item_type).get("name", item_type)), available, needed])
	return lines


func crafting_recipe_cost_plain_lines(recipe: Dictionary) -> Array[String]:
	var lines: Array[String] = []
	for cost_variant in recipe.get("costs", []):
		var cost: Dictionary = cost_variant
		var item_type: StringName = StringName(cost.get("type", StringName()))
		var needed: int = int(cost.get("count", 0))
		var available: int = total_accessible_item_count(item_type)
		lines.append("%s %d / %d" % [str(get_item_definition(item_type).get("name", item_type)), available, needed])
	return lines


func can_craft_recipe(recipe: Dictionary) -> Dictionary:
	if not is_station_in_range():
		return {"ok": false, "reason": "Move closer to the station before crafting."}
	var credit_cost: int = crafting_credit_cost(recipe)
	if credits < credit_cost:
		return {"ok": false, "reason": "Need %d more credits for fabrication." % [credit_cost - credits]}
	for cost_variant in recipe.get("costs", []):
		var cost: Dictionary = cost_variant
		var item_type: StringName = StringName(cost.get("type", StringName()))
		var needed: int = int(cost.get("count", 0))
		if total_accessible_item_count(item_type) < needed:
			return {"ok": false, "reason": "Missing %s for fabrication." % str(get_item_definition(item_type).get("name", item_type))}
	var output_type: StringName = StringName(recipe.get("output", StringName()))
	var output_count: int = int(recipe.get("output_count", 1))
	if station_storage_capacity_for_item(output_type) < output_count and remaining_cargo_weight() < item_weight(output_type) * output_count:
		return {"ok": false, "reason": "No room in station storage or ship cargo for the crafted item."}
	return {"ok": true, "reason": ""}


func refresh_crafting_panel() -> void:
	for child in crafting_recipe_list.get_children():
		child.queue_free()
	crafting_recipe_buttons.clear()

	var recipes: Array[Dictionary] = visible_crafting_recipes()
	if recipes.is_empty():
		selected_crafting_recipe_id = ""
		crafting_summary.text = "No recipes available."
		crafting_detail_title.text = "No Recipe Selected"
		crafting_detail_meta.text = "Research more Industry nodes to unlock fabrication orders."
		crafting_detail_summary.text = "No fabrication data loaded."
		crafting_detail_costs.text = "[color=#6f8097]No fabrication recipe is currently available.[/color]"
		crafting_detail_button.disabled = true
		crafting_detail_button.text = "CRAFT"
		return

	if find_crafting_recipe_by_id(selected_crafting_recipe_id).is_empty():
		selected_crafting_recipe_id = str(recipes[0].get("id", ""))

	for recipe_variant in recipes:
		var recipe: Dictionary = recipe_variant
		var recipe_id: String = str(recipe.get("id", ""))
		var recipe_output_type: StringName = StringName(recipe.get("output", StringName()))
		var recipe_button: Button = Button.new()
		recipe_button.custom_minimum_size = Vector2(0, 62)
		recipe_button.text = "%s\n%s" % [str(recipe.get("title", "Recipe")), str(get_item_definition(recipe_output_type).get("name", recipe_output_type))]
		recipe_button.alignment = HORIZONTAL_ALIGNMENT_LEFT
		recipe_button.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
		style_button_secondary(recipe_button)
		if recipe_id == selected_crafting_recipe_id:
			recipe_button.add_theme_stylebox_override("normal", make_panel_style(Color(0.15, 0.19, 0.24, 0.98), Color(0.99, 0.82, 0.45, 0.5), 14, 2))
			recipe_button.add_theme_stylebox_override("hover", make_panel_style(Color(0.18, 0.22, 0.28, 0.98), Color(1.0, 0.86, 0.54, 0.6), 14, 2))
			recipe_button.add_theme_stylebox_override("pressed", make_panel_style(Color(0.14, 0.18, 0.23, 0.98), Color(0.98, 0.82, 0.45, 0.65), 14, 2))
		recipe_button.pressed.connect(func(target_recipe_id: String = recipe_id) -> void:
			selected_crafting_recipe_id = target_recipe_id
			refresh_crafting_panel()
		)
		attach_button_audio(recipe_button)
		crafting_recipe_list.add_child(recipe_button)
		crafting_recipe_buttons.append(recipe_button)

	var selected_recipe: Dictionary = selected_crafting_recipe()
	var output_type: StringName = StringName(selected_recipe.get("output", StringName()))
	var output_count: int = int(selected_recipe.get("output_count", 1))
	var fabrication_fee: int = crafting_credit_cost(selected_recipe)
	var craft_check: Dictionary = can_craft_recipe(selected_recipe)
	crafting_summary.text = "%d recipe%s  |  Storage %d / %d" % [recipes.size(), "s" if recipes.size() != 1 else "", station_storage.size(), station_storage_capacity]
	crafting_detail_title.text = str(selected_recipe.get("title", "Recipe"))
	crafting_detail_meta.text = "%s  |  Output %s x%d  |  Fabrication fee %d CR" % [
		str(selected_recipe.get("summary", "Fabrication order")),
		str(get_item_definition(output_type).get("name", output_type)),
		output_count,
		fabrication_fee,
	]
	crafting_detail_summary.text = str(selected_recipe.get("description", ""))
	crafting_detail_costs.text = "[b]Required materials[/b]\n%s" % "\n".join(crafting_recipe_cost_lines(selected_recipe))
	crafting_detail_button.text = "CRAFT %s" % str(get_item_definition(output_type).get("name", output_type)).to_upper()
	crafting_detail_button.disabled = not bool(craft_check.get("ok", false))
	if crafting_detail_button.disabled:
		crafting_detail_summary.text += "\n\n%s" % str(craft_check.get("reason", ""))


func open_selected_crafting_confirmation() -> void:
	var recipe: Dictionary = selected_crafting_recipe()
	if recipe.is_empty():
		return
	var craft_check: Dictionary = can_craft_recipe(recipe)
	if not bool(craft_check.get("ok", false)):
		last_status_message = str(craft_check.get("reason", "Fabrication unavailable."))
		push_telemetry_event(last_status_message, "warning")
		update_hud()
		return
	var output_type: StringName = StringName(recipe.get("output", StringName()))
	pending_transfer = {
		"direction": "craft",
		"recipe_id": str(recipe.get("id", "")),
	}
	transfer_popup_title.text = "CRAFT %s" % str(get_item_definition(output_type).get("name", output_type))
	transfer_popup_info.text = "Confirm fabrication order.\nFee: %d CR\n%s" % [crafting_credit_cost(recipe), "\n".join(crafting_recipe_cost_plain_lines(recipe))]
	transfer_amount.visible = false
	transfer_popup.visible = true
	hide_tooltip()


func craft_recipe_by_id(recipe_id: String) -> void:
	var recipe: Dictionary = find_crafting_recipe_by_id(recipe_id)
	if recipe.is_empty():
		return
	var craft_check: Dictionary = can_craft_recipe(recipe)
	if not bool(craft_check.get("ok", false)):
		last_status_message = str(craft_check.get("reason", "Fabrication unavailable."))
		push_telemetry_event(last_status_message, "warning")
		update_hud()
		return
	for cost_variant in recipe.get("costs", []):
		var cost: Dictionary = cost_variant
		consume_accessible_item(StringName(cost.get("type", StringName())), int(cost.get("count", 0)))
	var output_type: StringName = StringName(recipe.get("output", StringName()))
	var output_count: int = int(recipe.get("output_count", 1))
	var stored_amount: int = add_item_to_station_storage(output_type, output_count)
	if stored_amount < output_count:
		cargo[output_type] += output_count - stored_amount
	credits -= crafting_credit_cost(recipe)
	award_use_skill_xp("industry", max(float(output_count) * 1.5, 1.5), true)
	last_status_message = "Fabricated %s x%d." % [str(get_item_definition(output_type).get("name", output_type)), output_count]
	push_telemetry_event("Fabrication complete: %s x%d." % [str(get_item_definition(output_type).get("name", output_type)), output_count], "sale")
	update_hud()


func current_market_value(item_type: StringName) -> int:
	var base_value := int(get_item_definition(item_type)["value"])
	var multiplier := float(market_price_multipliers.get(item_type, 1.0))
	return max(int(round(base_value * multiplier)), 1)


func market_delta_color(item_type: StringName) -> String:
	var base_value := int(get_item_definition(item_type)["value"])
	var current_value := current_market_value(item_type)
	if current_value > base_value:
		return "#72f0a6"
	if current_value < base_value:
		return "#ff7c7c"
	return "#d9e7ff"


func build_market_manifest_text() -> String:
	var lines: Array[String] = []
	for item_type in ITEM_ORDER:
		if cargo[item_type] <= 0:
			continue
		var item := get_item_definition(item_type)
		var base_value := int(item["value"])
		var current_value := current_market_value(item_type)
		lines.append("[b]%s[/b] x%d" % [item["name"], cargo[item_type]])
		lines.append("Base %d cr  |  [color=%s]Market %d cr[/color]" % [base_value, market_delta_color(item_type), current_value])

	if lines.is_empty():
		return "[color=#6f8097]No cargo loaded.[/color]"

	return "\n".join(lines)


func build_market_summary_text() -> String:
	var total_value := projected_sale_value()
	var movers: Array[String] = []
	for item_type in ITEM_ORDER:
		var base_value := int(get_item_definition(item_type)["value"])
		var current_value := current_market_value(item_type)
		if current_value == base_value:
			continue
		var direction := "up" if current_value > base_value else "down"
		movers.append("%s %s" % [get_item_definition(item_type)["name"], direction])
		if movers.size() >= 3:
			break

	var movers_text := ", ".join(movers) if not movers.is_empty() else "Market holding steady."
	var bounty_total := total_accessible_item_count(BLACKWAKE_TAG)
	var bounty_line := "No bounty tags secured."
	if bounty_total > 0:
		bounty_line = "%d Blackwake tag%s ready for station hand-in." % [bounty_total, "s" if bounty_total != 1 else ""]
	return "[b]Projected Sale[/b]\n%d credits\n\n[b]Market Pulse[/b]\n%s\n\n[b]Bounty Desk[/b]\n%s" % [total_value, movers_text, bounty_line]


func refresh_market_manifest() -> void:
	for child in cargo_manifest.get_children():
		child.queue_free()

	market_sell_buttons.clear()

	var has_items := false
	for item_type in ITEM_ORDER:
		var count: int = cargo[item_type]
		if count <= 0:
			continue
		has_items = true
		var row := HBoxContainer.new()
		row.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		row.add_theme_constant_override("separation", 8)

		var info := RichTextLabel.new()
		info.bbcode_enabled = true
		info.fit_content = true
		info.scroll_active = false
		info.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		info.custom_minimum_size.y = 54
		info.add_theme_font_size_override("normal_font_size", 12)
		info.add_theme_color_override("default_color", Color(0.88, 0.94, 1.0))
		var item := get_item_definition(item_type)
		var base_value := int(item["value"])
		var current_value := current_market_value(item_type)
		if item_type == BLACKWAKE_TAG:
			info.text = "[b]%s[/b] x%d\nTurn in at bounty desk for Paladins rep." % [
				item["name"],
				count,
			]
		else:
			info.text = "[b]%s[/b] x%d\nBase %d cr  |  [color=%s]Market %d cr[/color]" % [
				item["name"],
				count,
				base_value,
				market_delta_color(item_type),
				current_value,
			]

		var button := Button.new()
		if item_type == BLACKWAKE_TAG:
			button.text = "DESK"
			button.custom_minimum_size = Vector2(88, 40)
			style_button_primary(button, Color(0.62, 0.18, 0.18, 0.96), Color(0.82, 0.24, 0.24, 0.96))
			button.pressed.connect(turn_in_blackwake_bounties)
		else:
			button.text = "SELL"
			button.custom_minimum_size = Vector2(88, 40)
			style_button_primary(button, Color(0.2, 0.58, 0.33, 0.95), Color(0.29, 0.8, 0.46, 0.95))
			button.pressed.connect(func() -> void:
				open_sell_popup(item_type, count)
			)

		row.add_child(info)
		row.add_child(button)
		attach_button_audio(button)
		cargo_manifest.add_child(row)
		market_sell_buttons.append(button)

	if has_items:
		return

	var empty_label := Label.new()
	empty_label.text = "No cargo loaded."
	empty_label.add_theme_font_size_override("font_size", 13)
	empty_label.add_theme_color_override("font_color", Color(0.45, 0.52, 0.62))
	cargo_manifest.add_child(empty_label)


func projected_sale_value() -> int:
	var sell_multiplier := (1.0 + sale_price_skill_bonus()) * freeport_market_bonus_multiplier()
	var total_value := 0
	for item_type in ITEM_ORDER:
		if item_type == BLACKWAKE_TAG:
			continue
		total_value += cargo[item_type] * current_market_value(item_type)
	return int(round(total_value * sell_multiplier))


func total_accessible_item_count(item_type: StringName) -> int:
	return int(cargo.get(item_type, 0)) + count_item_in_station_storage(item_type)


func turn_in_blackwake_bounties() -> void:
	if not is_station_in_range():
		last_status_message = "Bounty turn-ins are only accepted while docked."
		update_hud()
		return

	var available_tags: int = total_accessible_item_count(BLACKWAKE_TAG)
	if available_tags <= 0:
		last_status_message = "No Blackwake cipher tags ready for turn-in."
		push_telemetry_event("Bounty desk idle. No faction tags on hand.", "warning")
		update_hud()
		return

	var tags_from_ship: int = min(int(cargo[BLACKWAKE_TAG]), available_tags)
	cargo[BLACKWAKE_TAG] -= tags_from_ship
	var remaining_tags: int = available_tags - tags_from_ship
	if remaining_tags > 0:
		consume_station_storage_item(BLACKWAKE_TAG, remaining_tags)

	var credit_reward := int(round(available_tags * 14 * mission_credit_bonus_multiplier("paladins") * (1.0 + bounty_value_bonus())))
	var rep_reward := available_tags * 2 + mission_rep_bonus("paladins")
	credits += credit_reward
	total_stats["credits_earned"] += credit_reward
	add_faction_reputation("paladins", rep_reward, "Bounty Desk")
	last_status_message = "Bounty desk cleared %d Blackwake tag%s for %d credits and +%d Paladins rep." % [
		available_tags,
		"s" if available_tags != 1 else "",
		credit_reward,
		rep_reward,
	]
	push_telemetry_event("Paladins bounty desk accepted %d Blackwake tag%s." % [
		available_tags,
		"s" if available_tags != 1 else "",
	], "combat")
	refresh_market_manifest()
	update_hud()


func item_weight(item_type: StringName) -> float:
	return float(get_item_definition(item_type)["weight"])


func total_cargo_weight() -> float:
	var total := 0.0
	for item_type in ITEM_ORDER:
		total += cargo[item_type] * item_weight(item_type)
	return total


func remaining_cargo_weight() -> float:
	return max(float(ship_stats["cargo_capacity"]) - total_cargo_weight(), 0.0)


func format_weight(value: float) -> String:
	return "%.1f wt" % value


func refuel_cost() -> int:
	return discounted_cost(int(ceil((ship_stats["fuel_capacity"] - current_fuel) * 0.7)), "refuel")


func show_tooltip_for_slot(slot_index: int) -> void:
	if slot_index >= field_inventory_slots.size():
		return

	var slot := field_inventory_slots[slot_index]
	if not slot.has_meta("item_data"):
		hide_tooltip()
		return

	var slot_item_data = slot.get_meta("item_data")
	if slot_item_data == null:
		hide_tooltip()
		return

	tooltip_name.text = "%s x%d" % [slot_item_data["name"], slot_item_data["count"]]
	tooltip_body.text = "%d cr  |  %.1f wt each" % [slot_item_data["value"], slot_item_data["weight"]]
	inventory_tooltip.visible = true
	update_tooltip_position()


func show_storage_tooltip_for_slot(slot_index: int) -> void:
	if slot_index >= storage_slots.size():
		return

	var slot := storage_slots[slot_index]
	if not slot.has_meta("item_data"):
		hide_tooltip()
		return

	var item_data_local = slot.get_meta("item_data")
	if item_data_local == null:
		hide_tooltip()
		return

	tooltip_name.text = "%s x%d" % [item_data_local["name"], item_data_local["count"]]
	tooltip_body.text = "Vaulted  |  %d cr  |  %.1f wt" % [item_data_local["value"], item_data_local["weight"]]
	inventory_tooltip.visible = true
	update_tooltip_position()


func show_ship_storage_tooltip_for_slot(slot_index: int) -> void:
	if slot_index >= ship_storage_slots.size():
		return

	var slot := ship_storage_slots[slot_index]
	if not slot.has_meta("item_data"):
		hide_tooltip()
		return

	var item_data_local = slot.get_meta("item_data")
	if item_data_local == null:
		hide_tooltip()
		return

	tooltip_name.text = "%s x%d" % [item_data_local["name"], item_data_local["count"]]
	tooltip_body.text = "Ship stack  |  %d cr  |  %.1f wt" % [item_data_local["value"], item_data_local["weight"]]
	inventory_tooltip.visible = true
	update_tooltip_position()


func show_room_tooltip(room_name: String) -> void:
	if not room_tooltips.has(room_name):
		hide_tooltip()
		return

	var tooltip_data: Dictionary = room_tooltips[room_name]
	tooltip_name.text = tooltip_data["name"]
	tooltip_body.text = tooltip_data["description"]
	inventory_tooltip.visible = true
	update_tooltip_position()


func handle_ship_storage_input(slot_index: int, event: InputEvent) -> void:
	if slot_index >= ship_storage_slots.size():
		return
	if not (event is InputEventMouseButton):
		return
	var mouse_event := event as InputEventMouseButton
	if not mouse_event.pressed:
		return

	var ship_stacks := get_ship_storage_stacks()
	if slot_index >= ship_stacks.size():
		return

	var stack: Dictionary = ship_stacks[slot_index]
	if mouse_event.button_index == MOUSE_BUTTON_LEFT:
		var amount: int = int(stack["count"]) if mouse_event.shift_pressed else 1
		transfer_ship_to_station(stack["type"], amount)
		get_viewport().set_input_as_handled()
	elif mouse_event.button_index == MOUSE_BUTTON_RIGHT:
		open_transfer_popup("ship_to_station", slot_index, stack["type"], int(stack["count"]))
		get_viewport().set_input_as_handled()


func handle_station_storage_input(slot_index: int, event: InputEvent) -> void:
	if slot_index >= storage_slots.size() or slot_index >= station_storage.size():
		return
	if not (event is InputEventMouseButton):
		return
	var mouse_event := event as InputEventMouseButton
	if not mouse_event.pressed:
		return

	var stack: Dictionary = station_storage[slot_index]
	if mouse_event.button_index == MOUSE_BUTTON_LEFT:
		var amount := int(stack["count"]) if mouse_event.shift_pressed else 1
		transfer_station_to_ship(slot_index, amount)
		get_viewport().set_input_as_handled()
	elif mouse_event.button_index == MOUSE_BUTTON_RIGHT:
		open_transfer_popup("station_to_ship", slot_index, stack["type"], int(stack["count"]))
		get_viewport().set_input_as_handled()


func open_transfer_popup(direction: String, slot_index: int, item_type: StringName, max_amount: int) -> void:
	pending_transfer = {
		"direction": direction,
		"slot_index": slot_index,
		"item_type": item_type,
		"max_amount": max_amount,
	}
	transfer_popup_title.text = "TRANSFER %s" % get_item_definition(item_type)["name"]
	transfer_popup_info.text = "Enter amount (max %d)." % max_amount
	transfer_amount.min_value = 1.0
	transfer_amount.max_value = float(max_amount)
	transfer_amount.value = float(max_amount)
	transfer_amount.visible = true
	transfer_popup.visible = true
	hide_tooltip()


func open_sell_popup(item_type: StringName, max_amount: int) -> void:
	pending_transfer = {
		"direction": "sell",
		"item_type": item_type,
		"max_amount": max_amount,
	}
	transfer_popup_title.text = "SELL %s" % get_item_definition(item_type)["name"]
	transfer_popup_info.text = "Enter amount to sell (max %d)." % max_amount
	transfer_amount.min_value = 1.0
	transfer_amount.max_value = float(max_amount)
	transfer_amount.value = float(max_amount)
	transfer_amount.visible = true
	transfer_popup.visible = true
	hide_tooltip()


func close_transfer_popup() -> void:
	transfer_popup.visible = false
	transfer_amount.visible = true
	pending_transfer = {}


func confirm_transfer_popup() -> void:
	if pending_transfer.is_empty():
		close_transfer_popup()
		return

	var amount := int(transfer_amount.value)
	if pending_transfer["direction"] == "ship_to_station":
		transfer_ship_to_station(pending_transfer["item_type"], amount)
	elif pending_transfer["direction"] == "refine_load":
		confirm_refinery_input_load(StringName(pending_transfer.get("item_type", StringName())), str(pending_transfer.get("source", "ship")), amount)
	elif pending_transfer["direction"] == "sell":
		sell_item_stack(pending_transfer["item_type"], amount)
	elif pending_transfer["direction"] == "craft":
		craft_recipe_by_id(str(pending_transfer.get("recipe_id", "")))
	else:
		transfer_station_to_ship(int(pending_transfer["slot_index"]), amount)
	close_transfer_popup()


func hide_tooltip() -> void:
	inventory_tooltip.visible = false


func update_tooltip_position() -> void:
	if not inventory_tooltip.visible:
		return

	var mouse_pos := get_viewport().get_mouse_position()
	var desired := mouse_pos + Vector2(18, 18)
	var viewport_size := get_viewport_rect().size
	desired.x = min(desired.x, viewport_size.x - inventory_tooltip.size.x - 12.0)
	desired.y = min(desired.y, viewport_size.y - inventory_tooltip.size.y - 12.0)
	inventory_tooltip.position = desired


func spawn_starting_resources() -> void:
	for _i in range(current_map_resource_target()):
		spawn_resource()


func maintain_resource_field() -> void:
	if resource_layer.get_child_count() >= current_map_resource_target():
		return

	for _i in range(current_map_resource_target() - resource_layer.get_child_count()):
		spawn_resource()


func spawn_resource() -> void:
	var resource = RESOURCE_SCENE.instantiate()
	var template := apply_resource_trait(pick_resource_template())
	var texture_variant := pick_resource_texture_variant(template)
	var rare_resource: StringName = template.get("rare_resource", StringName())
	var rare_label := ""
	if rare_resource != StringName():
		rare_label = str(get_item_definition(rare_resource)["name"])
	resource.configure({
		"primary_resource": template["primary_resource"],
		"primary_label": get_item_definition(template["primary_resource"])["name"],
		"rare_resource": rare_resource,
		"rare_label": rare_label,
		"rare_chance": template["rare_chance"],
		"node_name": template["node_name"],
		"scan_description": template["scan_description"],
		"body_color": template["body_color"],
		"texture": texture_variant.get("texture", null),
		"texture_scale_bonus": float(texture_variant.get("scale_bonus", 1.0)),
		"texture_tint": template.get("texture_tint", Color(1.0, 1.0, 1.0, 1.0)),
		"trait_name": template["trait_name"],
		"trait_description": template["trait_description"],
		"required_mining_stage": int(template.get("required_mining_stage", 0)),
		"extraction_hint": str(template.get("scan_description", "")),
		"amount": rng.randi_range(template["amount_min"], template["amount_max"]),
		"interval": rng.randf_range(template["interval_min"], template["interval_max"]),
		"scale_multiplier": rng.randf_range(template["scale_min"], template["scale_max"]),
	})

	resource.position = random_position_in_current_map(260.0, true)
	resource_layer.add_child(resource)


func pick_resource_template() -> Dictionary:
	var weighted_templates: Array[Dictionary] = []
	var total_weight := 0.0
	var salvage_bias := float(current_map_data.get("salvage_bias", 0.2))
	var resource_bias := float(current_map_data.get("resource_bias", 1.0))
	var resource_profile := str(current_map_data.get("resource_profile", "standard"))
	var system_resource_biases: Dictionary = current_system_data.get("resource_biases", {})
	var roll := rng.randf()
	for template in resource_node_templates:
		var entry: Dictionary = template.duplicate(true)
		var allowed_profiles: Array = entry.get("profiles", [])
		if not allowed_profiles.is_empty() and not allowed_profiles.has(resource_profile):
			continue
		var weight := float(entry["weight"])
		if entry["primary_resource"] == SCRAP:
			weight *= max(salvage_bias, 0.05)
		else:
			weight *= max(resource_bias, 0.35)
		if current_map_control_state() == "salvage_zone" and entry["primary_resource"] == SCRAP:
			weight *= 1.8
		elif current_map_name().findn("Foundry") != -1 and entry["primary_resource"] == ORE:
			weight *= 1.55
		elif current_map_name().findn("Survey") != -1 and entry["primary_resource"] == CRYSTAL:
			weight *= 1.25
		weight *= float(system_resource_biases.get(entry["primary_resource"], 1.0))
		entry["weight"] = weight
		total_weight += weight
		weighted_templates.append(entry)
	if weighted_templates.is_empty():
		return resource_node_templates[0]
	var running_total := 0.0
	for template in weighted_templates:
		running_total += float(template["weight"]) / max(total_weight, 0.001)
		if roll <= running_total:
			return template
	return weighted_templates[0]


func apply_resource_trait(base_template: Dictionary) -> Dictionary:
	var template := base_template.duplicate(true)
	var trait_data: Dictionary = resource_trait_templates[rng.randi_range(0, resource_trait_templates.size() - 1)]
	template["trait_name"] = trait_data["name"]
	template["trait_description"] = trait_data["description"]
	template["rare_chance"] = clampf(float(template["rare_chance"]) + float(trait_data["rare_bonus"]), 0.01, 0.18)
	if current_map_control_state() == "salvage_zone" and template["primary_resource"] == SCRAP:
		template["rare_chance"] = clampf(float(template["rare_chance"]) + 0.02, 0.01, 0.2)
	template["amount_min"] = max(int(round(float(template["amount_min"]) * float(trait_data["amount_mult"]))), 2)
	template["amount_max"] = max(int(round(float(template["amount_max"]) * float(trait_data["amount_mult"]))), template["amount_min"])
	template["interval_min"] = max(float(template["interval_min"]) * float(trait_data["interval_mult"]), 0.3)
	template["interval_max"] = max(float(template["interval_max"]) * float(trait_data["interval_mult"]), template["interval_min"] + 0.06)
	return template


func current_mining_stage() -> int:
	var mining_level: int = use_skill_level("mining")
	for stage_index in range(MINING_STAGE_LEVEL_REQUIREMENTS.size() - 1, -1, -1):
		if mining_level >= MINING_STAGE_LEVEL_REQUIREMENTS[stage_index]:
			return stage_index
	return 0


func metallic_ore_types() -> Array[StringName]:
	return METALLIC_ORE_TYPES


func is_metallic_ore(item_type: StringName) -> bool:
	return metallic_ore_types().has(item_type)


func extraction_stage_name(stage: int) -> String:
	return "Mining Lv %d" % mining_level_required_for_stage(stage)


func node_requires_higher_mining_stage(resource_node) -> bool:
	return int(resource_node.required_mining_stage) > current_mining_stage()


func is_salvage_resource_node(resource_node) -> bool:
	if resource_node == null:
		return false
	return StringName(resource_node.resource_type) == SCRAP or bool(resource_node.is_derelict_ship)


func pick_resource_texture_variant(template: Dictionary) -> Dictionary:
	var textures: Array = template.get("textures", [])
	if textures.is_empty():
		return {}
	return textures[rng.randi_range(0, textures.size() - 1)]


func handle_resource_gathering(delta: float) -> void:
	if combat_mode:
		prompt_label.text = "Combat Mode  |  LMB lasers  |  RMB missiles (%s)  |  Hull %d%%" % [
			"READY" if special_weapon_cooldown <= 0.0 else "%.1fs" % special_weapon_cooldown,
			int(round(float(player_hull) / max(float(player_hull_cap()), 1.0) * 100.0)),
		]
		return

	var nearby_resource = get_nearest_resource(115.0)

	if nearby_resource == null:
		if not is_station_in_range():
			if has_active_mission():
				prompt_label.text = "Contract target: %s  |  %s" % [mission_target_label(current_mission), mission_direction_text(current_mission)]
			elif not tracked_scan_contact.is_empty():
				var tracked_position = get_tracked_scan_contact_position()
				if tracked_position != null:
					prompt_label.text = "Tracked scan contact: %s  |  %s" % [str(tracked_scan_contact.get("label", "Unknown")), scan_bearing_text(tracked_position)]
				else:
					prompt_label.text = "Hold RMB to mine or salvage, LMB to scan, Q to world scan, and Shift to boost."
			else:
				prompt_label.text = "Hold RMB to mine or salvage, LMB to scan, Q to world scan, and Shift to boost."
		cargo_full_alert_active = false
		return

	var mining_units_available: int = mining_units_available_for_node(nearby_resource)
	if mining_units_available <= 0:
		prompt_label.text = "Cargo at weight limit. Return to the station and unload."
		if not cargo_full_alert_active:
			push_telemetry_event("Cargo weight limit reached. Return to station for unload.", "warning")
			cargo_full_alert_active = true
		return

	cargo_full_alert_active = false

	if node_requires_higher_mining_stage(nearby_resource):
		var required_level: int = mining_level_required_for_stage(int(nearby_resource.required_mining_stage))
		var ore_name: String = str(nearby_resource.node_name)
		if nearby_resource.resource_type != null:
			ore_name = str(get_item_definition(nearby_resource.resource_type).get("name", nearby_resource.node_name))
		prompt_label.text = "%s req lvl %d" % [ore_name, required_level]
		if Input.is_action_pressed("mine"):
			last_status_message = "%s req lvl %d" % [ore_name, required_level]
			update_hud()
		return

	if bool(nearby_resource.is_derelict_ship) and can_board_derelict(nearby_resource):
		prompt_label.text = "Derelict in range. Press E to board or hold RMB to salvage."
		if Input.is_action_just_pressed("interact") and not boarding_prompt_popup.visible and not is_any_overlay_open():
			open_derelict_boarding_prompt(nearby_resource)
			return
	elif is_salvage_resource_node(nearby_resource):
		prompt_label.text = "Hold RMB to salvage %s." % nearby_resource.node_name
	else:
		prompt_label.text = "Hold RMB to mine %s." % nearby_resource.node_name

	if not Input.is_action_pressed("mine"):
		return

	var work_power: float = ship_stats["mining_power"]
	var work_bonus_yield: float = prospector_rare_bonus() + mining_bonus_yield_chance()
	if is_salvage_resource_node(nearby_resource):
		work_power += salvage_speed_bonus()
		work_bonus_yield = salvage_yield_bonus()
	var harvest: Dictionary = nearby_resource.harvest(delta, work_power, mining_units_available, work_bonus_yield)
	if harvest.is_empty():
		return

	play_audio(mining_player, 1.0 + rng.randf_range(-0.06, 0.06))
	player.add_camera_shake(0.045)
	var resource_type: StringName = harvest["type"]
	var amount: int = harvest["amount"]
	if resource_type == SCRAP and bool(nearby_resource.is_derelict_ship):
		amount += int(round(float(amount) * salvage_yield_bonus()))
	cargo[resource_type] += amount
	var impact_color := Color(0.72, 0.78, 0.88)

	match resource_type:
		ORE, NICKEL, COPPER, TITANIUM, COBALT, SILVER, GOLD, LINDRITE:
			total_stats["ore_mined"] += amount
			update_mission_progress("mine_ore", amount)
			impact_color = get_item_definition(resource_type)["fill"]
			award_use_skill_xp("mining", max(float(amount) * 1.0, 1.0))
		CRYSTAL:
			total_stats["crystals_mined"] += amount
			update_mission_progress("mine_crystal", amount)
			impact_color = Color(0.42, 0.95, 1.0)
			award_use_skill_xp("mining", max(float(amount) * 1.1, 1.0))
		ICE:
			total_stats["ice_mined"] += amount
			update_mission_progress("mine_ice", amount)
			impact_color = Color(0.8, 0.94, 1.0)
			award_use_skill_xp("mining", max(float(amount) * 0.9, 1.0))
		SCRAP:
			total_stats["scrap_salvaged"] += amount
			if bool(nearby_resource.is_derelict_ship):
				update_mission_progress("salvage_derelict", amount)
			else:
				update_mission_progress("salvage_scrap", amount)
			update_mission_progress("intro_salvage_scrap", amount)
			impact_color = Color(0.88, 0.68, 0.52)
			award_use_skill_xp("salvage", max(float(amount) * 1.0, 1.0))

	spawn_mining_effect(nearby_resource.global_position, impact_color)
	if bool(nearby_resource.is_derelict_ship):
		handle_derelict_salvage_progress(nearby_resource, harvest)

	gain_experience(max(1, int(ceil(amount * 0.55))))
	if onboarding_active and next_onboarding_step_id() == "mine":
		var target_node = onboarding_mine_target()
		if target_node != null and nearby_resource.get_instance_id() == target_node.get_instance_id():
			tracked_scan_contact = {
				"kind": "training_mine",
				"label": str(nearby_resource.node_name),
				"position": nearby_resource.global_position,
			}
			if bool(harvest.get("depleted", false)):
				onboarding_mine_target_id = -1
				tracked_scan_contact = {}
				mark_onboarding_step("mine")
	var item_name: String = str(get_item_definition(resource_type)["name"])
	if harvest.get("rare", false):
		last_status_message = "Recovered rare find: %s x%d." % [item_name, amount]
		push_telemetry_event("Rare recovery from %s: %s x%d." % [harvest["node_name"], item_name, amount], "mission")
	else:
		last_status_message = "Recovered %s x%d." % [item_name, amount]
		push_telemetry_event("Recovered %s x%d." % [item_name, amount], "gather")
	update_hud()


func handle_station_interaction() -> void:
	if not has_station_in_current_map():
		was_in_docking_range = false
		docking_prompt_suppressed = false
		if dock_prompt_popup.visible:
			dock_prompt_popup.visible = false
		return
	var in_docking_range := is_station_docking_range()
	if not in_docking_range:
		was_in_docking_range = false
		docking_prompt_suppressed = false
		if dock_prompt_popup.visible:
			dock_prompt_popup.visible = false
		return

	if docking_pull_in_progress:
		prompt_label.text = "Docking tractor active. Stand by for station alignment."
		return

	if player.is_launching():
		return

	var docking_prompt_enabled: bool = settings_manager().docking_prompt_enabled()
	if not docking_prompt_enabled:
		was_in_docking_range = true
		if has_active_mission() and mission_needs_turn_in(current_mission):
			prompt_label.text = "Docking corridor reached. Press E to dock and turn in your contract."
		else:
			prompt_label.text = "Docking corridor reached. Press E to dock."
		if Input.is_action_just_pressed("interact"):
			begin_docking_sequence()
		return

	if not was_in_docking_range and not docked_at_station and not docking_prompt_suppressed and not is_any_overlay_open():
		show_docking_prompt()
	was_in_docking_range = true

	if has_active_mission() and mission_needs_turn_in(current_mission):
		prompt_label.text = "Docking corridor reached. Press E to dock and turn in your contract."
	else:
		prompt_label.text = "Docking corridor reached. Press E to dock or continue past the station."

	if Input.is_action_just_pressed("interact"):
		show_docking_prompt()


func is_station_in_range() -> bool:
	return has_station_in_current_map() and (docked_at_station or player.global_position.distance_to(station.global_position) <= 120.0)


func is_station_docking_range() -> bool:
	return has_station_in_current_map() and (docked_at_station or player.global_position.distance_to(station.global_position) <= 210.0)


func get_nearest_resource(max_distance: float):
	var best_resource = null
	var best_distance := max_distance

	for child in resource_layer.get_children():
		var distance: float = player.global_position.distance_to(child.global_position)
		if distance < best_distance:
			best_distance = distance
			best_resource = child

	return best_resource


func total_cargo_count() -> int:
	var total := 0
	for item_type in ITEM_ORDER:
		total += cargo[item_type]
	return total


func mining_units_available_for_node(resource_node) -> int:
	var required_weight := item_weight(resource_node.resource_type)
	if resource_node.rare_resource != StringName():
		required_weight = max(required_weight, item_weight(resource_node.rare_resource))
	return int(floor(remaining_cargo_weight() / max(required_weight, 0.01)))


func sell_cargo() -> void:
	if not is_station_in_range():
		last_status_message = "Move closer to the station before selling."
		update_hud()
		return

	if projected_sale_value() <= 0:
		last_status_message = "Cargo hold is empty."
		push_telemetry_event("Docked with empty hold. No cargo available for sale.", "warning")
		update_hud()
		return

	var sale_value := projected_sale_value()
	var sold_units := 0
	for item_type in ITEM_ORDER:
		if item_type == BLACKWAKE_TAG:
			continue
		sold_units += cargo[item_type]

	credits += sale_value
	total_stats["credits_earned"] += sale_value
	for item_type in ITEM_ORDER:
		if item_type == BLACKWAKE_TAG:
			continue
		cargo[item_type] = 0

	gain_experience(max(2, int(round(2.0 + sold_units * 0.35))))
	award_use_skill_xp("trade", max(float(sold_units) * 0.35, 1.0), true)
	update_mission_progress("sell_value", sale_value)
	mark_onboarding_step("sell")
	last_status_message = "Sold cargo for %d credits." % sale_value
	push_telemetry_event("Cargo sold for %d credits." % sale_value, "sale")
	update_hud()


func sell_item_stack(item_type: StringName, requested_amount: int) -> void:
	if not is_station_in_range():
		last_status_message = "Move closer to the station before selling."
		update_hud()
		return
	if item_type == BLACKWAKE_TAG:
		last_status_message = "Blackwake cipher tags must be turned in at the bounty desk."
		update_hud()
		return

	var available: int = cargo[item_type]
	if available <= 0:
		return

	var sold_amount: int = min(requested_amount, available)
	var per_item_value: int = current_market_value(item_type)
	var sell_multiplier := (1.0 + sale_price_skill_bonus()) * freeport_market_bonus_multiplier()
	var sale_value := int(round(sold_amount * per_item_value * sell_multiplier))

	cargo[item_type] -= sold_amount
	credits += sale_value
	total_stats["credits_earned"] += sale_value

	gain_experience(max(1, int(round(1.0 + sold_amount * 0.28))))
	award_use_skill_xp("trade", max(float(sold_amount) * 0.3, 0.8))
	update_mission_progress("sell_value", sale_value)
	mark_onboarding_step("sell")
	last_status_message = "Sold %s x%d for %d credits." % [get_item_definition(item_type)["name"], sold_amount, sale_value]
	push_telemetry_event("Sold %s x%d for %d credits." % [get_item_definition(item_type)["name"], sold_amount, sale_value], "sale")
	update_hud()


func transfer_ship_to_station(item_type: StringName, requested_amount: int) -> void:
	if not is_station_in_range():
		return

	var available: int = cargo[item_type]
	if available <= 0:
		return

	var transfer_count: int = min(requested_amount, available)
	var moved := 0

	for stack in station_storage:
		if stack["type"] != item_type:
			continue
		var free_stack_space := STATION_STACK_LIMIT - int(stack["count"])
		if free_stack_space <= 0:
			continue
		var portion: int = min(transfer_count - moved, free_stack_space)
		stack["count"] += portion
		moved += portion
		if moved >= transfer_count:
			break

	while moved < transfer_count and station_storage.size() < station_storage_capacity:
		var new_stack_amount: int = min(transfer_count - moved, STATION_STACK_LIMIT)
		station_storage.append({"type": item_type, "count": new_stack_amount})
		moved += new_stack_amount

	if moved <= 0:
		last_status_message = "Station storage is full."
		push_telemetry_event("Storage vault full. No transfer completed.", "warning")
		update_hud()
		return

	cargo[item_type] -= moved
	update_mission_progress("intro_transfer_to_station", moved)
	last_status_message = "Stored %s x%d." % [get_item_definition(item_type)["name"], moved]
	push_telemetry_event("Moved %s x%d into station storage." % [get_item_definition(item_type)["name"], moved], "dock")
	update_hud()


func transfer_station_to_ship(slot_index: int, requested_amount: int) -> void:
	if slot_index < 0 or slot_index >= station_storage.size():
		return
	if not is_station_in_range():
		return

	var free_weight := remaining_cargo_weight()
	if free_weight <= 0.0:
		last_status_message = "Ship cargo hold is at its weight limit."
		push_telemetry_event("Unable to move cargo. Ship hold is full.", "warning")
		update_hud()
		return

	var stack := station_storage[slot_index]
	var max_by_weight := int(floor(free_weight / max(item_weight(stack["type"]), 0.01)))
	var moved: int = min(requested_amount, min(int(stack["count"]), max_by_weight))
	if moved <= 0:
		return

	cargo[stack["type"]] += moved
	stack["count"] -= moved

	if stack["count"] <= 0:
		station_storage.remove_at(slot_index)
	else:
		station_storage[slot_index] = stack

	last_status_message = "Withdrew %s x%d." % [get_item_definition(stack["type"])["name"], moved]
	push_telemetry_event("Moved %s x%d onto the ship." % [get_item_definition(stack["type"])["name"], moved], "dock")
	update_hud()


func storage_upgrade_cost() -> int:
	return discounted_cost(180 + station_storage_upgrades * 130, "storage")


func purchase_storage_slots() -> void:
	if not is_station_in_range():
		last_status_message = "Storage expansions are only available while docked."
		update_hud()
		return

	var cost := storage_upgrade_cost()
	if credits < cost:
		last_status_message = "Need %d more credits for new storage bays." % [cost - credits]
		push_telemetry_event("Insufficient credits for storage bay expansion.", "warning")
		update_hud()
		return

	credits -= cost
	station_storage_upgrades += 1
	station_storage_capacity += 4
	build_storage_slots()
	last_status_message = "Purchased 4 additional station storage slots."
	push_telemetry_event("Station storage expanded to %d slots." % station_storage_capacity, "upgrade")
	update_hud()


func refine_selected_input() -> void:
	if not is_station_in_range():
		last_status_message = "Move closer to the station before using the refinery."
		update_hud()
		return
	if refinery_job_active:
		stop_refinery_job()
		return

	if selected_refinery_input == StringName() or not refinery_recipes.has(selected_refinery_input):
		last_status_message = "Select a raw material before starting the refinery."
		push_telemetry_event("Refinery awaiting input material selection.", "warning")
		update_hud()
		return

	var available: int = refinery_source_item_count(selected_refinery_input, selected_refinery_source)
	if available <= 0:
		last_status_message = "Selected material is no longer available in %s." % refinery_source_display_name(selected_refinery_source).to_lower()
		push_telemetry_event("Refinery selection cleared. No cargo available.", "warning")
		selected_refinery_input = &""
		selected_refinery_amount = 0
		refresh_refinery_inventory()
		update_hud()
		return

	var refine_amount: int = min(selected_refinery_amount, available)
	if refine_amount <= 0:
		last_status_message = "Load an amount into the refinery first."
		push_telemetry_event("Refinery waiting on a loaded input amount.", "warning")
		update_hud()
		return
	var recipe: Dictionary = refinery_recipes[selected_refinery_input]
	var total_fee_discount: float = min(refinery_fee_discount_bonus() + research_refinery_fee_discount_bonus(), 0.55)
	var fee_each: int = int(round(discounted_cost(int(recipe["fee"]), "refinery") * max(1.0 - total_fee_discount, 0.45)))
	var total_fee := refine_amount * fee_each
	if credits < total_fee:
		last_status_message = "Need %d more credits for refinery fees." % [total_fee - credits]
		push_telemetry_event("Insufficient credits for refinery service.", "warning")
		update_hud()
		return
	var planned_output_queue: Array[Dictionary] = refinery_output_queue_for_batch(selected_refinery_input, refine_amount)
	var planned_output_counts: Dictionary = refinery_output_counts_from_queue(planned_output_queue)
	if planned_output_counts.is_empty():
		last_status_message = "Refinery output plan failed. Check the selected recipe."
		push_telemetry_event("Refinery could not build an output plan for the selected input.", "warning")
		update_hud()
		return

	if selected_refinery_source == "station":
		if not simulate_station_storage_fit(planned_output_counts):
			last_status_message = "No room in station inventory for refined output."
			push_telemetry_event("Refinery output blocked by full station inventory.", "warning")
			update_hud()
			return
	credits -= total_fee
	update_mission_progress("refine_goods", refine_amount)
	refinery_job_source = selected_refinery_source
	refinery_job_input = selected_refinery_input
	refinery_job_amount = refine_amount
	refinery_last_input = selected_refinery_input
	refinery_last_input_amount = refine_amount
	refinery_job_completed_outputs = {}
	refinery_last_completed_outputs = {}
	refinery_job_output_queue = planned_output_queue
	refinery_job_pending_outputs = planned_output_counts
	refinery_job_active = true
	refinery_job_timer = 0.0
	refinery_job_duration = current_refinery_cycle_duration()
	refinery_last_output_source = selected_refinery_source
	refinery_progress.value = 0.0
	last_status_message = "Refinery queue started for %s x%d." % [str(get_item_definition(selected_refinery_input).get("name", selected_refinery_input)), refine_amount]
	push_telemetry_event("Refinery processing %s x%d one cycle at a time." % [str(get_item_definition(selected_refinery_input).get("name", selected_refinery_input)), refine_amount], "dock")
	refresh_refinery_inventory()
	update_hud()


func refuel_ship() -> void:
	if not is_station_in_range():
		last_status_message = "Move closer to the station before refueling."
		update_hud()
		return

	var cost := refuel_cost()
	if cost <= 0:
		last_status_message = "Fuel tanks are already full."
		push_telemetry_event("Fuel tanks already at capacity.", "dock")
		update_hud()
		return

	if credits < cost:
		last_status_message = "Need %d more credits to refuel." % [cost - credits]
		push_telemetry_event("Insufficient credits for refuel service.", "warning")
		update_hud()
		return

	credits -= cost
	current_fuel = ship_stats["fuel_capacity"]
	last_status_message = "Refueled ship for %d credits." % cost
	push_telemetry_event("Refuel complete. %.0f fuel units restored." % ship_stats["fuel_capacity"], "dock")
	update_hud()


func missile_restock_cost() -> int:
	return discounted_cost(max(SPECIAL_MISSILE_MAX_AMMO - special_ammo, 0) * 13, "restock")


func restock_missiles() -> void:
	if not is_station_in_range():
		last_status_message = "Move closer to the station before requesting combat support."
		update_hud()
		return

	if special_ammo >= SPECIAL_MISSILE_MAX_AMMO:
		last_status_message = "Missile racks already loaded."
		push_telemetry_event("Combat support confirms missile racks are full.", "dock")
		update_hud()
		return

	var cost := missile_restock_cost()
	if credits < cost:
		last_status_message = "Need %d more credits to restock missiles." % [cost - credits]
		push_telemetry_event("Insufficient credits for missile rearm.", "warning")
		update_hud()
		return

	credits -= cost
	special_ammo = SPECIAL_MISSILE_MAX_AMMO
	last_status_message = "Missile racks restocked for %d credits." % cost
	push_telemetry_event("Station support rearmed all missile racks.", "dock")
	update_hud()


func hull_repair_cost() -> int:
	return discounted_cost(int(ceil(float(player_hull_cap() - player_hull) * 2.1)), "repair")


func repair_hull() -> void:
	if not is_station_in_range():
		last_status_message = "Move closer to the station before requesting repairs."
		update_hud()
		return

	if player_hull >= player_hull_cap():
		last_status_message = "Hull plating is already at full integrity."
		push_telemetry_event("Repair crews report full hull integrity.", "dock")
		update_hud()
		return

	var cost := hull_repair_cost()
	if credits < cost:
		last_status_message = "Need %d more credits for hull repairs." % [cost - credits]
		push_telemetry_event("Insufficient credits for repair crews.", "warning")
		update_hud()
		return

	credits -= cost
	player_hull = player_hull_cap()
	player_shield = player_shield_cap()
	last_status_message = "Hull repairs complete for %d credits." % cost
	push_telemetry_event("Hull restored to full integrity.", "dock")
	update_hud()


func try_buy_upgrade(upgrade_type: String) -> void:
	if not is_station_in_range():
		last_status_message = "Upgrades are only available while docked at the station."
		update_hud()
		return

	var cost := get_upgrade_cost(upgrade_type)
	if credits < cost:
		last_status_message = "Need %d more credits for the %s upgrade." % [cost - credits, upgrade_type]
		push_telemetry_event("Insufficient credits for %s upgrade." % upgrade_type.capitalize(), "warning")
		update_hud()
		return

	credits -= cost
	var previous_fuel_capacity: float = ship_stats["fuel_capacity"]
	upgrades[upgrade_type] += 1
	recalculate_ship_stats()
	if upgrade_type == "fuel":
		current_fuel = min(current_fuel, previous_fuel_capacity)
	update_mission_progress("buy_upgrade", 1)
	last_status_message = "%s upgraded to tier %d." % [upgrade_type.capitalize(), upgrades[upgrade_type]]
	push_telemetry_event("%s upgraded to tier %d." % [upgrade_type.capitalize(), upgrades[upgrade_type]], "upgrade")
	update_hud()


func try_buy_skill_node(node_id: String) -> void:
	if skill_points <= 0:
		last_status_message = "Earn skill points from pilot milestone levels."
		push_telemetry_event("No skill points available for allocation.", "warning")
		update_hud()
		return

	var node := find_skill_node(node_id)
	if node.is_empty():
		return
	var lock_reason := skill_tree_specialization_lock_reason(node)
	if not lock_reason.is_empty():
		last_status_message = lock_reason
		push_telemetry_event(lock_reason, "warning")
		update_hud()
		return
	if not skill_node_requirement_met(node):
		last_status_message = "Required prior node not unlocked."
		push_telemetry_event("Skill node blocked until its prerequisite is unlocked.", "warning")
		update_hud()
		return
	if skill_node_rank(node_id) >= int(node.get("max_rank", 1)):
		last_status_message = "Skill node already maxed."
		update_hud()
		return

	skill_points -= 1
	skill_node_ranks[node_id] = skill_node_rank(node_id) + 1
	recalculate_ship_stats()
	var tree_id := str(node.get("tree", ""))
	last_status_message = "%s node advanced to rank %d." % [str(node.get("title", "")), skill_node_rank(node_id)]
	push_telemetry_event("%s training advanced in %s." % [str(node.get("title", "")), tree_id.capitalize()], "upgrade")
	update_hud()


func get_upgrade_cost(upgrade_type: String) -> int:
	match upgrade_type:
		"engine":
			return discounted_cost(180 + upgrades["engine"] * 155, "shipyard")
		"cargo":
			return discounted_cost(320 + upgrades["cargo"] * 250, "shipyard")
		"mining":
			return discounted_cost(220 + upgrades["mining"] * 180, "shipyard")
		"fuel":
			return discounted_cost(170 + upgrades["fuel"] * 150, "shipyard")
		"shield":
			return discounted_cost(210 + upgrades["shield"] * 170, "shipyard")
		"hull":
			return discounted_cost(230 + upgrades["hull"] * 180, "shipyard")
		"laser":
			return discounted_cost(240 + upgrades["laser"] * 190, "shipyard")
		"special":
			return discounted_cost(260 + upgrades["special"] * 205, "shipyard")
		_:
			return 9999


func recalculate_ship_stats() -> void:
	var speed_multiplier: float = 1.0 + research_effect_total("research_engine_speed_bonus") + research_effect_total("research_propulsion_matrix")
	var acceleration_multiplier: float = 1.0 + research_effect_total("research_engine_acceleration_bonus") + research_effect_total("research_propulsion_matrix")
	var fuel_multiplier: float = 1.0 + research_effect_total("research_fuel_capacity_bonus")
	ship_stats["speed"] = (300.0 + upgrades["engine"] * 45.0) * speed_multiplier
	ship_stats["acceleration"] = (650.0 + upgrades["engine"] * 95.0) * acceleration_multiplier
	ship_stats["cargo_capacity"] = 120.0 + upgrades["cargo"] * 16.0 + skill_node_effect_total("cargo_capacity_bonus")
	ship_stats["mining_power"] = 1.0 + upgrades["mining"] * 0.34 + mining_power_skill_bonus() + mining_extraction_speed_bonus()
	ship_stats["fuel_capacity"] = (120.0 + upgrades["fuel"] * 30.0) * fuel_multiplier
	ship_stats["shield_bonus"] = float(upgrades["shield"]) * 5.0
	ship_stats["hull_bonus"] = float(upgrades["hull"]) * 7.0
	ship_stats["laser_damage_bonus"] = float(upgrades["laser"]) * 0.8
	ship_stats["special_damage_bonus"] = float(upgrades["special"]) * 1.4
	current_fuel = min(current_fuel, ship_stats["fuel_capacity"])
	player.configure(ship_stats["speed"], ship_stats["acceleration"])


func gain_experience(amount: int) -> void:
	if level >= MAX_PLAYER_LEVEL:
		experience = min(experience, experience_to_next_level())
		return
	experience += amount
	while level < MAX_PLAYER_LEVEL and experience >= experience_to_next_level():
		experience -= experience_to_next_level()
		level += 1
		var awarded_points := skill_points_awarded_for_level(level)
		skill_points += awarded_points
		recalculate_ship_stats()
		last_status_message = "Level up. Pilot level %d confirmed." % level
		if awarded_points > 0:
			last_status_message += " +%d skill point%s." % [awarded_points, "s" if awarded_points != 1 else ""]
			push_telemetry_event("Level %d reached. +%d skill point%s granted." % [level, awarded_points, "s" if awarded_points != 1 else ""], "mission")
		else:
			push_telemetry_event("Level %d reached. No skill points awarded at this milestone." % level, "system")


func experience_to_next_level() -> int:
	if level >= MAX_PLAYER_LEVEL:
		return 0
	return 180 + int(level * 72) + int(pow(float(level), 1.72) * 24.0)


func update_mission_progress(kind: String, amount: int) -> void:
	for mission_index in range(active_missions.size() - 1, -1, -1):
		var mission: Dictionary = active_missions[mission_index]
		if not current_map_matches_mission_location(mission):
			continue
		if str(mission.get("progress_key", mission.get("id", ""))) != kind:
			continue
		mission["progress"] = min(int(mission.get("progress", 0)) + amount, int(mission.get("goal", 0)))
		if int(mission["progress"]) < int(mission.get("goal", 0)):
			continue
		if is_intro_mission(mission):
			handle_intro_mission_completion(mission_index)
			continue
		mission["ready_to_turn_in"] = true
		if mission_index == current_mission_index:
			last_status_message = "Contract complete. Return to the station mission board to turn it in."
			push_telemetry_event("Contract complete. Dock and turn in at the mission board.", "mission")
			if bool(mission.get("important", false)):
				open_intro_stage_popup(
					mission,
					"UPDATE",
					"Objective complete",
					"Primary objective complete. Return to the station mission board to turn this introduction contract in."
				)
	update_hud()


func update_hud() -> void:
	ensure_tracked_mission_valid()
	sync_active_delivery_mission_progress()
	refresh_onboarding_panel()
	fps_label.visible = bool(settings_manager().get_value("visuals", "show_fps")) and not dock_screen.visible and not pause_popup.visible and not options_popup.visible
	fps_label.text = "FPS %d" % Engine.get_frames_per_second()
	level_value.text = str(level)
	credits_value.text = str(credits)
	cargo_value.text = "%s / %s" % [format_weight(total_cargo_weight()), format_weight(ship_stats["cargo_capacity"])]
	fuel_value.text = "%.0f / %.0f" % [current_fuel, ship_stats["fuel_capacity"]]
	hull_value.text = "H %d%%  |  S %d%%" % [
		int(round(float(player_hull) / max(float(player_hull_cap()), 1.0) * 100.0)),
		int(round(player_shield / max(player_shield_cap(), 1.0) * 100.0)),
	]
	ship_caption.text = "%s / %s" % [current_system_name(), current_map_name()]
	ship_class.text = "Prospector Mk-I  |  %s" % ["Combat Mode" if combat_mode else "Operations Mode"]
	style_arm_indicator(combat_mode)
	arm_button.text = "ARMED" if combat_mode else "ARM"
	combat_panel.visible = combat_mode and not dock_screen.visible
	combat_mode_label.text = "Mode: %s  |  Hull %d%%  |  Shield %d%%" % [
		"Combat" if combat_mode else "Operations",
		int(round(float(player_hull) / max(float(player_hull_cap()), 1.0) * 100.0)),
		int(round(player_shield / max(player_shield_cap(), 1.0) * 100.0)),
	]
	combat_weapons_label.text = "Missiles: %d / %d  |  Cooldown %s" % [
		special_ammo,
		SPECIAL_MISSILE_MAX_AMMO,
		"READY" if special_weapon_cooldown <= 0.0 else "%.1fs" % special_weapon_cooldown,
	]
	var lock_text := "Lock: No target"
	if lock_target_id != -1:
		lock_text = "Lock: %.0f%%" % (clampf(lock_progress / combat_lock_time(), 0.0, 1.0) * 100.0)
		if lock_progress >= combat_lock_time():
			lock_text = "Lock: CONFIRMED"
	combat_lock_label.text = lock_text
	var target_line := "Target: none"
	var target: Dictionary = targeted_hostile()
	if not target.is_empty():
		var crippled_suffix := "  |  CRIPPLED" if bool(target.get("disabled", false)) else ""
		target_line = "Target: %s  |  Shield %d / %d  |  Hull %d / %d%s" % [
			hostile_display_name(target),
			int(round(float(target.get("shield", 0.0)))),
			int(round(float(target.get("max_shield", 0.0)))),
			int(target["hull"]),
			int(target["max_hull"]),
			crippled_suffix,
		]
	combat_target_label.text = target_line
	dock_status_value.text = "%s" % current_station_name()
	if has_active_mission():
		if mission_needs_turn_in(current_mission):
			dock_status_body.text = "Contract ready to turn in: %s" % current_mission["short_name"]
		else:
			dock_status_body.text = "Active contract: %s" % current_mission["short_name"]
	else:
		dock_status_body.text = "%s  |  %s" % [current_system_name(), map_control_summary()]
	dock_ship_name.text = "STARHAUL  |  %s" % current_map_name()
	dock_ship_stats.text = "Speed %.0f  |  Cargo %s / %s  |  Fuel %.0f / %.0f  |  Missiles %d / %d  |  Laser %.2f" % [
		ship_stats["speed"],
		format_weight(total_cargo_weight()),
		format_weight(ship_stats["cargo_capacity"]),
		current_fuel,
		ship_stats["fuel_capacity"],
		special_ammo,
		SPECIAL_MISSILE_MAX_AMMO,
		float(player_laser_damage()),
	]
	dock_credits_value.text = "%d CR" % credits
	dock_credits_subtext.visible = false
	pilot_summary.text = build_pilot_summary_text()
	field_pilot_summary.text = build_pilot_summary_text()
	main_menu_summary.text = "Choose a room."
	refresh_market_manifest()
	sell_summary.text = build_market_summary_text()
	refuel_button.text = "REFUEL (%d CR)" % refuel_cost()
	refuel_button.tooltip_text = ""
	var bounty_count := total_accessible_item_count(BLACKWAKE_TAG)
	bounty_turn_in_button.text = "TURN IN BOUNTIES" if bounty_count <= 0 else "TURN IN BOUNTIES (%d)" % bounty_count
	storage_summary.text = "Used %d / %d slots" % [station_storage.size(), station_storage_capacity]
	ship_storage_summary.text = "Cargo %s / %s  |  150 stack max" % [format_weight(total_cargo_weight()), format_weight(ship_stats["cargo_capacity"])]
	ship_storage_hint.text = "LMB 1  |  RMB amount  |  Shift stack"
	storage_hint.text = "LMB 1  |  RMB amount  |  Shift stack"
	storage_expand_button.text = "BUY +4 SLOTS (%d CR)" % storage_upgrade_cost()
	refresh_skill_tree_panel()
	research_summary.text = "%d mapped node%s" % [research_node_count(), "s" if research_node_count() != 1 else ""]
	research_hint.text = STARHAUL_RESEARCH_LIB.TREE_HINT
	refresh_research_tree_panel()
	refresh_crafting_panel()
	factions_summary.text = build_faction_summary_text()
	pilot_detail_text.text = build_pilot_detail_text()
	field_pilot_detail.text = build_pilot_detail_text()
	refresh_field_skills_panel()
	faction_list.text = build_faction_list_text()
	restock_button.text = "RESTOCK MISSILES (%d CR)" % missile_restock_cost()
	shipyard_info.text = "Select an upgrade."
	engine_button.text = "ENGINE\nT%d\n%d CR" % [upgrades["engine"] + 1, get_upgrade_cost("engine")]
	cargo_button.text = "CARGO\nT%d\n%d CR" % [upgrades["cargo"] + 1, get_upgrade_cost("cargo")]
	mining_button.text = "MINING\nT%d\n%d CR" % [upgrades["mining"] + 1, get_upgrade_cost("mining")]
	fuel_button.text = "FUEL\nT%d\n%d CR" % [upgrades["fuel"] + 1, get_upgrade_cost("fuel")]
	shield_button.text = "SHIELD\nT%d\n%d CR" % [upgrades["shield"] + 1, get_upgrade_cost("shield")]
	hull_button.text = "HULL\nT%d\n%d CR" % [upgrades["hull"] + 1, get_upgrade_cost("hull")]
	laser_button.text = "LASER\nT%d\n%d CR" % [upgrades["laser"] + 1, get_upgrade_cost("laser")]
	special_button.text = "SPECIAL\nT%d\n%d CR" % [upgrades["special"] + 1, get_upgrade_cost("special")]
	dock_footer_status.text = "Station main menu ready." if current_dock_room == "" else "Room active: %s" % current_dock_room.capitalize()
	rebuild_field_mission_list()
	if has_active_mission():
		field_mission_name.text = "TRACKED MISSION"
		field_mission_description.text = "[%s] %s" % [faction_name(str(current_mission.get("faction", ""))), current_mission["description"]]
		field_mission_progress.text = "Progress %s  |  Target %s  |  Guidance %s" % [
			mission_progress_label(current_mission),
			mission_target_label(current_mission),
			mission_direction_text(current_mission),
		]
		var delivery_suffix := ""
		if mission_requires_delivery(current_mission):
			delivery_suffix = "  |  Turn-in %s" % mission_delivery_status_text(current_mission)
		field_mission_rewards.text = "Rewards: %d credits, %d XP%s%s" % [
			current_mission["reward_credits"],
			actual_mission_xp_reward(current_mission),
			"  |  Ready to turn in" if mission_needs_turn_in(current_mission) else "",
			delivery_suffix,
		]
	else:
		field_mission_name.text = "No Active Contract"
		field_mission_list_title.visible = false
		field_mission_description.text = "Visit the station mission board and accept a contract before launch."
		field_mission_progress.text = "Progress 0 / 0"
		field_mission_rewards.text = "Rewards: accept a mission to view payout details."

	repair_button.text = "Hull Repairs (%d cr)" % hull_repair_cost()
	exchange_room_button.text = "COMMODITY EXCHANGE"
	storage_room_button.text = "STATION STORAGE"
	refinery_room_button.text = "REFINERY"
	crafting_room_button.text = "CRAFTING"
	shipyard_room_button.text = "SHIPYARD"
	crew_room_button.text = "TRAINING"
	research_room_button.text = "RESEARCH"
	faction_room_button.text = "PILOT PROFILE"
	mission_room_button.text = "MISSION BOARD"
	cargo_room_button.text = "CARGO HOLD"
	apply_guided_station_highlights()
	prompt_label.add_theme_color_override("font_color", Color(1.0, 0.42, 0.42) if combat_mode else Color(0.89, 0.95, 1.0))
	if field_console_popup.visible:
		refresh_field_console()
	refresh_inventory_popup()
	refresh_ship_storage_slots()
	refresh_storage_slots()
	refresh_refinery_inventory()
	refresh_mission_board()
