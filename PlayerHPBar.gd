extends Control


onready var healthBar = $CanvasLayer/Base/HealthBar
onready var hp_tween = $CanvasLayer/Base/HpReduceTween


	
func health_reduce():
	hp_tween.interpolate_property(healthBar, "value", healthBar.value, healthBar.value - 30, 1, Tween.TRANS_LINEAR, Tween.EASE_IN)	
	hp_tween.start()
