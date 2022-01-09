extends Control

onready var mouse_btn_red = $Red
onready var mouse_btn_blue = $Blue
onready var mouse_btn_green = $Green
onready var animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var new_dialog = Dialogic.start('entry_scene') 
	get_tree().current_scene.add_child(new_dialog)
	mouse_btn_red.grab_focus()

func _process(delta: float) -> void:
	var focus_btn = get_focus_owner()
	if Input.is_action_just_pressed("ui_accept"):
		mouse_btn_red.grab_focus()
	if focus_btn.name == "Red":
		animation_player.play("AnimateRed")
	elif focus_btn.name == "Green":
		animation_player.play("AnimateGreen")
	else:
		animation_player.play("AnimateBlue")
	
		
