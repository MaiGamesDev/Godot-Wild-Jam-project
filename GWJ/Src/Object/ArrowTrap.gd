extends Area2D

const Arrow = preload("res://Src/Object/Arrow.tscn")

export(int, "Up", "Right", "Down", "Left") var fire_direction

func _ready():
	var directions = [
		"Up",
		"Right",
		"Down",
		"Left"
	]
	$Sprite.animation = directions[fire_direction]

func _on_body_entered(_body: Node) -> void:
	var arrow = Arrow.instance()
	add_child(arrow)
	arrow.start(fire_direction)
	play_shoot_sound()

func play_shoot_sound():
	var sfx = load("res://Src/Sound/SFX_Player.tscn").instance()
	var sound = load("res://Asset/Sound/SFX/Arrow_Shoot_And_Hit.wav")
	sfx.volume_db = 0
	sfx.stream = sound
	add_child(sfx)
