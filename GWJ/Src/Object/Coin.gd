extends Area2D

func _on_body_entered(body: Node) -> void:
	print("coin picked")
	queue_free()
