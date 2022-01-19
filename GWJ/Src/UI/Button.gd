extends Button

export(String, FILE) var sound = "res://Asset/Sound/SFX/Button_Pressed.wav"

func _on_pressed():
	var sfx = load("res://Src/Sound/SFX_Player.tscn").instance()
	sfx.stream = load(sound)
	add_child(sfx)
