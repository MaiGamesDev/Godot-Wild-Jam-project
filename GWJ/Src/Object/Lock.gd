extends Area2D


func _on_Lock_body_entered(body):	
	if $"../../../".is_got_key:
		queue_free()
