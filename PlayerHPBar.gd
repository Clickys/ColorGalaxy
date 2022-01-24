extends Control


onready var healthBar = $CanvasLayer/HealthBar

func health_reduce():
	healthBar.value -= 30

