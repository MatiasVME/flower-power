extends CanvasLayer


func _ready():
	Main.input_key.connect(_on_input_key)
	Main.going_crazy.connect(_on_going_crazy)
	Main.going_evil.connect(_on_going_evil)


func _on_input_key(key):
	$Key.play(key)


func _on_going_crazy():
	$Flower.play("happy")


func _on_going_evil():
	$Flower.play("evil")
