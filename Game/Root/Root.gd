extends Node2D

class_name Root


func _ready():
	Main.positive_effect.connect(_on_positive_effect)
	

func _on_positive_effect():
	$Camera/Anim.play("WII_EFFECT")
