extends Node2D


onready var pos_1 = $SpawnPosition1
onready var pos_2 = $SpawnPosition2
onready var pos_3 = $SpawnPosition3
onready var planet_one = preload("res://Planet1.tscn")
onready var planet_two = preload("res://Planet2.tscn")
onready var planet_three = preload("res://Planet3.tscn")
onready var planet_four = preload("res://Planet4.tscn")
onready var planet_five = preload("res://Planet5.tscn")
onready var planet_six = preload("res://Planet6.tscn")
onready var planet_seven = preload("res://Planet7.tscn")
onready var planet_eight = preload("res://Planet8.tscn")
onready var planet_nine = preload("res://Planet9.tscn")
onready var planet_ten = preload("res://Planet10.tscn")


onready var spawn_pos = [pos_1, pos_2, pos_3]
onready var spawn_planets = [planet_one, planet_two, planet_three, planet_four, planet_five, planet_six, planet_seven, planet_eight, planet_nine, planet_ten]
var rng = RandomNumberGenerator.new()

func _ready() -> void:
	rng.randomize()



func _on_SpawnTimer_timeout() -> void:
	spawn_planet()


func spawn_planet():
	var spawn_position = spawn_pos[rng.randi_range(0, spawn_pos.size() -1)]
	var planet_instance = spawn_planets[rng.randi_range(0, spawn_planets.size() -1)].instance()
	planet_instance.global_position = spawn_position.global_position
	get_tree().current_scene.add_child(planet_instance)
