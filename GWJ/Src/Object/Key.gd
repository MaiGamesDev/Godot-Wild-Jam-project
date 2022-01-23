extends Area2D



func _on_Key_body_entered(body):
	get_tree().get_root().get_child(1).is_got_key = true
	queue_free()
