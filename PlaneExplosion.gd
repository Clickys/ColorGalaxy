extends Node2D

onready var anim = $AnimatedSprite

func _ready() -> void:
	anim.play("default")

func _on_AnimatedSprite_animation_finished() -> void:
	queue_free()
