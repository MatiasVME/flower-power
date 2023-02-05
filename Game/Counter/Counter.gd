extends Node2D


func _ready():
	MusicManager.play()


func _on_anim_animation_finished(anim_name):
	if anim_name == "Counter":
		Curtain.change_scene_to_file("res://Game/Game.tscn")
