extends CanvasLayer

func _on_Panel_dialog_finished() -> void:
	$FinishedDialog.interpolate_property(self, "rect_position", Vector2(230,603), Vector2(230, 800), 2.0, Tween.TRANS_EXPO, Tween.EASE_IN_OUT)
