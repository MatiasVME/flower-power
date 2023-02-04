extends Marker2D

var is_root_detected := false


func _on_detect_area_area_entered(_area):
	is_root_detected = true
