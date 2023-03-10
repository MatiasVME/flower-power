extends Node2D

class_name Root


func _ready():
	Main.positive_effect.connect(_on_positive_effect)
	Main.negative_effect.connect(_on_negative_effect)
	
	Main.input_key.connect(_on_input_key)
	Main.ending.connect(_on_ending)


func _on_positive_effect():
	$Camera/Anim.play("WII_EFFECT")
	$Reforse/Anim.play("Positive")


func _on_negative_effect():
	$Reforse/Anim.play("Negative")


func _on_input_key(key):
	match key:
		"left":
			$RootImage.rotation_degrees = 90
		"down":
			$RootImage.rotation_degrees = 0
		"right":
			$RootImage.rotation_degrees = -90


func _on_ending():
	$Camera.enabled = false
