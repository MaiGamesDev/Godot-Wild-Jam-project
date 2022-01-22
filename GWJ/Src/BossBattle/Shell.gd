extends RigidBody2D
class_name Shell

var direction = Vector2(0,0)
var speed = 135

func _ready():
	if direction.x < 0:
		angular_velocity *= -1
	linear_velocity = speed * direction
