extends Control


func _ready():
	$VideoStreamPlayer.play()


func _on_video_stream_player_finished():
	Curtain.change_scene_to_file("res://Game/End/End2.tscn")
