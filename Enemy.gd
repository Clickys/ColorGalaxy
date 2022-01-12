extends KinematicBody2D
onready var hit_explosion = preload("res://HitExplosion.tscn")

func _ready() -> void:
	create_effect_on_hit()
	
func _on_EnemyHurtbox_area_entered(area: Area2D) -> void:
	create_effect_on_hit()
	print(get_tree().current_scene.get_children())
	area.get_parent().queue_free()

func create_effect_on_hit():
	var hit_explosion_i = hit_explosion.instance()
	hit_explosion_i.global_position = global_position
	get_tree().current_scene.get_child(0).get_child(0).add_child(hit_explosion_i)
	
