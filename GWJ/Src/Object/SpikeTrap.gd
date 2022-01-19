extends Area2D

export var damage = 1

var target = null

onready var animated = $AnimatedSprite
onready var timer = $Timer

func _on_body_entered(body: Node) -> void:
	animated.frame = 0
	target = body
	timer.start(0.5)

func _on_body_exited(_body: Node) -> void:
	target = null

func _on_timeout() -> void:
	if target != null and target.has_method("on_hit"):
		target.on_hit(damage)
