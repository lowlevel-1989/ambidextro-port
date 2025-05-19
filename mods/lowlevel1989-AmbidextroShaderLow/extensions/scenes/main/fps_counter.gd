extends "res://scenes/main/fps_counter.gd"


var _action_1_pressed  := false
var _already_triggered := false

func _process(delta):
	super(delta)
	
	_action_1_pressed = Input.is_action_pressed("_show_fps")
	
	if _action_1_pressed and not _already_triggered:
		_already_triggered = true
		visible = not visible
	
	if not _action_1_pressed:
		_already_triggered = false
