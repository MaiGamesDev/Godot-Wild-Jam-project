extends KinematicBody2D

enum{
	IDLE, 
	DASH
}

export var speed = 100
export var damage = 3
export var dash_time = 1

var state = IDLE
var direction = Vector2.ZERO
var velocity = Vector2.ZERO

onready var animated_sprite = $AnimatedSprite
onready var timer = $Timer

func _ready() -> void:
	animated_sprite.play("idle")

func _physics_process(_delta: float) -> void:
	velocity = direction * speed
	velocity = move_and_slide(velocity)

func dash(dir):
	if state == IDLE:
		timer.start(dash_time)
		animated_sprite.play("attack")
		direction = dir
		state = DASH

func _on_DetectUp_area_entered(_area: Area2D) -> void:
	dash(Vector2.UP)

func _on_DetectRight_area_entered(_area: Area2D) -> void:
	animated_sprite.flip_h = true
	dash(Vector2.RIGHT)

func _on_DetectDown_area_entered(_area: Area2D) -> void:
	dash(Vector2.DOWN)

func _on_DetectLeft_area_entered(_area: Area2D) -> void:
	animated_sprite.flip_h = false
	dash(Vector2.LEFT)

func _on_timeout() -> void:
	animated_sprite.play("idle")
	direction = Vector2.ZERO
	state = IDLE

func _on_Hitbox_area_entered(area: Area2D) -> void:
	if area.get_parent().has_method("on_hit"):
		area.get_parent().on_hit(damage)
