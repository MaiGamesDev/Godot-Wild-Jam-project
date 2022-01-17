extends Area2D

export var damage = 1
export var speed = 80

var direction = Vector2.ZERO
var velocity = Vector2.ZERO

func _process(delta: float) -> void:
	position = position.move_toward(position + direction, delta * speed)

func fire():
	direction = Vector2.DOWN

func _on_body_entered(body: Node) -> void:
	if body.has_method("on_hit"):
		body.on_hit(damage)
	queue_free()
