extends RigidBody2D

onready var enemyHitSound = preload("res://EnemyHitSound.tscn")

func _on_Hitbox_area_entered(area: Area2D) -> void:
	create_hit_sound()

func create_hit_sound():
	var enemy_hit_sound = enemyHitSound.instance()
	get_tree().current_scene.add_child(enemy_hit_sound)
