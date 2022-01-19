extends Sprite

export var damage = 1
export var speed = 80

var direction = Vector2.ZERO
var velocity = Vector2.ZERO

onready var raycast = $RayCast2D

func _process(delta: float) -> void:
	position = position.move_toward(position + direction, delta * speed)
	if raycast.is_colliding():
		if raycast.get_collider().has_method("on_hit"):
			raycast.get_collider().on_hit(damage)
		queue_free()

func start(dir):
	global_position = get_parent().global_position
	match dir:
		# Up
		0:
			rotation_degrees = 180
			direction = Vector2.UP
		# Right
		1:
			rotation_degrees = 270
			direction = Vector2.RIGHT
		# Down
		2:
			rotation_degrees = 0
			direction = Vector2.DOWN
		# Left
		3:
			rotation_degrees = 90
			direction = Vector2.LEFT

func _on_timeout() -> void:
	queue_free()
