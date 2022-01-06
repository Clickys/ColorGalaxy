extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var new_dialog = Dialogic.start('entry_scene') 
	get_tree().current_scene.add_child(new_dialog)
