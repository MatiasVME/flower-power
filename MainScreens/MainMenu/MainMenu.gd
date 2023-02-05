extends Control


func _ready():
	$BackgroundVideo.play()


func _on_start_pressed():
	Curtain.change_scene_to_file("res://Game/Counter/Counter.tscn")
