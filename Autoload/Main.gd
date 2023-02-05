extends Node

const VERSION_STR = "0.1.0-GGJ23"

signal positive_effect()
signal negative_effect()

signal input_key(key) # left | down | right

signal going_crazy()
signal going_evil()

var can_input := false

# Dirección hacia donde va
var current_direction := Vector2.ZERO
var last_direction := Vector2.ZERO
var next_direction := Vector2.ZERO

var objectives := []
var dir_index := -1
