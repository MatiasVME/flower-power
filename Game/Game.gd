extends Node2D

var can_print_movement := false

func _on_timer_timeout():
	can_print_movement = not can_print_movement
