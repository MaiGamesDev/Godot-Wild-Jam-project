extends Area2D

export var point = 1

func _on_body_entered(body: Node) -> void:
	if body.has_method("on_gain"):
		body.on_gain(point)
	queue_free()
