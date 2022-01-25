extends Node2D


onready var red_spaceship = preload("res://Plane.tscn")
onready var blue_spaceship = preload("res://PlaneBlue.tscn")
onready var green_spaceship = preload("res://PlaneGreen.tscn")
onready var player_hp_bar = $PlayerHPBar
onready var spawn_pos = $SpawnPos

var spaceship_picked

func _ready() -> void:
	spaceship_selected()
	spaceship_picked.connect("reduce_hp_bar", self, "_on_Reduce_hp_bar")
	
func spaceship_selected():
		match GameManager.player_spaceship_choice:
			GameManager.BLUE_SPACESHIP:
				instantiate_spaceship(blue_spaceship)
			GameManager.RED_SPACESHIP:
				instantiate_spaceship(red_spaceship)
			GameManager.GREEN_SPACESHIP:
				instantiate_spaceship(green_spaceship)
	
func instantiate_spaceship(spaceship_type):
	var spaceship_instance = spaceship_type.instance()
	spaceship_picked = spaceship_instance
	spaceship_instance.global_position = spawn_pos.global_position
	get_tree().current_scene.add_child(spaceship_instance)

func _on_Reduce_hp_bar():
	player_hp_bar.health_reduce()
