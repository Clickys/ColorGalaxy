extends Label

onready var tween = $DialogTween

func start_typewrite():
	tween.interpolate_property(self, "percent_visible", 0.0 , 1.0, 4, tween.TRANS_CUBIC, tween.EASE_IN_OUT)
	tween.start()
