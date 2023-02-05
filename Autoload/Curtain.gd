extends Control


func change_scene_to_file(scene):
	$Anim.play("Show")
	get_tree().change_scene_to_file(scene)
