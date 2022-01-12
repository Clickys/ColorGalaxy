extends Control

onready var mouse_btn_red = $Red
onready var mouse_btn_blue = $Blue
onready var mouse_btn_green = $Green
onready var animation_player = $AnimationPlayer
onready var option_sound = $OptionSound
onready var start_game_sound = $StartGame

func _ready() -> void:
	var new_dialog = Dialogic.start('entry_scene') 
	get_tree().current_scene.call_deferred("add_child", new_dialog)
	print("entry scene  is ready")
	
func _enter_tree() -> void:
	print("entryscene entered tree")

	
func _process(delta: float) -> void:
	btn_focus_check()
	check_input()	


func btn_focus_check():
	var focus_btn = get_focus_owner()
	if Input.is_action_just_pressed("ui_down"):
		mouse_btn_red.grab_focus()
	if focus_btn.name == "Red":
		animation_player.play("AnimateRed")
	elif focus_btn.name == "Green":
		animation_player.play("AnimateGreen")
	else:
		animation_player.play("AnimateBlue")
		
func _on_Red_pressed() -> void:
	GameManager.player_spaceship_choice = GameManager.RED_SPACESHIP

func _on_Green_pressed() -> void:
	GameManager.player_spaceship_choice = GameManager.GREEN_SPACESHIP


func _on_Blue_pressed() -> void:
	GameManager.player_spaceship_choice = GameManager.BLUE_SPACESHIP

func play_option_sound():
	option_sound.play()

func check_input():
	if Input.is_action_just_pressed("ui_right") or Input.is_action_just_pressed("ui_left"):
		option_sound.play()
	if Input.is_action_just_pressed("ui_accept"):
		start_game_sound.play()
