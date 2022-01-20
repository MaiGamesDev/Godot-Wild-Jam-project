extends Area2D

export var health_regen = 1

func _on_area_entered(area: Area2D) -> void:
	if area.get_parent().has_method("on_hit"):
		area.get_parent().on_hit(-health_regen)
	queue_free()
