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
