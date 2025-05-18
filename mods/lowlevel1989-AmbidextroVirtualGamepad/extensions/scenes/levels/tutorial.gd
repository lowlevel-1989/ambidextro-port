extends "res://scenes/levels/tutorial.gd"


func set_keys():
	super()
	
	input_lrm[0].visible = false
	input_lrm[1].visible = false
	input_lrm[2].visible = false
	controller_lrm[0].visible = true
	controller_lrm[1].visible = true
	controller_lrm[2].visible = true
