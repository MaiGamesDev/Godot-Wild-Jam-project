extends Area2D

export var health_regen = 1

func _on_body_entered(body: Node) -> void:
	if body.has_method("on_hit"):
		body.on_hit(-health_regen)
	queue_free()
