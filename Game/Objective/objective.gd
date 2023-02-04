extends Marker2D

class_name Objective

var is_root_detected := false


func _on_detect_area_area_entered(area):
	if area.get_parent() is Root:
		is_root_detected = true
