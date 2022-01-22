extends KinematicBody2D

enum{
	IDLE, 
	CHASE
}

export var speed = 10
export var damage = 1

var state = IDLE
var direction = Vector2.ZERO
var velocity = Vector2.ZERO

var target = null
var area_exit = false
var body_exit = false

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

func _on_DetectZone_area_entered(area: Area2D) -> void:
	area_exit = false
	if target == null:
		target = area.get_parent()

func _on_DetectZone_area_exited(_area: Area2D) -> void:
	area_exit = true
	if body_exit:
		target = null

func _on_DetectZone_body_entered(body: Node) -> void:
	body_exit = false
	if target == null:
		target = body

func _on_DetectZone_body_exited(_body: Node) -> void:
	body_exit = true
	if area_exit:
		target = null

func _on_Hitbox_area_entered(area: Area2D) -> void:
	if area.get_parent().has_method("on_hit"):
		area.get_parent().on_hit(damage)
