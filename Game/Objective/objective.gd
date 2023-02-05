extends Marker2D

class_name Objective

@export var dir := Vector2.ZERO

var is_root_detected := false

func _on_detect_area_area_entered(area):
	if area.get_parent() is Root:
		is_root_detected = true


func _on_detect_input_body_entered(body):
	if body is Root:
		Main.can_input = true


func _on_detect_input_body_exited(body):
	if body is Root:
		Main.can_input = false


func _on_visible_on_screen_notifier_2d_screen_entered():
	match dir:
		Vector2.LEFT:
			$Follow.rotation_degrees = 90
		Vector2.RIGHT:
			$Follow.rotation_degrees = -90
