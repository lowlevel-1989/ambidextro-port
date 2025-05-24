extends "res://scenes/main/fps_counter.gd"


var _action_1_pressed  := false
var _already_triggered := false

func _process(delta):
	super(delta)
	
	var action_name = "_show_fps"
	if not InputMap.has_action(action_name):
		return
	
	_action_1_pressed = Input.is_action_pressed(action_name)
	
	if _action_1_pressed and not _already_triggered:
		_already_triggered = true
		visible = not visible
	
	if not _action_1_pressed:
		_already_triggered = false
