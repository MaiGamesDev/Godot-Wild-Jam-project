extends Area2D

export var damage = 10

var target = null

onready var animated = $AnimatedSprite
onready var timer = $Timer

func activate():
	timer.start(0.3)
	yield(timer, "timeout")
	
	if target != null and target.has_method("on_hit"):
		target.on_hit(damage)

func _on_body_entered(body: Node) -> void:
	animated.frame = 0
	target = body
	activate()

func _on_Spike_body_exited(_body: Node) -> void:
	target = null
