extends Node2D


onready var focus_btn = $EntryScene/Blue

func _ready() -> void:
	focus_btn.grab_focus()
	
