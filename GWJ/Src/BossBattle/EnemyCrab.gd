extends Area2D

var state = "walk"

var boss_life = 3
var tween_values = [70, 240]

var phase1_speed = 1.0
var phase2_speed = 2.5
var phase3_speed = 3.5

var shootCool_array = [
	1.0,
	1.8,
	2.5
]


func _ready():
	_start_tween()
	
func _start_tween():
	$Tween.interpolate_property(self, "position:x", tween_values[0], tween_values[1], 4.0, $Tween.TRANS_SINE, $Tween.EASE_IN_OUT)   
	$Tween.start()

func _on_tween_completed(object, key):
	tween_values.invert()
	_start_tween()

func attack():
	state = "attack"
	
	play_attack_sound()
	
	$Sprite.play("attack")
	yield(get_tree().create_timer(0.38),"timeout")
	
	var bullet = load("res://Src/BossBattle/BossBullet.tscn").instance()
	var player = $"../Player"
	var bullet_direction = (player.global_position - global_position).normalized()
	bullet.direction = bullet_direction
	bullet.global_position = $ShootPos.global_position
	get_parent().add_child(bullet)
		


func _on_ShootCool_timeout():
	if state == "walk":
		attack()
	$ShootCool.wait_time = shootCool_array[boss_life - 1]

func hurt():
	state = "hurt"
	boss_life -= 1
	
	play_hurt_sound()
	
	if boss_life < 1:
		die()
	else:
		$Sprite.stop()
		$Tween.stop(self,"position:x")
		$Sprite.frame = 0
		$Sprite.play("hurt")
		
		var speed_array = [
			phase3_speed,
			phase2_speed,
			phase1_speed
		]
		$Tween.playback_speed = speed_array[boss_life - 1]

func die():
	play_die_sound()
	
	$DeathParticle.emitting = true
	$DeathParticle/DeathParticle2.emitting = true
	
	$Tween.stop(self,"position:x")
	$ShootCool.stop()
	$Sprite.play("die")


func _on_animation_finished():
	match $Sprite.animation:
		"attack":
			state = "walk"
		"hurt":
			$Tween.resume(self,"position:x")
			state = "walk"
		"die":
			queue_free()
	if state == "walk":
		$Sprite.frame = 0
		$Sprite.play("walk")
	


func _on_body_entered(body):
	if body is Shell:
		body.queue_free()
		hurt()

func play_hurt_sound():
	var sound_array = [
		load("res://Asset/Sound/SFX/Crab_Pain_3.wav"),
		load("res://Asset/Sound/SFX/Crab_Pain_2.wav"),
		load("res://Asset/Sound/SFX/Crab_Pain_1.wav")
	]
	var sfx = load("res://Src/Sound/SFX_Player.tscn").instance()
	sfx.stream = sound_array[boss_life - 1]
	add_child(sfx)
	
func play_attack_sound():
	var sound_array = [
		load("res://Asset/Sound/SFX/Crab_Attack1.wav"),
		load("res://Asset/Sound/SFX/Crab_Attack2.wav"),
		load("res://Asset/Sound/SFX/Crab_Attack3.wav"),
		load("res://Asset/Sound/SFX/Crab_Attack4.wav")
	]
	var sfx = load("res://Src/Sound/SFX_Player.tscn").instance()
	sfx.stream = sound_array[randi() % sound_array.size()]
	add_child(sfx)
	
func play_die_sound():
	var sound = load("res://Asset/Sound/SFX/Crab_Death.wav")
	var sfx = load("res://Src/Sound/SFX_Player.tscn").instance()
	sfx.stream = sound
	sfx.volume_db = 0
	add_child(sfx)
	
	
