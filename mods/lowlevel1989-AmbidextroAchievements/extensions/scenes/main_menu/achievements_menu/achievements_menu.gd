extends Control

var menu_loader: Node
var ui_sounds: Node
var from_pause: bool
var level_loader: Node

func _ready() -> void:
	level_loader = get_tree().root.get_node("MainScene/LevelLoader")
	
	var container = $Container
	for child in container.get_children():
		child.text = "[  ] %s" % child.get_meta("oname")
	
	
	var _achievements_data = level_loader.save_load.get_loaded_data()
	if _achievements_data.has("achievements"):
		var _achievements_dictionary = _achievements_data["achievements"]
		for key in _achievements_dictionary:
			var child = container.get_node_or_null(key)
			if child:
				child.text = "[+] %s" % child.get_meta("oname")
				

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		cancel()

func cancel():
	ui_sounds.play_back()
	menu_loader.settings_to_main()
