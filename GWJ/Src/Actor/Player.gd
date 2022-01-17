class_name Player

extends KinematicBody2D

export var speed = 40
export(int) var max_health = 6

var direction = Vector2.ZERO
var velocity = Vector2.ZERO

onready var health = max_health

func _process(_delta: float) -> void:
	direction = Vector2.ZERO
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	direction = direction.normalized()

func _physics_process(_delta: float) -> void:
	velocity = direction * speed
	velocity = move_and_slide(velocity)

func on_hit(damage):
	health -= damage
	print("player health " + str(health))
	if health <= 0:
		print("player dies")
