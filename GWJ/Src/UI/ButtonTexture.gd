extends TextureButton

export(String, FILE) var sound = "res://Asset/Sound/SFX/Button_Pressed.wav"
export var db = -15

func _on_pressed():
	var sfx = load("res://Src/Sound/SFX_Player.tscn").instance()
	sfx.stream = load(sound)
	sfx.volume_db = db
	add_child(sfx)
