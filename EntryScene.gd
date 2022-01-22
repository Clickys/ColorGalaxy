extends Control

onready var mouse_btn_red = $Red
onready var mouse_btn_blue = $Blue
onready var mouse_btn_green = $Green
onready var animation_player = $AnimationPlayer
onready var option_sound = $OptionSound
onready var start_game_sound = $StartGame
onready var dialog = $SceneDialogs/Panel
onready var space_exaust_red_anim = $Plane/SpaceShipExaustFire/AnimatedSprite
onready var space_exaust_green_anim = $PlaneGreen/SpaceShipExaustFire/AnimatedSprite
onready var space_exaust_blue_anim = $PlaneBlue/SpaceShipExaustFire/AnimatedSprite

onready var exausts_anim = [space_exaust_red_anim, space_exaust_green_anim, space_exaust_blue_anim]
var active_exaust_anim = "red"

var storymode = {
	"entry_scene": {
		"first_text": "",
		"second_text": ""
	},
	"fight_scene": {
		"first_text": ""
	}
}

func _ready() -> void:
	#var new_dialog = Dialogic.start('entry_scene') 
	#get_tree().current_scene.call_deferred("add_child", new_dialog)
	mouse_btn_red.grab_focus()
	dialog.add_storymode_text("fight_scene", "first_text", "This is a fight scene")
	dialog.start_dialog()
	check_active_exaust("red")
	
func _process(delta: float) -> void:
	btn_focus_check()
	check_input()
	

func btn_focus_check():
	var focus_btn = get_focus_owner()
	if Input.is_action_just_pressed("ui_down"):
		mouse_btn_red.grab_focus()
	if focus_btn.name == "Red":
		animation_player.play("AnimateRed")
		check_active_exaust("red")
	elif focus_btn.name == "Green":
		animation_player.play("AnimateGreen")
		check_active_exaust("green")
	elif focus_btn.name == "Blue":
		animation_player.play("AnimateBlue")
		check_active_exaust("blue")

		
func _on_Red_pressed() -> void:
	GameManager.player_spaceship_choice = GameManager.RED_SPACESHIP

func _on_Green_pressed() -> void:
	GameManager.player_spaceship_choice = GameManager.GREEN_SPACESHIP


func _on_Blue_pressed() -> void:
	GameManager.player_spaceship_choice = GameManager.BLUE_SPACESHIP

func check_active_exaust(active_color):
	if active_color == "red":
		turn_on_red_anim()
	if active_color == "green":
		turn_on_green_anim()
	if active_color == "blue":
		turn_on_blue_anim()
		
func play_option_sound():
	option_sound.play()

func check_input():
	if Input.is_action_just_pressed("ui_right") or Input.is_action_just_pressed("ui_left"):
		option_sound.play()
	if Input.is_action_just_pressed("ui_accept"):
		start_game_sound.play()

func turn_on_red_anim():
	space_exaust_red_anim.visible = true
	space_exaust_blue_anim.visible = false
	space_exaust_green_anim.visible = false
	
func turn_on_green_anim():
	space_exaust_red_anim.visible = false
	space_exaust_blue_anim.visible = false
	space_exaust_green_anim.visible = true

func turn_on_blue_anim():
	space_exaust_red_anim.visible = false
	space_exaust_blue_anim.visible = true
	space_exaust_green_anim.visible = false
