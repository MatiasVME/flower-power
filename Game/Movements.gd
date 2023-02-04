extends Node

const REC_ROOT = preload("res://Game/Root/Root.tscn")
const REC_ROOT_IMG = preload("res://Game/Root/root_image.tscn")

const IMAGE_SIZE = 80
const VELOCITY = 100

# Mover esto a main
var objectives := []
var dir_index := -1

# Root
var root


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
			Main.last_direction = Main.current_direction
			# Nueva dirección
			Main.current_direction = objectives[dir_index].global_position - root.global_position


func _physics_process(delta):
	if root and is_instance_valid(root):
		root.global_position += delta * (Main.current_direction.normalized()) * VELOCITY
		
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
		
		var last_dir_n = Main.last_direction.normalized().round()
		var current_dir_n = Main.current_direction.normalized().round()
		
		if last_dir_n == current_dir_n:
			# Cambiar la imagen dependiendo de la dirección
			match last_dir_n:
				Vector2.DOWN:
					new_sprite.rotation_degrees = 0
					new_sprite["animation"] = "body"
					new_sprite["frame"] = randi_range(0, 3)
				Vector2.RIGHT:
					new_sprite.rotation_degrees = 90
					new_sprite["animation"] = "body"
					new_sprite["frame"] = randi_range(0, 3)
				Vector2.LEFT:
					new_sprite.rotation_degrees = -90
					new_sprite["animation"] = "body"
					new_sprite["frame"] = randi_range(0, 3)
		else:
			new_sprite.rotation_degrees = 0
			if last_dir_n == Vector2.LEFT:
				new_sprite.rotation_degrees = 0
				new_sprite["animation"] = "curve"
			elif current_dir_n == Vector2.LEFT:
				new_sprite["animation"] = "curve"
				new_sprite.flip_v = true
				new_sprite.flip_h = true
			elif current_dir_n == Vector2.RIGHT:
				new_sprite["animation"] = "curve"
				new_sprite.flip_v = true
				new_sprite.flip_h = false
			elif last_dir_n == Vector2.RIGHT:
				new_sprite["animation"] = "curve"
				new_sprite.flip_v = false
				new_sprite.flip_h = true
			elif current_dir_n == Vector2.DOWN:
				new_sprite.rotation_degrees = 0
				new_sprite["animation"] = "body"
				new_sprite["frame"] = randi_range(0, 3)
