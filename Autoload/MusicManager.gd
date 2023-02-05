extends Node

var current_music

func play(music := "level"):
	match music:
		"level":
			if current_music:
				current_music.stop()
			
			$Level.play()
			current_music = $Level
		"ambient":
			if current_music:
				current_music.stop()
			
			$Ambient.play()
			current_music = $Ambient
