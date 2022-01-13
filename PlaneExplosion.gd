extends Node2D

onready var anim = $AnimatedSprite

func _ready() -> void:
	anim.play("default")


