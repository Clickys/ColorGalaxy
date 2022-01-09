extends Node2D


onready var red_spaceship = preload("res://Plane.tscn")
onready var blue_spaceship = preload("res://PlaneBlue.tscn")
onready var green_spaceship = preload("res://PlaneGreen.tscn")

onready var spawn_pos = $SpawnPos

func _ready() -> void:
	spaceship_selected()
	
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
	spaceship_instance.global_position = spawn_pos.global_position
	get_tree().current_scene.add_child(spaceship_instance)
