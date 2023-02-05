extends Node


func play(music := "level"):
	match music:
		"level":
			$Level.play()
