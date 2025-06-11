extends "res://scenes/main_menu/main_menu_options.gd"

func _process(delta: float) -> void :
	if controller.name == "MainMenu" and Input.is_action_just_pressed("ui_cancel"):
		return
	super(delta)
