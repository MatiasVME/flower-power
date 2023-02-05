extends Node

var current_music

func play(music := "level"):
	match music:
		"level":
			$Level.play()
			current_music = $Level
