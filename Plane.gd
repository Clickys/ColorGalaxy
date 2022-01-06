extends KinematicBody2D

onready var blue_missile = preload("res://PlaneMissile.tscn")
onready var red_missile = preload("res://PlaneMissileRed.tscn")
onready var green_missile = preload("res://PlaneMissileGreen.tscn")
onready var missile_pos = $MissilePosition

signal fired

var velocity = Vector2.ZERO
var can_fire = true



enum {
	BLUE_MISSILE,
	RED_MISSILE,
	GREEN_MISSILE
}

export (int) var plane_speed = 550
export (int) var plane_accelaration = 1000
export (int) var plane_friction = 20

var missile_state = BLUE_MISSILE

func _physics_process(delta: float) -> void:
	plane_move(delta)
	check_selected_missile()
	plane_shoot(delta)
		
	velocity = move_and_slide(velocity)
	

func plane_move(delta):
	var player_input = Vector2.ZERO
	player_input.y = Input.get_axis("ui_up", "ui_down")
	
	if player_input.y != 0:
		velocity = velocity.move_toward(player_input * plane_speed, plane_accelaration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, plane_friction)	
	
func plane_shoot(delta):
	if can_fire and Input.is_action_just_pressed("ui_right"):
		can_fire = false
		var missile_to_shoot = choose_selected_missile_color()
		missile_to_shoot.global_position = missile_pos.global_position
		get_tree().root.add_child(missile_to_shoot)
		$MissileFireTracking.start()
		emit_signal("fired")

func choose_selected_missile_color():
	var selected_missile
	
	match missile_state:
		BLUE_MISSILE:
			selected_missile = blue_missile.instance()
		GREEN_MISSILE:
			selected_missile = green_missile.instance()
		RED_MISSILE:
			selected_missile = red_missile.instance()
		
	return selected_missile

func check_selected_missile():
	if Input.is_action_just_pressed("green_missile_selected"):
		missile_state = GREEN_MISSILE
	if Input.is_action_just_pressed("red_missile_selected"):
		missile_state = RED_MISSILE
	if Input.is_action_just_pressed("blue_missile_selected"):
		missile_state = BLUE_MISSILE




func _on_MissileFireTracking_timeout() -> void:
	can_fire = true
