extends KinematicBody2D

var velocity = Vector2.ZERO

export (int) var plane_speed = 550
export (int) var plane_accelaration = 550
export (int) var plane_friction = 20

func _physics_process(delta: float) -> void:
	plane_move(delta)
	
	velocity = move_and_slide(velocity)
	

func plane_move(delta):
	var player_input = Vector2.ZERO
	player_input.y = Input.get_axis("ui_up", "ui_down")
	
	if player_input.y != 0:
		velocity = velocity.move_toward(player_input * plane_speed, plane_accelaration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, plane_friction)
