extends Area2D



func _on_Key_body_entered(body):
	$"../../../".is_got_key = true
	queue_free()
