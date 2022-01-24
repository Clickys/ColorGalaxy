extends KinematicBody2D
onready var hit_explosion = preload("res://HitExplosion.tscn")
onready var destroy_explosion = preload("res://PlaneExplosion.tscn")
onready var spaceship_explosion_sound = preload("res://SpaceshipExplosion.tscn")
onready var health_bar = $HealthBar
onready var tween_hp_bar = $HealthBar/HealthBarTween
onready var hp_bar = $HealthBar
onready var styleBox = $HealthBar.get_stylebox("fg")

var test = StyleBox

var health = 90 setget set_health


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
	self.health -= 30
	if health != 0:
		create_effect_on_hit(area)
	area.get_parent().queue_free()

func set_health(value):
#	var current_progress_bar_color = hp_bar.get("custom_styles/fg").bg_color

	
	tween_hp_bar.interpolate_property(hp_bar, "value", health, value, 2, Tween.TRANS_CUBIC, Tween.EASE_OUT)
	#tween_hp_bar.interpolate_property(hp_bar.get("custom_styles/fg"), "bg_color", hp_bar.get("custom_styles/fg").bg_color, Color(100, 100, 100, 50), 2, Tween.TRANS_CUBIC)
	
	health = value
	tween_hp_bar.start()
	
	if health == 0:
		create_destroy_sound_effect()
		create_destroy_effect()
		queue_free()
