extends Node2D


func setup():
	$Progressbar.max_value = MusicManager.current_music["stream"].get_length()
	$Timer.start()


func _on_timer_timeout():
	$Progressbar.value += 1
	
	if $Progressbar.value == 88: # 75 
		Main.going_crazy.emit()
	elif $Progressbar.value == 104: # 88
		Main.going_evil.emit()
	elif $Progressbar.value == 120: # 120
		Main.ending.emit()
	
	print($Progressbar.value)
