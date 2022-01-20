extends Area2D

export var point = 1

func _ready() -> void:
	connect("area_entered", self, "_on_area_entered")

func _on_area_entered(area: Area2D) -> void:
	if area.get_parent().has_method("on_gain"):
		area.get_parent().on_gain(point)
	queue_free()
