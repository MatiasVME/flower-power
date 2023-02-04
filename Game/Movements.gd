extends Node

const REC_ROOT = preload("res://Game/Root/Root.tscn")
const REC_ROOT_IMG = preload("res://Game/Root/root_image.tscn")

const IMAGE_SIZE = 80

var objectives := []

# Root
var root

# Dirección hacia donde va
var current_direction := Vector2.ZERO
var last_direction := Vector2.ZERO
var dir_index := -1

var movement := 0

var last_root_position = Vector2.ZERO

func _ready():
	for objective in owner.get_node("Objectives").get_children():
		objectives.append(objective)
	
	root = owner.get_node("Root")
	
	var root_img = REC_ROOT_IMG.instantiate()
	owner.add_child.call_deferred(root_img)
	root_img.global_position.x = 1280.0 / 2.0
	
	change_direction()


func change_direction():
	dir_index += 1
	
	if root and is_instance_valid(root):
		if dir_index < objectives.size():
			last_direction = current_direction
			# Nueva dirección
			current_direction = objectives[dir_index].global_position - root.global_position


func _process(delta):
	if root and is_instance_valid(root):
		root.global_position += delta * (current_direction.normalized()) * 100
		
		if dir_index < objectives.size() and objectives[dir_index].is_root_detected:
			change_direction()
			
			if dir_index < objectives.size():
				objectives[dir_index].is_root_detected = false
	
	# En el caso de que dir_index sea mayor que 0, se puede dibujar el sprite
	if dir_index > 0 and last_root_position != objectives[dir_index - 1].global_position:
		var new_sprite = REC_ROOT_IMG.instantiate()
		owner.add_child(new_sprite)
		last_root_position = objectives[dir_index - 1].global_position
		new_sprite.global_position = last_root_position
		
		if last_direction != current_direction:
			# Cambiar la imagen dependiendo de la dirección
			match last_direction.normalized().round():
				Vector2.DOWN:
					new_sprite["animation"] = "body"
					new_sprite["frame"] = randi_range(0, 3)
					print("DOWN")
				Vector2.RIGHT:
					new_sprite.rotation_degrees = 90
					new_sprite["animation"] = "body"
					new_sprite["frame"] = randi_range(0, 3)
					print("RIGHT")
				Vector2.LEFT:
					new_sprite.rotation_degrees = -90
					new_sprite["animation"] = "body"
					new_sprite["frame"] = randi_range(0, 3)
					print("LEFT")
		else:
			var last_dir_n = last_direction.normalized().round()
			print(":O")
#			if last_dir_n == 
			
		
#		print(last_direction.normalized().round())
	
