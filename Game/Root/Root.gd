extends Node2D

class_name Root


func _ready():
	Main.positive_effect.connect(_on_positive_effect)
	Main.input_key.connect(_on_input_key)


func _on_positive_effect():
	$Camera/Anim.play("WII_EFFECT")


func _on_input_key(key):
	match key:
		"left":
			$RootImage.rotation_degrees = 90
		"down":
			$RootImage.rotation_degrees = 0
		"right":
			$RootImage.rotation_degrees = -90

