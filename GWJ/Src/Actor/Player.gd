class_name Player

extends KinematicBody2D

signal on_player_hurt(damage)
signal on_point_gain(gained)

enum {
	WALK,
	DASH
}

export var speed = 40
export var dash_speed = 120

export var dash_time = 0.3
export var dash_cool_time = 1
export var invincible_time = 0.5

var dash_direction = Vector2.DOWN
var direction = Vector2.ZERO
var velocity = Vector2.ZERO

var state = WALK
var can_dash = true

onready var hurtbox = $Hurtbox
onready var hurtbox_timer = $Hurtbox/Timer

onready var sprite = $Sprite
onready var animation_player = $AnimationPlayer

onready var timer = $Timer

func _ready() -> void:
	connect("on_player_hurt", GameManager, "on_player_hurt")
	connect("on_point_gain", GameManager, "on_point_gain")

func _process(_delta: float) -> void:
	direction = Vector2.ZERO
	if state == WALK:
		direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		direction = direction.normalized()
		
		if direction != Vector2.ZERO:
			dash_direction = direction
			
			if direction.x != 0:
				animation_player.play("Walk Side")
				if direction.x > 0:
					sprite.flip_h = false
				elif direction.x < 0:
					sprite.flip_h = true
			elif direction.y > 0:
				animation_player.play("Walk Down")
			elif direction.y < 0:
				animation_player.play("Walk Up")
		else:
			if dash_direction.x != 0:
				animation_player.play("Idle Side")
				if dash_direction.x > 0:
					sprite.flip_h = false
				elif dash_direction.x < 0:
					sprite.flip_h = true
			elif dash_direction.y > 0:
				animation_player.play("Idle Down")
			elif dash_direction.y < 0:
				animation_player.play("Idle Up")
		
		if Input.is_action_just_pressed("ui_accept") and can_dash:
			can_dash = false
			state = DASH
			timer.start(dash_time)

func _physics_process(_delta: float) -> void:
	if state == WALK:
		velocity = direction * speed
	elif state == DASH:
		velocity = dash_direction * dash_speed
	velocity = move_and_slide(velocity)

func on_hit(damage):
	emit_signal("on_player_hurt", damage)
	hurtbox.set_deferred("monitorable", false)
	hurtbox_timer.start(invincible_time)
	
func on_gain(point):
	emit_signal("on_point_gain", point)
	
	play_coin_sound()

func _on_Hurtbox_Timer_timeout() -> void:
	hurtbox.monitorable = true

func _on_timeout() -> void:
	if state == DASH:
		state = WALK
		timer.start(dash_cool_time)
	elif state == WALK:
		can_dash = true
	
func play_coin_sound():
	var sfx = load("res://Src/Sound/SFX_Player.tscn").instance()
	sfx.stream = load("res://Asset/Sound/SFX/Get_Coin.wav")
	sfx.volume_db = 0
	add_child(sfx)
	
	
