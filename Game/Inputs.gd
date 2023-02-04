extends Node

const REC_ROOT = preload("res://Game/Root/Root.tscn")


func _physics_process(_delta):
	if Input.is_action_just_pressed("ui_left"):
		print("ui_left")
	elif Input.is_action_just_pressed("ui_down"):
		print("ui_down")
	elif Input.is_action_just_pressed("ui_right"):
		print("ui_right")
