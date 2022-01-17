extends Area2D

func _on_body_entered(body: Node) -> void:
	print("gem picked")
	queue_free()
