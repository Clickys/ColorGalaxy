extends RigidBody2D

var rng = RandomNumberGenerator.new()
var random_velocity = rng.randf_range(100, 600)

func _ready() -> void:
	rng.randomize()
	linear_velocity.x = -random_velocity


