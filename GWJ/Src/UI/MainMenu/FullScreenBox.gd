extends CheckBox

func _on_CheckBox_pressed():
	if toggle_mode:
		OS.window_fullscreen = !OS.window_fullscreen
