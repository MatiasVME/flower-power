extends Node2D


func _ready():
	MusicManager.play()
	$HUD.get_node("Progressbar").setup()
	
