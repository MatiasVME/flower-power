extends Node2D

class_name Root

var can_input := false


func _on_detect_input_area_entered(area):
	if area.get_parent() is Objective:
		can_input = true
		


func _on_detect_input_area_exited(area):
	if area.get_parent() is Objective:
		can_input = false
