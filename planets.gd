extends RigidBody2D

var rng = RandomNumberGenerator.new()

func _init() -> void:
	rng.randomize()
	var random_velocity = rng.randf_range(300, 600)

	linear_velocity.x = -random_velocity


