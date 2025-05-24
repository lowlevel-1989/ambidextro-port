extends "res://scenes/player/player_chara.gd"

var __disable_particles = false

class DummyParticle extends CPUParticles2D:
	func _set(property, value):
		return false

func _ready():
	__disable_particles = OS.has_environment("SHADER_PASSTHROUGH")
	if __disable_particles:
		ceiling_particles = [
			DummyParticle.new(),
			DummyParticle.new()
		]
	super()

func _manage_movement_particles(direction: float):
	if __disable_particles:
		return
	super(direction)

func _manage_jump_particles(land: bool):
	if __disable_particles:
		return
	super(land)
