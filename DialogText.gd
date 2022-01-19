extends Label

onready var tween = $DialogTween

export (float) var percent_start = 0.0
export (float) var percent_finish = 1.0
export (float) var typewrite_duration = 2.0

func start_typewrite():
	tween.interpolate_property(self, "percent_visible", percent_start , percent_finish, typewrite_duration, tween.TRANS_LINEAR, tween.EASE_IN_OUT)
	tween.start()
