class_name Player

extends KinematicBody2D

signal on_player_hurt(damage)
signal on_point_gain(gained)

export var speed = 40
export var invincible_time = 0.5

var direction = Vector2.ZERO
var velocity = Vector2.ZERO

onready var hurtbox = $Hurtbox
onready var hurtbox_timer = $Hurtbox/Timer

func _ready() -> void:
	connect("on_player_hurt", GameManager, "on_player_hurt")
	connect("on_point_gain", GameManager, "on_point_gain")

func _process(_delta: float) -> void:
	direction = Vector2.ZERO
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	direction = direction.normalized()

func _physics_process(_delta: float) -> void:
	velocity = direction * speed
	velocity = move_and_slide(velocity)

func on_hit(damage):
	emit_signal("on_player_hurt", damage)
	hurtbox.set_deferred("monitorable", false)
	hurtbox_timer.start(invincible_time)

func on_gain(point):
	emit_signal("on_point_gain", point)

func _on_Hurtbox_Timer_timeout() -> void:
	hurtbox.monitorable = true
