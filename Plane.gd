extends KinematicBody2D

onready var blue_missile = preload("res://PlaneMissile.tscn")
onready var missile_pos = $MissilePosition


var velocity = Vector2.ZERO
var is_plane_shoot = false

export (int) var plane_speed = 550
export (int) var plane_accelaration = 1000
export (int) var plane_friction = 20

func _physics_process(delta: float) -> void:
	plane_move(delta)
	if Input.is_action_just_pressed("ui_right"):
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
	var plane_blue_missile = blue_missile.instance()
	plane_blue_missile.global_position = missile_pos.global_position
	get_tree().root.add_child(plane_blue_missile)
