extends Area2D

onready var arrow = $Arrow

func _on_body_entered(_body: Node) -> void:
	if arrow != null:
		arrow.fire()
