class_name StarhaulData
extends RefCounted


# --- Item ids ---
const ORE := &"ore"
const NICKEL := &"nickel"
const COPPER := &"copper"
const TITANIUM := &"titanium"
const COBALT := &"cobalt"
const SILVER := &"silver"
const GOLD := &"gold"
const LINDRITE := &"lindrite"
const IRON_INGOT := &"iron_ingot"
const NICKEL_INGOT := &"nickel_ingot"
const COPPER_INGOT := &"copper_ingot"
const TITANIUM_INGOT := &"titanium_ingot"
const COBALT_INGOT := &"cobalt_ingot"
const SILVER_INGOT := &"silver_ingot"
const GOLD_INGOT := &"gold_ingot"
const LINDRITE_INGOT := &"lindrite_ingot"
const CRYSTAL := &"crystal"
const ICE := &"ice"
const SCRAP := &"scrap"
const ALLOY := &"alloy"
const FOCUS_CRYSTAL := &"focus_crystal"
const FUEL_CELL := &"fuel_cell"
const CIRCUIT := &"circuit"
const CONDUIT_WIRE := &"conduit_wire"
const HULL_PLATE := &"hull_plate"
const THRUSTER_NOZZLE := &"thruster_nozzle"
const SENSOR_LENS := &"sensor_lens"
const GUIDANCE_CHIP := &"guidance_chip"
const IRIDIUM := &"iridium"
const QUANTUM_SHARD := &"quantum_shard"
const HELIUM3 := &"helium3"
const ANCIENT_RELIC := &"ancient_relic"
const BLACKWAKE_TAG := &"blackwake_tag"
const TARGETING_ARRAY := &"targeting_array"
const PLASMA_COIL := &"plasma_coil"


# --- Shared lists ---
const RESEARCH_TREE_BRANCHES := [
	{"id": "propulsion", "name": "Propulsion", "color": Color(0.58, 0.9, 1.0)},
	{"id": "industry", "name": "Industry", "color": Color(0.99, 0.82, 0.45)},
	{"id": "systems", "name": "Systems", "color": Color(0.78, 0.88, 1.0)},
	{"id": "salvage", "name": "Salvage", "color": Color(0.92, 0.68, 0.54)},
	{"id": "combat", "name": "Combat", "color": Color(1.0, 0.45, 0.42)},
]

const ITEM_ORDER := [
	ORE,
	NICKEL,
	COPPER,
	TITANIUM,
	COBALT,
	SILVER,
	GOLD,
	LINDRITE,
	IRON_INGOT,
	NICKEL_INGOT,
	COPPER_INGOT,
	TITANIUM_INGOT,
	COBALT_INGOT,
	SILVER_INGOT,
	GOLD_INGOT,
	LINDRITE_INGOT,
	CRYSTAL,
	ICE,
	SCRAP,
	ALLOY,
	FOCUS_CRYSTAL,
	FUEL_CELL,
	CIRCUIT,
	CONDUIT_WIRE,
	HULL_PLATE,
	THRUSTER_NOZZLE,
	SENSOR_LENS,
	GUIDANCE_CHIP,
	IRIDIUM,
	QUANTUM_SHARD,
	HELIUM3,
	ANCIENT_RELIC,
	BLACKWAKE_TAG,
	TARGETING_ARRAY,
	PLASMA_COIL,
]

const METALLIC_ORE_TYPES: Array[StringName] = [ORE, NICKEL, COPPER, TITANIUM, COBALT, SILVER, GOLD, LINDRITE]


# --- Factions ---
const FACTIONS := {
	"paladins": {
		"name": "Paladins",
		"description": "Lawful protectors and convoy wardens operating near core stations.",
		"color": Color(0.78, 0.88, 1.0),
	},
	"freeport_assembly": {
		"name": "Freeport Assembly",
		"description": "Neutral station brokers, dock officials, and civic trade coordinators.",
		"color": Color(0.78, 0.94, 0.88),
	},
	"blackwake": {
		"name": "Othren",
		"description": "A ruthless cult faction whose minds were twisted by something unknown in the void. They ramble about seeing the truth and spreading it to all.",
		"color": Color(1.0, 0.54, 0.54),
	},
	"deepcore_consortium": {
		"name": "Deepcore Consortium",
		"description": "Industrial mining contracts, extraction quotas, and heavy ore logistics.",
		"color": Color(0.95, 0.82, 0.48),
	},
	"recovery_corps": {
		"name": "Recovery Corps",
		"description": "Licensed wreck recovery, debris claims, and derelict salvage operations.",
		"color": Color(0.88, 0.72, 0.58),
	},
	"pathfinder_initiative": {
		"name": "Pathfinder Initiative",
		"description": "Survey crews, long-range scanners, and frontier route exploration teams.",
		"color": Color(0.5, 0.9, 1.0),
	},
}

const FACTION_RANK_DATA := [
	{"name": "Outsider", "min_rep": 0},
	{"name": "Recruit", "min_rep": 1},
	{"name": "Cadet", "min_rep": 30},
	{"name": "Operative", "min_rep": 70},
	{"name": "Veteran", "min_rep": 120},
	{"name": "Commander", "min_rep": 180},
]

const FACTION_SERVICE_PLANS := {
	"paladins": [
		{"rank": "Cadet", "service": "Security locker and sanctioned repair contracts"},
		{"rank": "Operative", "service": "Weapons desk and patrol dispatch access"},
		{"rank": "Veteran", "service": "Restricted hull refit inventory"},
	],
	"freeport_assembly": [
		{"rank": "Cadet", "service": "Broker desk with preferred fuel and trade rates"},
		{"rank": "Operative", "service": "Priority commodity exchange listings"},
		{"rank": "Veteran", "service": "Merchant lounge and premium freight board"},
	],
	"blackwake": [
		{"rank": "Cadet", "service": "Cult courier contacts and hidden rendezvous routes"},
		{"rank": "Operative", "service": "Veiled market access and intercepted supply caches"},
		{"rank": "Veteran", "service": "Shrine-deck favors and forbidden refit privileges"},
	],
	"deepcore_consortium": [
		{"rank": "Cadet", "service": "Industrial foundry contracts"},
		{"rank": "Operative", "service": "Heavy shipyard fabrication queue"},
		{"rank": "Veteran", "service": "Consortium extraction hardware reserve"},
	],
	"recovery_corps": [
		{"rank": "Cadet", "service": "Licensed salvage claims desk"},
		{"rank": "Operative", "service": "Quarantine wreck permits"},
		{"rank": "Veteran", "service": "Restricted derelict recovery archives"},
	],
	"pathfinder_initiative": [
		{"rank": "Cadet", "service": "Survey office and route chart updates"},
		{"rank": "Operative", "service": "Long-range anomaly desk"},
		{"rank": "Veteran", "service": "Pathfinder navigation core library"},
	],
}


# --- Progression ---
const SKILL_TREE_LOCKS := {
	"prospector": ["combat", "broker"],
	"broker": ["prospector", "combat"],
	"combat": ["prospector", "broker"],
	"salvager": [],
	"operator": [],
}

const SKILL_TREE_NODES := [
	{"id": "prospector_yield", "tree": "prospector", "title": "Extraction Discipline", "tier": 1, "max_rank": 3, "description": "Improves mining output and extraction pressure.", "effect_key": "mining_power_bonus", "effect_per_rank": 0.12},
	{"id": "prospector_rare", "tree": "prospector", "title": "Deep Core Reading", "tier": 1, "max_rank": 3, "description": "Raises rare-find probability while mining.", "effect_key": "rare_find_bonus", "effect_per_rank": 0.03},
	{"id": "prospector_focus", "tree": "prospector", "title": "Focused Array", "tier": 2, "max_rank": 2, "description": "Further tightens extraction control for richer pulls.", "effect_key": "mining_power_bonus", "effect_per_rank": 0.18, "requires": ["prospector_yield"]},
	{"id": "prospector_mastery", "tree": "prospector", "title": "Survey Mastery", "tier": 3, "max_rank": 2, "description": "Pushes prospecting into a dedicated specialist lane.", "effect_key": "rare_find_bonus", "effect_per_rank": 0.05, "requires": ["prospector_focus", "prospector_rare"]},
	{"id": "operator_burn", "tree": "operator", "title": "Burn Management", "tier": 1, "max_rank": 3, "description": "Cuts standard flight fuel drain.", "effect_key": "fuel_burn_reduction", "effect_per_rank": 0.08},
	{"id": "operator_boost", "tree": "operator", "title": "Boost Routing", "tier": 1, "max_rank": 3, "description": "Makes boost bursts cheaper to maintain.", "effect_key": "boost_burn_reduction", "effect_per_rank": 0.09},
	{"id": "operator_jump", "tree": "operator", "title": "Jump Coil Trim", "tier": 2, "max_rank": 3, "description": "Lowers local map-jump fuel costs.", "effect_key": "map_jump_cost_reduction", "effect_per_rank": 0.1, "requires": ["operator_burn"]},
	{"id": "operator_hold", "tree": "operator", "title": "Field Logistics", "tier": 3, "max_rank": 2, "description": "Adds a meaningful cargo margin for longer expeditions.", "effect_key": "cargo_capacity_bonus", "effect_per_rank": 16.0, "requires": ["operator_jump"]},
	{"id": "broker_market", "tree": "broker", "title": "Market Sense", "tier": 1, "max_rank": 3, "description": "Improves sale returns at the exchange.", "effect_key": "sale_price_bonus", "effect_per_rank": 0.04},
	{"id": "broker_contracts", "tree": "broker", "title": "Contract Law", "tier": 1, "max_rank": 3, "description": "Boosts credit payouts from completed contracts.", "effect_key": "mission_credit_bonus", "effect_per_rank": 0.05},
	{"id": "broker_refinery", "tree": "broker", "title": "Refinery Bargains", "tier": 2, "max_rank": 3, "description": "Negotiates down per-item refinery fees.", "effect_key": "refinery_fee_discount", "effect_per_rank": 0.05, "requires": ["broker_market"]},
	{"id": "broker_network", "tree": "broker", "title": "Network Pull", "tier": 3, "max_rank": 2, "description": "Increases mission reputation yields through broker leverage.", "effect_key": "mission_rep_bonus", "effect_per_rank": 1.0, "requires": ["broker_refinery", "broker_contracts"]},
	{"id": "salvager_lockers", "tree": "salvager", "title": "Locker Sweep", "tier": 1, "max_rank": 3, "description": "Improves boarding recoveries and loose loot pulls.", "effect_key": "boarding_loot_bonus", "effect_per_rank": 0.15},
	{"id": "salvager_cache", "tree": "salvager", "title": "Cache Breakers", "tier": 1, "max_rank": 3, "description": "Raises derelict cache burst yields.", "effect_key": "derelict_cache_bonus", "effect_per_rank": 0.14},
	{"id": "salvager_recovery", "tree": "salvager", "title": "Recovery Hands", "tier": 2, "max_rank": 3, "description": "Improves salvage output from derelict mining runs.", "effect_key": "salvage_yield_bonus", "effect_per_rank": 0.08, "requires": ["salvager_lockers"]},
	{"id": "salvager_breach", "tree": "salvager", "title": "Breach Team", "tier": 3, "max_rank": 2, "description": "Turns recovered hulks into richer specialist salvage.", "effect_key": "boarding_loot_bonus", "effect_per_rank": 0.2, "requires": ["salvager_recovery", "salvager_cache"]},
	{"id": "combat_target", "tree": "combat", "title": "Target Paint", "tier": 1, "max_rank": 3, "description": "Speeds missile lock confirmation.", "effect_key": "lock_speed_bonus", "effect_per_rank": 0.12},
	{"id": "combat_racks", "tree": "combat", "title": "Rack Discipline", "tier": 1, "max_rank": 3, "description": "Cuts special-weapon cooldowns.", "effect_key": "missile_cooldown_reduction", "effect_per_rank": 0.08},
	{"id": "combat_integrity", "tree": "combat", "title": "Hardline Training", "tier": 2, "max_rank": 3, "description": "Raises effective hull integrity under combat load.", "effect_key": "hull_bonus", "effect_per_rank": 4.0, "requires": ["combat_target"]},
	{"id": "combat_bounty", "tree": "combat", "title": "Hunter's Ledger", "tier": 3, "max_rank": 2, "description": "Improves bounty value and hostile drop quality.", "effect_key": "bounty_bonus", "effect_per_rank": 0.15, "requires": ["combat_integrity", "combat_racks"]},
]


# --- Guided onboarding text ---
const ONBOARDING_STEP_ORDER := ["move", "scan", "mine", "inventory", "dock", "sell", "mission"]

const ONBOARDING_STEP_DATA := {
	"move": {
		"title": "Helm Check",
		"hint": "Move the ship through open space.",
		"control": "Mouse + W/S/A/D",
		"brief_title": "Flight Control Briefing",
		"brief_body": "The mouse sets the ship's facing. You handle thrust and strafing. Point the nose where you want to look, then use W and S for forward or reverse thrust and A and D to strafe around targets.",
	},
	"scan": {
		"title": "Target Scan",
		"hint": "Left click a nearby object to scan it.",
		"control": "LMB",
		"brief_title": "Sensor Briefing",
		"brief_body": "Targeted scans are your close-range inspection tool. Put the cursor over a node, derelict, or contact and left click to pull a direct readout from that object.",
	},
	"mine": {
		"title": "Extraction Run",
		"hint": "Hold right mouse near a resource node to mine it.",
		"control": "Hold RMB",
		"brief_title": "Mining Briefing",
		"brief_body": "Once you are close to a resource node, hold right mouse to begin extraction. Stay near the target and let the mining rig pulse until cargo starts coming in.",
	},
	"inventory": {
		"title": "Cargo Review",
		"hint": "Open cargo and inspect what you collected.",
		"control": "I",
		"brief_title": "Cargo Briefing",
		"brief_body": "Your hold tracks weight, not simple slots. Open the cargo panel to confirm what you mined and get used to checking the manifest before you dock or take contracts.",
	},
	"dock": {
		"title": "Dock Procedure",
		"hint": "Dock at the local station.",
		"control": "E / Dock",
		"brief_title": "Docking Briefing",
		"brief_body": "Approach the station until the docking request appears. Confirm the prompt and the station will pull you in. Docking is where you sell cargo, accept contracts, and service the ship.",
	},
	"sell": {
		"title": "First Sale",
		"hint": "Use the Commodity Exchange to sell your mined cargo.",
		"control": "Station Menu",
		"brief_title": "Exchange Briefing",
		"brief_body": "Inside the station, head to the Commodity Exchange. That room is where raw cargo becomes credits. Follow the gold guidance if you need help finding the right button.",
	},
	"mission": {
		"title": "First Contract",
		"hint": "Open the Mission Board and accept a posted contract.",
		"control": "Station Menu",
		"brief_title": "Contract Briefing",
		"brief_body": "The Mission Board is how you turn routine flights into real progression. Open the board, review an available contract, and accept one to start tracking a live objective.",
	},
}


# --- UI text / labels ---
const ROOM_TOOLTIPS := {
	"exchange": {"name": "Commodity Exchange", "description": "Sell cargo"},
	"storage": {"name": "Station Storage", "description": "Store cargo"},
	"refinery": {"name": "Refinery", "description": "Refine goods"},
	"crafting": {"name": "Fabrication Bay", "description": "Craft goods"},
	"shipyard": {"name": "Shipyard", "description": "Upgrade ship"},
	"crew": {"name": "Training", "description": "Pilot skill tree"},
	"research": {"name": "Research", "description": "Upload scan data"},
	"factions": {"name": "Pilot Profile", "description": "Level + standings"},
	"mission": {"name": "Mission Board", "description": "Select contracts"},
	"cargo": {"name": "Cargo Hold", "description": "Inspect cargo"},
}

const STATION_GREETINGS := [
	"Welcome back, pilot.",
	"Docking control welcomes you aboard.",
	"Station services are ready for your shift.",
	"Good to see you back in one piece, pilot.",
	"Orbital Dock is standing by for your next run.",
	"Clear skies and clean docking, captain.",
]


# --- Economy / crafting / salvage data ---
const ITEM_DATA := {
	ORE: {"name": "Iron Ore", "description": "Reliable ferrous ore used across every foundry lane.", "value": 6, "weight": 5.8, "fill": Color(0.69, 0.72, 0.8), "accent": Color(0.35, 0.4, 0.56)},
	NICKEL: {"name": "Nickel Ore", "description": "Industrial nickel nodules commonly blended into durable alloys.", "value": 8, "weight": 6.4, "fill": Color(0.76, 0.78, 0.7), "accent": Color(0.45, 0.47, 0.36)},
	COPPER: {"name": "Copper Ore", "description": "Conductive reddish ore favored by line crews and fabricators.", "value": 9, "weight": 6.5, "fill": Color(0.88, 0.6, 0.44), "accent": Color(0.54, 0.28, 0.17)},
	TITANIUM: {"name": "Titanium Ore", "description": "Dense aerospace-grade ore requiring stronger extraction heads.", "value": 13, "weight": 3.8, "fill": Color(0.78, 0.82, 0.9), "accent": Color(0.4, 0.46, 0.58)},
	COBALT: {"name": "Cobalt Ore", "description": "Deep blue industrial ore with strong battery and reactor demand.", "value": 14, "weight": 6.6, "fill": Color(0.46, 0.66, 0.96), "accent": Color(0.18, 0.31, 0.58)},
	SILVER: {"name": "Silver Ore", "description": "High-value conductive ore pulled from cleaner premium seams.", "value": 18, "weight": 7.8, "fill": Color(0.88, 0.9, 0.96), "accent": Color(0.54, 0.57, 0.68)},
	GOLD: {"name": "Gold Ore", "description": "Rich noble-metal pockets prized by brokers and precision fabricators.", "value": 26, "weight": 10.8, "fill": Color(0.96, 0.84, 0.4), "accent": Color(0.62, 0.48, 0.14)},
	LINDRITE: {"name": "Lindrite Ore", "description": "A rare luminous ore body with unusually stable high-energy lattice bands.", "value": 34, "weight": 6.9, "fill": Color(0.9, 0.66, 0.88), "accent": Color(0.52, 0.24, 0.5)},
	IRON_INGOT: {"name": "Iron Ingot", "description": "Refined ferrous stock ready for fabrication.", "value": 12, "weight": 3.4, "fill": Color(0.72, 0.75, 0.82), "accent": Color(0.4, 0.44, 0.56)},
	NICKEL_INGOT: {"name": "Nickel Ingot", "description": "Refined nickel billet for alloy and systems work.", "value": 15, "weight": 3.6, "fill": Color(0.78, 0.8, 0.72), "accent": Color(0.46, 0.48, 0.38)},
	COPPER_INGOT: {"name": "Copper Ingot", "description": "Conductive copper stock for wiring and precision parts.", "value": 16, "weight": 3.5, "fill": Color(0.9, 0.62, 0.45), "accent": Color(0.58, 0.31, 0.2)},
	TITANIUM_INGOT: {"name": "Titanium Ingot", "description": "Aerospace-grade titanium feedstock.", "value": 22, "weight": 2.5, "fill": Color(0.8, 0.84, 0.92), "accent": Color(0.44, 0.5, 0.62)},
	COBALT_INGOT: {"name": "Cobalt Ingot", "description": "Refined cobalt stock for reactor and thruster work.", "value": 23, "weight": 3.4, "fill": Color(0.49, 0.69, 0.99), "accent": Color(0.21, 0.34, 0.61)},
	SILVER_INGOT: {"name": "Silver Ingot", "description": "High-purity silver used in optics and guidance hardware.", "value": 28, "weight": 4.1, "fill": Color(0.9, 0.92, 0.98), "accent": Color(0.58, 0.62, 0.72)},
	GOLD_INGOT: {"name": "Gold Ingot", "description": "Premium precious-metal stock for precision electronics.", "value": 39, "weight": 5.2, "fill": Color(0.99, 0.86, 0.44), "accent": Color(0.68, 0.52, 0.16)},
	LINDRITE_INGOT: {"name": "Lindrite Ingot", "description": "Stabilized lindrite stock with a faint internal glow.", "value": 50, "weight": 3.6, "fill": Color(0.95, 0.7, 0.92), "accent": Color(0.58, 0.28, 0.56)},
	CRYSTAL: {"name": "Crystal Lattice", "description": "Energy-reactive crystal clusters prized by research buyers.", "value": 11, "weight": 4.0, "fill": Color(0.4, 0.95, 1.0), "accent": Color(0.1, 0.42, 0.56)},
	ICE: {"name": "Volatile Ice", "description": "Cryo-stable ice used in fuel chemistry and life support.", "value": 5, "weight": 3.0, "fill": Color(0.73, 0.9, 1.0), "accent": Color(0.36, 0.56, 0.73)},
	SCRAP: {"name": "Ship Scrap", "description": "Recovered hull fragments and systems salvage.", "value": 4, "weight": 5.0, "fill": Color(0.78, 0.64, 0.53), "accent": Color(0.42, 0.31, 0.26)},
	ALLOY: {"name": "Alloy Plate", "description": "Fabricated industrial plate stock used in hull and station work.", "value": 24, "weight": 4.8, "fill": Color(0.9, 0.84, 0.7), "accent": Color(0.52, 0.46, 0.35)},
	FOCUS_CRYSTAL: {"name": "Focus Crystal", "description": "Refinery-cut crystal ready for precision optics.", "value": 26, "weight": 3.5, "fill": Color(0.75, 0.9, 1.0), "accent": Color(0.36, 0.7, 0.95)},
	FUEL_CELL: {"name": "Fuel Cell", "description": "Processed ice converted into compact fuel stock.", "value": 14, "weight": 2.5, "fill": Color(0.95, 0.93, 0.7), "accent": Color(0.71, 0.66, 0.26)},
	CIRCUIT: {"name": "Circuit Bundle", "description": "Recovered components cleaned and reassembled for resale.", "value": 13, "weight": 3.0, "fill": Color(0.67, 0.91, 0.71), "accent": Color(0.28, 0.5, 0.33)},
	CONDUIT_WIRE: {"name": "Conduit Wire", "description": "Shielded wiring spools for ship systems and fittings.", "value": 28, "weight": 2.2, "fill": Color(0.98, 0.7, 0.42), "accent": Color(0.62, 0.32, 0.14)},
	HULL_PLATE: {"name": "Hull Plate", "description": "Reinforced plating sections cut for hull and armor fabrication.", "value": 34, "weight": 5.6, "fill": Color(0.82, 0.86, 0.93), "accent": Color(0.4, 0.46, 0.58)},
	THRUSTER_NOZZLE: {"name": "Thruster Nozzle", "description": "Heat-tolerant exhaust assembly for maneuvering systems.", "value": 40, "weight": 4.1, "fill": Color(0.76, 0.82, 0.92), "accent": Color(0.28, 0.36, 0.58)},
	SENSOR_LENS: {"name": "Sensor Lens", "description": "Precision optics cut for scanners and targeting packages.", "value": 42, "weight": 2.1, "fill": Color(0.76, 0.94, 1.0), "accent": Color(0.42, 0.72, 0.94)},
	GUIDANCE_CHIP: {"name": "Guidance Chip", "description": "Compact avionics package used in seeker and nav assemblies.", "value": 52, "weight": 1.8, "fill": Color(0.98, 0.82, 0.54), "accent": Color(0.32, 0.52, 0.62)},
	IRIDIUM: {"name": "Iridium Core", "description": "Rare dense metal inclusion hidden in ore asteroids.", "value": 40, "weight": 7.5, "fill": Color(0.98, 0.88, 0.61), "accent": Color(0.67, 0.53, 0.2)},
	QUANTUM_SHARD: {"name": "Quantum Shard", "description": "Exotic crystal fragment pulsing with high-energy resonance.", "value": 50, "weight": 2.5, "fill": Color(0.88, 0.62, 1.0), "accent": Color(0.44, 0.23, 0.65)},
	HELIUM3: {"name": "Helium-3 Cache", "description": "Rare fusion-grade isotope trapped in deep-space ice.", "value": 35, "weight": 2.0, "fill": Color(0.98, 0.76, 0.54), "accent": Color(0.69, 0.37, 0.15)},
	ANCIENT_RELIC: {"name": "Ancient Relay", "description": "High-value relic circuitry pulled from derelict wrecks.", "value": 45, "weight": 4.5, "fill": Color(0.9, 0.78, 0.92), "accent": Color(0.48, 0.28, 0.53)},
	BLACKWAKE_TAG: {"name": "Othren Cipher Tag", "description": "A coded cult ident chip accepted at friendly stations as proof of a cleared hostile contact.", "value": 14, "weight": 0.4, "fill": Color(0.98, 0.42, 0.42), "accent": Color(0.42, 0.08, 0.08)},
	TARGETING_ARRAY: {"name": "Targeting Array", "description": "Recovered combat avionics stripped from hostile tracking suites.", "value": 32, "weight": 2.2, "fill": Color(0.92, 0.48, 0.38), "accent": Color(0.46, 0.12, 0.1)},
	PLASMA_COIL: {"name": "Plasma Coil", "description": "Volatile weapon core salvaged from raider strike craft.", "value": 42, "weight": 3.6, "fill": Color(0.98, 0.67, 0.26), "accent": Color(0.58, 0.26, 0.08)},
}

const RESOURCE_TRAIT_TEMPLATES := [
	{"name": "Dense Vein", "description": "Higher total yield.", "amount_mult": 1.45, "interval_mult": 1.0, "rare_bonus": 0.0},
	{"name": "Volatile Pocket", "description": "Faster extraction and better rare chance.", "amount_mult": 0.92, "interval_mult": 0.78, "rare_bonus": 0.03},
	{"name": "Pristine Deposit", "description": "Cleaner material with elevated rare chance.", "amount_mult": 1.1, "interval_mult": 1.0, "rare_bonus": 0.02},
	{"name": "Fragmented Seam", "description": "Lower reserves but breaks apart quickly.", "amount_mult": 0.72, "interval_mult": 0.7, "rare_bonus": 0.0},
]

const REFINERY_RECIPES := {
	ORE: {"output": IRON_INGOT, "fee": 3},
	NICKEL: {"output": NICKEL_INGOT, "fee": 4},
	COPPER: {"output": COPPER_INGOT, "fee": 4},
	TITANIUM: {"output": TITANIUM_INGOT, "fee": 5},
	COBALT: {"output": COBALT_INGOT, "fee": 5},
	SILVER: {"output": SILVER_INGOT, "fee": 5},
	GOLD: {"output": GOLD_INGOT, "fee": 6},
	LINDRITE: {"output": LINDRITE_INGOT, "fee": 7},
	CRYSTAL: {"output": FOCUS_CRYSTAL, "fee": 5},
	ICE: {"output": FUEL_CELL, "fee": 4},
	SCRAP: {"output": IRON_INGOT, "fee": 3, "random_outputs": [IRON_INGOT, IRON_INGOT, NICKEL_INGOT, COPPER_INGOT]},
}

const CRAFTING_RECIPES := [
	# Optional field support:
	# "requires_node": "research_node_id"
	# Leave starter craftables without a gate so they always show once the player reaches the fabrication room.
	{
		"id": "alloy_plate",
		"title": "Alloy Plate",
		"summary": "General structural plate stock",
		"description": "Presses iron and nickel stock into useful industrial alloy plating for station orders and later fabrication chains.",
		"output": ALLOY,
		"output_count": 1,
		"credit_cost": 22,
		"costs": [{"type": IRON_INGOT, "count": 2}, {"type": NICKEL_INGOT, "count": 1}],
	},
	{
		"id": "conduit_wire",
		"title": "Conduit Wire",
		"summary": "Copper wiring spool",
		"description": "Bundles refined copper into shielded conduit runs suited for electronics and station refits.",
		"output": CONDUIT_WIRE,
		"output_count": 1,
		"credit_cost": 24,
		"costs": [{"type": COPPER_INGOT, "count": 2}],
	},
	{
		"id": "hull_plate",
		"title": "Hull Plate",
		"summary": "Reinforced exterior plating",
		"description": "Combines iron and titanium stock into a tougher plated section for heavy industrial work.",
		"output": HULL_PLATE,
		"output_count": 1,
		"credit_cost": 32,
		"costs": [{"type": IRON_INGOT, "count": 2}, {"type": TITANIUM_INGOT, "count": 1}],
	},
	{
		"id": "thruster_nozzle",
		"title": "Thruster Nozzle",
		"summary": "Engine exhaust assembly",
		"description": "High-heat titanium and cobalt fabrication used for engine housings and maneuvering assemblies.",
		"output": THRUSTER_NOZZLE,
		"output_count": 1,
		"credit_cost": 38,
		"costs": [{"type": TITANIUM_INGOT, "count": 2}, {"type": COBALT_INGOT, "count": 1}],
	},
	{
		"id": "sensor_lens",
		"title": "Sensor Lens",
		"summary": "Optical scanner component",
		"description": "Cuts a focus crystal into a precision silver-mounted lens used in sensor and targeting hardware.",
		"output": SENSOR_LENS,
		"output_count": 1,
		"credit_cost": 42,
		"costs": [{"type": SILVER_INGOT, "count": 1}, {"type": FOCUS_CRYSTAL, "count": 1}],
	},
	{
		"id": "guidance_chip",
		"title": "Guidance Chip",
		"summary": "Compact navigation avionics",
		"description": "Packages precious-metal pathways and cleaned circuitry into a guidance core suitable for precision control systems.",
		"output": GUIDANCE_CHIP,
		"output_count": 1,
		"credit_cost": 54,
		"costs": [{"type": GOLD_INGOT, "count": 1}, {"type": SILVER_INGOT, "count": 1}, {"type": CIRCUIT, "count": 1}],
	},
]

const DERELICT_PROFILES := [
	{
		"id": "small_hulk",
		"name": "Small Hulk",
		"node_name": "Small Derelict",
		"trait_name": "Broken Shuttle",
		"trait_description": "Compact wreck with exposed compartments and a few sealed lockers still intact.",
		"scan_description": "Small drift hull reading weak locker signatures and a narrow boarding breach point.",
		"rare_resource": CIRCUIT,
		"rare_label": "Recovered Circuit",
		"rare_chance": 0.04,
		"amount_min": 4,
		"amount_max": 6,
		"scale_min": 0.86,
		"scale_max": 1.04,
		"cache_drops": [
			{"kind": SCRAP, "amount_min": 1, "amount_max": 3, "weight": 0.4},
			{"kind": CIRCUIT, "amount_min": 1, "amount_max": 1, "weight": 0.35},
			{"kind": FUEL_CELL, "amount_min": 1, "amount_max": 1, "weight": 0.25},
		],
	},
	{
		"id": "courier_hulk",
		"name": "Courier Hulk",
		"node_name": "Derelict Courier",
		"trait_name": "Cold Drift",
		"trait_description": "Fast courier frame with cracked cargo lockers and scattered relay hardware.",
		"scan_description": "Light courier hull drifting dark, with ruptured cargo sleeves and a weak locator ping.",
		"rare_resource": ANCIENT_RELIC,
		"rare_label": "Ancient Relay",
		"rare_chance": 0.05,
		"amount_min": 6,
		"amount_max": 9,
		"scale_min": 1.2,
		"scale_max": 1.45,
		"cache_drops": [
			{"kind": CIRCUIT, "amount_min": 1, "amount_max": 2, "weight": 0.5},
			{"kind": FUEL_CELL, "amount_min": 1, "amount_max": 2, "weight": 0.3},
			{"kind": ANCIENT_RELIC, "amount_min": 1, "amount_max": 1, "weight": 0.2},
		],
	},
	{
		"id": "research_hulk",
		"name": "Research Hulk",
		"node_name": "Derelict Survey Ship",
		"trait_name": "Silent Archive",
		"trait_description": "Survey ship carcass with sealed lab bays and fragile instrumentation still aboard.",
		"scan_description": "Broken survey hull reading faint science locker signatures and unusual power residue.",
		"rare_resource": QUANTUM_SHARD,
		"rare_label": "Quantum Shard",
		"rare_chance": 0.07,
		"amount_min": 5,
		"amount_max": 8,
		"scale_min": 1.18,
		"scale_max": 1.4,
		"cache_drops": [
			{"kind": FOCUS_CRYSTAL, "amount_min": 1, "amount_max": 2, "weight": 0.45},
			{"kind": QUANTUM_SHARD, "amount_min": 1, "amount_max": 1, "weight": 0.2},
			{"kind": CIRCUIT, "amount_min": 1, "amount_max": 2, "weight": 0.35},
		],
	},
	{
		"id": "patrol_hulk",
		"name": "Patrol Hulk",
		"node_name": "Derelict Patrol Craft",
		"trait_name": "Burned Guns",
		"trait_description": "Armed patrol hull with scorched hardpoints and a shattered combat core.",
		"scan_description": "Patrol craft wreck with ruptured weapon conduits and intermittent tactical beacon chatter.",
		"rare_resource": TARGETING_ARRAY,
		"rare_label": "Targeting Array",
		"rare_chance": 0.06,
		"amount_min": 7,
		"amount_max": 10,
		"scale_min": 1.24,
		"scale_max": 1.5,
		"cache_drops": [
			{"kind": TARGETING_ARRAY, "amount_min": 1, "amount_max": 1, "weight": 0.45},
			{"kind": PLASMA_COIL, "amount_min": 1, "amount_max": 1, "weight": 0.18},
			{"kind": SCRAP, "amount_min": 2, "amount_max": 4, "weight": 0.37},
		],
	},
	{
		"id": "freighter_hulk",
		"name": "Freighter Hulk",
		"node_name": "Derelict Freighter",
		"trait_name": "Split Hold",
		"trait_description": "Heavy cargo freighter with torn bulkheads and sealed freight cells still intact.",
		"scan_description": "Large merchant hull showing fractured cargo rings, coolant leaks, and intact freight pods.",
		"rare_resource": HELIUM3,
		"rare_label": "Helium-3 Cache",
		"rare_chance": 0.06,
		"amount_min": 8,
		"amount_max": 12,
		"scale_min": 1.35,
		"scale_max": 1.72,
		"cache_drops": [
			{"kind": ALLOY, "amount_min": 1, "amount_max": 3, "weight": 0.38},
			{"kind": FUEL_CELL, "amount_min": 1, "amount_max": 2, "weight": 0.26},
			{"kind": HELIUM3, "amount_min": 1, "amount_max": 1, "weight": 0.14},
			{"kind": SCRAP, "amount_min": 2, "amount_max": 4, "weight": 0.22},
		],
	},
]
