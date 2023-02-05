extends ColorRect


func _on_credits_meta_clicked(meta):
	OS.shell_open(meta)
