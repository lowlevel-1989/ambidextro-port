extends "res://scenes/main/level_loader.gd"


func _manage_keyboard_test():
	Global.mobile = true
	super()
	Global.mobile = false
	
