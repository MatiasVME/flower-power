extends Control


func _ready():
	$BackgroundVideo.play()
	MusicManager.play("ambient")


func _on_start_pressed():
	Curtain.change_scene_to_file("res://Game/Counter/Counter.tscn")


func _on_background_video_finished():
	$BackgroundVideo.play()


func _on_credits_pressed():
	Curtain.change_scene_to_file("res://MainScreens/CreditScreen/CreditScreen.tscn")
