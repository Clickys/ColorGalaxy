extends KinematicBody2D
onready var hit_explosion = preload("res://HitExplosion.tscn")
onready var destroy_explosion = preload("res://PlaneExplosion.tscn")
onready var spaceship_explosion_sound = preload("res://SpaceshipExplosion.tscn")

var health = 3 setget set_health


func create_effect_on_hit(area: Area2D):
	var hit_explosion_i = hit_explosion.instance()
	hit_explosion_i.global_position = area.global_position
	get_tree().current_scene.get_child(0).get_child(0).add_child(hit_explosion_i)
	
func create_destroy_effect():
	var destroy_explosion_i = destroy_explosion.instance()
	destroy_explosion_i.global_position = global_position
	get_tree().current_scene.add_child(destroy_explosion_i)

func create_destroy_sound_effect():
	var destroy_explosion_sound_i = spaceship_explosion_sound.instance()
	get_tree().current_scene.add_child(destroy_explosion_sound_i)
	
func _on_EnemyHurtbox_area_entered(area: Area2D) -> void:
	self.health -= 1
	if health != 0:
		create_effect_on_hit(area)
	area.get_parent().queue_free()

func set_health(value):
	health = value
	if health == 0:
		create_destroy_sound_effect()
		create_destroy_effect()
		queue_free()
