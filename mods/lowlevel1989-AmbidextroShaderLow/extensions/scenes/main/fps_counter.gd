extends "res://scenes/main/fps_counter.gd"


var _action_1_pressed  := false
var _action_2_pressed  := false
var _already_triggered := false

func _ready():
	visible = false

func _process(delta):
	super(delta)
	
	_action_1_pressed = Input.is_action_pressed("reset")
	_action_2_pressed = Input.is_action_pressed("ui_left_quick") or \
		Input.is_action_just_pressed("ui_right_quick")
	
	if _action_1_pressed and _action_2_pressed and not _already_triggered:
		visible = not visible
		_already_triggered = true
	
	if not _action_1_pressed or not _action_2_pressed:
		_already_triggered = false
		_already_triggered = false
