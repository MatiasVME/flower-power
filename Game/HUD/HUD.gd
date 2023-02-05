extends CanvasLayer


func _ready():
	Main.input_key.connect(_on_input_key)


func _on_input_key(key):
	print(key)
	$Key.play(key)
