extends CanvasLayer
#
#onready var anim_player = $AnimationPlayer
#
#signal transitioned
#
#func transition():
#	anim_player.play("fade_to_black")
#
#func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
#	if anim_name == "fade_to_black":
#		emit_signal("transitioned")
#		anim_player.play("fade_to_normal")
#
#
#func _on_TransitionScreen_transitioned() -> void:
#	get_tree().change_scene("res://World.tscn")
