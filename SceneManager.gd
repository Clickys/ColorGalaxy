extends Node2D

const world = preload("res://World.tscn")

onready var transition_scene = $TransitionScreen
onready var entry_scene = $CurrentScene/EntryScene

func _ready() -> void:
	entry_scene.mouse_btn_red.grab_focus()
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		transition_scene.transition()
		
func _on_TransitionScreen_transitioned() -> void:
	$CurrentScene.get_child(0).queue_free()
	$CurrentScene.add_child(world.instance())
