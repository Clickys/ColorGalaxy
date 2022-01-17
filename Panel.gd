extends Panel

onready var dialog_text = $DialogText

func _ready() -> void:
	$Tween.interpolate_property(self, "rect_position", Vector2(230,720), Vector2(230, 603), 2.0, Tween.TRANS_EXPO, Tween.EASE_IN_OUT)
	$Tween.start()


func _on_Tween_tween_completed(object: Object, key: NodePath) -> void:
	dialog_text.start_typewrite()
