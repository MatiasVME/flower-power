extends Node

const REC_ROOT = preload("res://Game/Root/Root.tscn")


func _process(_delta):
	if Input.is_action_just_pressed("ui_left"):
		if Main.can_input:
			if Main.current_direction == Vector2.LEFT:
				owner.get_node("Clap").play()
				print("wiwiwiwiw")
		else:
			print("OwO")
	elif Input.is_action_just_pressed("ui_down"):
		if Main.can_input:
			if Main.current_direction == Vector2.DOWN:
				owner.get_node("Clap").play()
				print("wiwiwiwiw")
		else:
			print("OwO")
	elif Input.is_action_just_pressed("ui_right"):
		if Main.can_input:
			if Main.current_direction == Vector2.RIGHT:
				owner.get_node("Clap").play()
				print("wiwiwiwiw")
			owner.get_node("Clap").play()
		else:
			print("OwO")
