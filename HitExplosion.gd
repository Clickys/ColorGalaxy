extends Node2D

onready var hit_explosion = $AnimatedSprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hit_explosion.play("default")

func _on_AnimatedSprite_animation_finished() -> void:
	queue_free()
