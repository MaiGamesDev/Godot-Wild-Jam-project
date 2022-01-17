extends Area2D

func _on_body_entered(body: Node) -> void:
	print("algae picked")
	queue_free()
