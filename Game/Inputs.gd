extends Node

const REC_ROOT = preload("res://Game/Root/Root.tscn")


func _process(_delta):
	if Input.is_action_just_pressed("ui_left"):
		if Main.can_input:
			if Main.current_direction.normalized().round() == Vector2.LEFT:
				owner.get_node("Clap").play()
				Main.positive_effect.emit()
		else:
			owner.get_node("Wrong").play()
			Main.negative_effect.emit()
	elif Input.is_action_just_pressed("ui_down"):
		if Main.can_input:
			if Main.current_direction.normalized().round() == Vector2.DOWN:
				owner.get_node("Clap").play()
				Main.positive_effect.emit()
		else:
			owner.get_node("Wrong").play()
			Main.negative_effect.emit()
	elif Input.is_action_just_pressed("ui_right"):
		if Main.can_input:
			if Main.current_direction.normalized().round() == Vector2.RIGHT:
				owner.get_node("Clap").play()
				Main.positive_effect.emit()
		else:
			owner.get_node("Wrong").play()
			Main.negative_effect.emit()
