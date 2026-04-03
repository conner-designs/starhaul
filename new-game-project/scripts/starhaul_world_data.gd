class_name StarhaulWorldData
extends RefCounted


const STARHAUL_DATA_LIB := preload("res://scripts/starhaul_data.gd")


static func map_key(coord: Vector2i) -> String:
	return "%d,%d" % [coord.x, coord.y]


static func build_resource_node_templates(
		ore_textures: Array,
		nickel_textures: Array,
		copper_textures: Array,
		titanium_textures: Array,
		ice_textures: Array,
		crystal_textures: Array,
		debris_textures: Array
	) -> Array[Dictionary]:
	return [
		{"id": "iron", "weight": 0.36, "node_name": "Iron Asteroid", "primary_resource": STARHAUL_DATA_LIB.ORE, "rare_resource": STARHAUL_DATA_LIB.IRIDIUM, "rare_chance": 0.04, "amount_min": 8, "amount_max": 14, "interval_min": 0.72, "interval_max": 0.98, "scale_min": 0.92, "scale_max": 1.36, "body_color": Color(0.78, 0.8, 0.86), "textures": ore_textures, "texture_tint": Color(0.9, 0.92, 0.96, 1.0), "profiles": ["standard", "foundry", "survey", "frontier", "consortium", "secure", "raider"], "required_mining_stage": 0, "scan_description": "Dense ferrous asteroid with dependable industrial yield."},
		{"id": "nickel", "weight": 0.18, "node_name": "Nickel Asteroid", "primary_resource": STARHAUL_DATA_LIB.NICKEL, "rare_resource": STARHAUL_DATA_LIB.IRIDIUM, "rare_chance": 0.025, "amount_min": 6, "amount_max": 11, "interval_min": 0.78, "interval_max": 1.02, "scale_min": 0.9, "scale_max": 1.28, "body_color": Color(0.78, 0.76, 0.66), "textures": nickel_textures, "texture_tint": Color(0.96, 0.88, 0.74, 1.0), "profiles": ["foundry", "frontier", "consortium", "raider"], "required_mining_stage": 2, "scan_description": "Nickel-rich body with layered industrial alloy seams."},
		{"id": "copper", "weight": 0.15, "node_name": "Copper Asteroid", "primary_resource": STARHAUL_DATA_LIB.COPPER, "rare_resource": StringName(), "rare_chance": 0.0, "amount_min": 6, "amount_max": 10, "interval_min": 0.76, "interval_max": 1.0, "scale_min": 0.88, "scale_max": 1.22, "body_color": Color(0.9, 0.62, 0.44), "textures": copper_textures, "texture_tint": Color(1.0, 0.76, 0.6, 1.0), "profiles": ["foundry", "survey", "frontier", "consortium"], "required_mining_stage": 1, "scan_description": "Conductive copper seam with bright oxidized fracture lines."},
		{"id": "titanium", "weight": 0.12, "node_name": "Titanium Asteroid", "primary_resource": STARHAUL_DATA_LIB.TITANIUM, "rare_resource": STARHAUL_DATA_LIB.IRIDIUM, "rare_chance": 0.03, "amount_min": 5, "amount_max": 9, "interval_min": 0.88, "interval_max": 1.16, "scale_min": 0.94, "scale_max": 1.24, "body_color": Color(0.76, 0.82, 0.92), "textures": titanium_textures, "texture_tint": Color(0.86, 0.92, 1.0, 1.0), "profiles": ["foundry", "consortium", "raider"], "required_mining_stage": 5, "scan_description": "Hard aerospace-grade shell with dense titanium returns."},
		{"id": "cobalt", "weight": 0.1, "node_name": "Cobalt Asteroid", "primary_resource": STARHAUL_DATA_LIB.COBALT, "rare_resource": STARHAUL_DATA_LIB.IRIDIUM, "rare_chance": 0.03, "amount_min": 5, "amount_max": 8, "interval_min": 0.9, "interval_max": 1.18, "scale_min": 0.9, "scale_max": 1.18, "body_color": Color(0.48, 0.68, 0.96), "textures": ore_textures, "texture_tint": Color(0.58, 0.8, 1.0, 1.0), "profiles": ["consortium", "raider"], "required_mining_stage": 3, "scan_description": "Battery-grade cobalt deposits bound deep under a dense crust."},
		{"id": "silver", "weight": 0.08, "node_name": "Silver Vein", "primary_resource": STARHAUL_DATA_LIB.SILVER, "rare_resource": StringName(), "rare_chance": 0.0, "amount_min": 4, "amount_max": 7, "interval_min": 0.92, "interval_max": 1.2, "scale_min": 0.82, "scale_max": 1.08, "body_color": Color(0.9, 0.92, 0.98), "textures": ore_textures, "texture_tint": Color(0.94, 0.96, 1.0, 1.0), "profiles": ["survey", "frontier", "raider"], "required_mining_stage": 6, "scan_description": "Bright reflective vein body showing premium conductive traces."},
		{"id": "gold", "weight": 0.05, "node_name": "Gold Vein", "primary_resource": STARHAUL_DATA_LIB.GOLD, "rare_resource": StringName(), "rare_chance": 0.0, "amount_min": 4, "amount_max": 6, "interval_min": 1.0, "interval_max": 1.28, "scale_min": 0.8, "scale_max": 1.06, "body_color": Color(0.98, 0.84, 0.42), "textures": ore_textures, "texture_tint": Color(1.0, 0.9, 0.52, 1.0), "profiles": ["frontier", "raider"], "required_mining_stage": 7, "scan_description": "Noble-metal vein with bright broker-grade gold pockets."},
		{"id": "lindrite", "weight": 0.03, "node_name": "Lindrite Geode", "primary_resource": STARHAUL_DATA_LIB.LINDRITE, "rare_resource": StringName(), "rare_chance": 0.0, "amount_min": 3, "amount_max": 5, "interval_min": 1.08, "interval_max": 1.36, "scale_min": 0.86, "scale_max": 1.12, "body_color": Color(0.92, 0.68, 0.9), "textures": ore_textures, "texture_tint": Color(0.98, 0.74, 0.96, 1.0), "profiles": ["consortium", "raider"], "required_mining_stage": 8, "scan_description": "Rare luminous ore body with stable exotic lattice bands. Deep extraction recommended."},
		{"id": "crystal", "weight": 0.24, "node_name": "Crystal Cluster", "primary_resource": STARHAUL_DATA_LIB.CRYSTAL, "rare_resource": STARHAUL_DATA_LIB.QUANTUM_SHARD, "rare_chance": 0.07, "amount_min": 4, "amount_max": 8, "interval_min": 0.92, "interval_max": 1.24, "scale_min": 0.68, "scale_max": 1.02, "body_color": Color(0.45, 0.96, 1.0), "textures": crystal_textures, "required_mining_stage": 4, "scan_description": "Charged lattice growth with unstable quantum inclusions."},
		{"weight": 0.23, "node_name": "Ice Mass", "primary_resource": STARHAUL_DATA_LIB.ICE, "rare_resource": STARHAUL_DATA_LIB.HELIUM3, "rare_chance": 0.06, "amount_min": 6, "amount_max": 10, "interval_min": 0.82, "interval_max": 1.08, "scale_min": 0.84, "scale_max": 1.18, "body_color": Color(0.73, 0.9, 1.0), "textures": ice_textures, "scan_description": "Supercooled ice carrying fuel-grade isotope traces."},
		{"weight": 0.19, "node_name": "Ship Debris", "primary_resource": STARHAUL_DATA_LIB.SCRAP, "rare_resource": STARHAUL_DATA_LIB.ANCIENT_RELIC, "rare_chance": 0.05, "amount_min": 5, "amount_max": 9, "interval_min": 0.78, "interval_max": 1.12, "scale_min": 0.8, "scale_max": 1.14, "body_color": Color(0.78, 0.64, 0.53), "textures": debris_textures, "scan_description": "Broken hull fragments and torn ship plating drifting in a loose debris field."},
	]


static func _make_map_data(
		coord: Vector2i,
		label: String,
		control_state: String,
		controlling_faction: String,
		has_station: bool,
		station_faction: String,
		station_name: String,
		resource_bias: float,
		salvage_bias: float,
		danger_level: float,
		description: String,
		map_resource_base_count: int,
		style_tag: String = "standard",
		resource_profile: String = "standard",
		solar_map_flag: bool = false
	) -> Dictionary:
	return {
		"coord": coord,
		"label": label,
		"control_state": control_state,
		"controlling_faction": controlling_faction,
		"has_station": has_station,
		"station_faction": station_faction,
		"station_name": station_name,
		"resource_bias": resource_bias,
		"salvage_bias": salvage_bias,
		"danger_level": danger_level,
		"description": description,
		"style_tag": style_tag,
		"resource_profile": resource_profile,
		"is_solar_map": solar_map_flag,
		"resource_target": int(round(map_resource_base_count * resource_bias)),
		"station_position": Vector2.ZERO,
	}


static func build_system_registry(system_grid_size: int, map_resource_base_count: int) -> Dictionary:
	var neutral_maps := {}
	for y in range(system_grid_size):
		for x in range(system_grid_size):
			var coord := Vector2i(x, y)
			neutral_maps[map_key(coord)] = _make_map_data(coord, "Transit Grid %d-%d" % [x + 1, y + 1], "neutral", "", false, "", "", 1.0, 0.2, 0.08, "Neutral extraction lanes with stable traffic and routine mining chatter.", map_resource_base_count, "standard", "standard")
	neutral_maps[map_key(Vector2i(2, 2))] = _make_map_data(Vector2i(2, 2), "Helios Core", "neutral", "", false, "", "", 0.0, 0.0, 0.02, "The system sun dominates this map. No docking lanes, no ordinary extraction, just the burn of the central star.", map_resource_base_count, "solar_core", "solar", true)
	neutral_maps[map_key(Vector2i(2, 1))] = _make_map_data(Vector2i(2, 1), "Orbital Dock Hub", "neutral", "", true, "freeport_assembly", "Orbital Dock", 1.0, 0.15, 0.04, "Primary neutral dock zone with exchange traffic and service support.", map_resource_base_count, "standard", "standard")
	neutral_maps[map_key(Vector2i(1, 2))] = _make_map_data(Vector2i(1, 2), "Foundry Belt", "neutral", "", false, "", "", 1.35, 0.12, 0.08, "A heavier ore belt used for steady industrial mining runs.", map_resource_base_count, "standard", "foundry")
	neutral_maps[map_key(Vector2i(3, 2))] = _make_map_data(Vector2i(3, 2), "Survey Reach", "neutral", "", false, "", "", 1.08, 0.16, 0.1, "Wide-open survey lanes with stronger scanner returns and sparse hostiles.", map_resource_base_count, "standard", "survey")
	neutral_maps[map_key(Vector2i(2, 3))] = _make_map_data(Vector2i(2, 3), "Wreckfield Margin", "salvage_zone", "", false, "", "", 0.9, 1.25, 0.16, "An old debris belt from a past convoy disaster. Salvage rich, but not fully lawless.", map_resource_base_count, "standard", "frontier")
	neutral_maps[map_key(Vector2i(3, 1))] = _make_map_data(Vector2i(3, 1), "Open Frontier", "neutral", "", false, "", "", 1.12, 0.28, 0.18, "Looser traffic lanes where scans turn up better fields and more uncertain contacts.", map_resource_base_count, "standard", "frontier")
	neutral_maps[map_key(Vector2i(4, 2))] = _make_map_data(Vector2i(4, 2), "Free Drift", "contested", "", false, "", "", 1.1, 0.24, 0.3, "A loosely monitored fringe map where raider events can break through more often.", map_resource_base_count, "standard", "raider")

	var deepcore_maps := {}
	for y in range(system_grid_size):
		for x in range(system_grid_size):
			var coord := Vector2i(x, y)
			deepcore_maps[map_key(coord)] = _make_map_data(coord, "Consortium Lane %d-%d" % [x + 1, y + 1], "controlled", "deepcore_consortium", x == 2 and y == 1, "deepcore_consortium" if x == 2 and y == 1 else "", "Deepcore Station" if x == 2 and y == 1 else "", 1.25, 0.15, 0.0, "Deepcore-managed mining lanes with heavy industrial traffic.", map_resource_base_count, "standard", "consortium")
	deepcore_maps[map_key(Vector2i(2, 2))] = _make_map_data(Vector2i(2, 2), "Furnace Crown", "controlled", "deepcore_consortium", false, "", "", 0.0, 0.0, 0.0, "A white-hot industrial star at the heart of consortium space, driving dense heavy-metal formation through the inner lanes.", map_resource_base_count, "solar_core", "solar", true)

	var paladin_maps := {}
	for y in range(system_grid_size):
		for x in range(system_grid_size):
			var coord := Vector2i(x, y)
			paladin_maps[map_key(coord)] = _make_map_data(coord, "Ward Grid %d-%d" % [x + 1, y + 1], "controlled", "paladins", x == 2 and y == 1, "paladins" if x == 2 and y == 1 else "", "Paladin Watch" if x == 2 and y == 1 else "", 0.95, 0.12, 0.0, "Patrolled lanes with secure approach corridors and quiet mining windows.", map_resource_base_count, "standard", "secure")
	paladin_maps[map_key(Vector2i(2, 2))] = _make_map_data(Vector2i(2, 2), "Aegis Starwell", "controlled", "paladins", false, "", "", 0.0, 0.0, 0.0, "A bright patrol-system star with quiet inner lanes and tightly controlled traffic near the core.", map_resource_base_count, "solar_core", "solar", true)

	var blackwake_maps := {}
	for y in range(system_grid_size):
		for x in range(system_grid_size):
			var coord := Vector2i(x, y)
			blackwake_maps[map_key(coord)] = _make_map_data(coord, "Red Wake %d-%d" % [x + 1, y + 1], "contested", "blackwake", false, "", "", 0.92, 0.55, 0.42, "Dangerous fringe territory with broken wreck lanes and raider signatures.", map_resource_base_count, "standard", "raider")
	blackwake_maps[map_key(Vector2i(2, 1))] = _make_map_data(Vector2i(2, 1), "Raider Anchorage", "controlled", "blackwake", true, "blackwake", "Blackwake Anchorage", 0.88, 0.6, 0.0, "A hostile-controlled anchorage held under Blackwake authority.", map_resource_base_count, "standard", "raider")
	blackwake_maps[map_key(Vector2i(2, 2))] = _make_map_data(Vector2i(2, 2), "Red Wake Core", "contested", "blackwake", false, "", "", 0.0, 0.0, 0.06, "A red dwarf star wrapped in broken wreck lanes and raider traffic. Valuable, dangerous, and never quiet.", map_resource_base_count, "solar_core", "solar", true)

	return {
		"neutral_reach": {
			"name": "Neutral Reach",
			"description": "Starter neutral system with a main dock, mining lanes, and a few unstable fringe maps.",
			"main_station_map": Vector2i(2, 1),
			"main_station_name": "Orbital Dock",
			"controller": "",
			"star_type": "Yellow Main Sequence",
			"resource_biases": {
				STARHAUL_DATA_LIB.ORE: 1.18,
				STARHAUL_DATA_LIB.NICKEL: 1.02,
				STARHAUL_DATA_LIB.COPPER: 1.04,
				STARHAUL_DATA_LIB.TITANIUM: 0.82,
				STARHAUL_DATA_LIB.COBALT: 0.72,
				STARHAUL_DATA_LIB.SILVER: 0.86,
				STARHAUL_DATA_LIB.GOLD: 0.72,
				STARHAUL_DATA_LIB.LINDRITE: 0.6,
				STARHAUL_DATA_LIB.ICE: 1.0,
				STARHAUL_DATA_LIB.CRYSTAL: 1.0,
				STARHAUL_DATA_LIB.SCRAP: 1.0,
			},
			"maps": neutral_maps,
		},
		"deepcore_march": {
			"name": "Deepcore March",
			"description": "A tightly held industrial system dominated by consortium extraction lanes.",
			"main_station_map": Vector2i(2, 1),
			"main_station_name": "Deepcore Station",
			"controller": "deepcore_consortium",
			"star_type": "White Industrial Star",
			"resource_biases": {
				STARHAUL_DATA_LIB.ORE: 1.08,
				STARHAUL_DATA_LIB.NICKEL: 1.12,
				STARHAUL_DATA_LIB.COPPER: 1.06,
				STARHAUL_DATA_LIB.TITANIUM: 1.22,
				STARHAUL_DATA_LIB.COBALT: 1.24,
				STARHAUL_DATA_LIB.SILVER: 0.82,
				STARHAUL_DATA_LIB.GOLD: 0.76,
				STARHAUL_DATA_LIB.LINDRITE: 1.12,
				STARHAUL_DATA_LIB.ICE: 0.92,
				STARHAUL_DATA_LIB.CRYSTAL: 0.86,
				STARHAUL_DATA_LIB.SCRAP: 0.82,
			},
			"maps": deepcore_maps,
		},
		"paladin_front": {
			"name": "Paladin Front",
			"description": "Secure patrol lanes and escort traffic under Paladin protection.",
			"main_station_map": Vector2i(2, 1),
			"main_station_name": "Paladin Watch",
			"controller": "paladins",
			"star_type": "Blue-White Patrol Star",
			"resource_biases": {
				STARHAUL_DATA_LIB.ORE: 1.0,
				STARHAUL_DATA_LIB.NICKEL: 0.94,
				STARHAUL_DATA_LIB.COPPER: 0.9,
				STARHAUL_DATA_LIB.TITANIUM: 1.0,
				STARHAUL_DATA_LIB.COBALT: 0.88,
				STARHAUL_DATA_LIB.SILVER: 0.94,
				STARHAUL_DATA_LIB.GOLD: 0.8,
				STARHAUL_DATA_LIB.LINDRITE: 0.68,
				STARHAUL_DATA_LIB.ICE: 0.98,
				STARHAUL_DATA_LIB.CRYSTAL: 1.08,
				STARHAUL_DATA_LIB.SCRAP: 0.74,
			},
			"maps": paladin_maps,
		},
		"blackwake_drift": {
			"name": "Blackwake Drift",
			"description": "A dangerous raider-held fringe system with broken wreck lanes and hostile control.",
			"main_station_map": Vector2i(2, 1),
			"main_station_name": "Blackwake Anchorage",
			"controller": "blackwake",
			"star_type": "Red Dwarf Breaker",
			"resource_biases": {
				STARHAUL_DATA_LIB.ORE: 0.96,
				STARHAUL_DATA_LIB.NICKEL: 1.02,
				STARHAUL_DATA_LIB.COPPER: 0.9,
				STARHAUL_DATA_LIB.TITANIUM: 1.0,
				STARHAUL_DATA_LIB.COBALT: 1.14,
				STARHAUL_DATA_LIB.SILVER: 1.08,
				STARHAUL_DATA_LIB.GOLD: 1.18,
				STARHAUL_DATA_LIB.LINDRITE: 1.1,
				STARHAUL_DATA_LIB.ICE: 0.82,
				STARHAUL_DATA_LIB.CRYSTAL: 0.9,
				STARHAUL_DATA_LIB.SCRAP: 1.18,
			},
			"maps": blackwake_maps,
		},
	}
