extends Node

const SAVE_PATH := "user://savegame.json"

var pending_load_data := {}


func has_save_file() -> bool:
	return FileAccess.file_exists(SAVE_PATH)


func save_game_data(data: Dictionary) -> bool:
	var file := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file == null:
		return false
	file.store_string(JSON.stringify(data))
	file.close()
	return true


func load_game_data() -> Dictionary:
	if not has_save_file():
		return {}
	var file := FileAccess.open(SAVE_PATH, FileAccess.READ)
	if file == null:
		return {}
	var parsed = JSON.parse_string(file.get_as_text())
	file.close()
	if typeof(parsed) != TYPE_DICTIONARY:
		return {}
	return parsed


func queue_load_from_disk() -> bool:
	var loaded := load_game_data()
	if loaded.is_empty():
		return false
	pending_load_data = loaded
	return true


func consume_pending_load() -> Dictionary:
	var loaded := pending_load_data.duplicate(true)
	pending_load_data = {}
	return loaded


func clear_pending_load() -> void:
	pending_load_data = {}


func delete_save() -> void:
	if has_save_file():
		DirAccess.remove_absolute(SAVE_PATH)
	clear_pending_load()


func build_save_summary() -> String:
	var data := load_game_data()
	if data.is_empty():
		return "No save data."
	var profile: Dictionary = data.get("profile", {})
	var location: Dictionary = data.get("location", {})
	var saved_at := str(data.get("saved_at", "Unknown time"))
	return "Level %s  |  %s CR  |  %s / %s  |  Saved %s" % [
		str(profile.get("level", "?")),
		str(profile.get("credits", "?")),
		str(location.get("system_name", "Unknown System")),
		str(location.get("map_name", "Unknown Map")),
		saved_at,
	]
