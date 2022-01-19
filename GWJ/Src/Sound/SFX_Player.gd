extends AudioStreamPlayer


func _on_SFX_Player_finished():
	queue_free()	
	
