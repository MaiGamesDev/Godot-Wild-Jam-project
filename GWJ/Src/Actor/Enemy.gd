extends KinematicBody2D

enum{
	IDLE, 
	CHASE
}

export var speed = 10

var state = IDLE
var direction = Vector2.ZERO
var velocity = Vector2.ZERO
var target = null

func _process(_delta: float) -> void:
	match state:
		IDLE:
			direction = Vector2.ZERO
			if target != null:
				state = CHASE
		
		CHASE:
			if target != null:
				direction = (target.global_position - global_position).normalized()
			else:
				state = IDLE

func _physics_process(_delta: float) -> void:
	velocity = direction * speed
	velocity = move_and_slide(velocity)

func _on_DetectZone_body_entered(body: Node) -> void:
	target = body

func _on_DetectZone_body_exited(_body: Node) -> void:
	target = null
