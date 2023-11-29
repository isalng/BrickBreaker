extends Area2D

class_name DeathZone

signal life_lost

@onready var Life_lost = $LifeLost

func _on_body_entered(body):
	life_lost.emit()
	$LifeLost.play()
