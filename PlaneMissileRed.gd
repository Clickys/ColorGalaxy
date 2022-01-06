extends RigidBody2D

onready var visibility_notifier = $VisibilityNotifier2D

func _physics_process(delta: float) -> void:
	check_if_on_screen()


func check_if_on_screen():
	var is_on_screen = visibility_notifier.is_on_screen()
	if !is_on_screen == true:
		destroy_if_not_screen()

func destroy_if_not_screen():
	queue_free()
